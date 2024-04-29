package onlie_test_web_app.repo;


import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.User;

import java.util.Optional;
import java.util.UUID;

public class UserRepo extends BaseRepo<User, UUID> {

    public User getUserByCookie(HttpServletRequest request) {
        if (request.getCookies() == null) {
            return null;
        }
        for (Cookie cookie : request.getCookies()) {

            if (cookie.getName().equals("userId")) {
                return findById(UUID.fromString(cookie.getValue()));
            }
        }
        return null;
    }

    public Optional<User> findByEmail(String email) {
        Optional<User> user = findAll().stream()
                .filter(item -> item.getEmail().equals(email))
                .findFirst();
        return user;
    }

    public static User getCurrentUser(HttpServletRequest request, HttpSession session) {
        User user = null;

        Object obj = session.getAttribute("currentUser");
        if (obj != null) {
            user = (User) obj;
        }

        UserRepo userRepo = new UserRepo();
        User optionalUser = userRepo.getUserByCookie(request);
        if (optionalUser != null) {
            user = optionalUser;
        }

        return user;
    }
}