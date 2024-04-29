package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import onlie_test_web_app.entity.User;
import onlie_test_web_app.repo.UserRepo;
import onlie_test_web_app.service.GmailService;

import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

@WebServlet(name = "login", value = "/auth/login")
public class LoginServlet extends HttpServlet {
    GmailService gmailService = GmailService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("rememberMe");

        if (!email.contains("@gmail.com")) {
            resp.sendRedirect("/errPage.jsp");
            return;
        }

        UserRepo userRepo = new UserRepo();
        Optional<User> optional = userRepo.findByEmail(email);
        if (optional.isPresent()) {
            User user = optional.get();
            if (user.getPassword().equals(password)) {
                HttpSession session = req.getSession();
                session.setAttribute("currentUser",user);
                if (Objects.equals(rememberMe, "on")) {
                    Cookie cookie = new Cookie(
                            "currentUser", user.getId().toString()
                    );

                    cookie.setPath("/");
                    cookie.setSecure(false);
                    cookie.setMaxAge(60 * 60);
                    resp.addCookie(cookie);
                }
                resp.sendRedirect("/index.jsp");
                return;
            }
        }
        resp.sendRedirect("/login.jsp");


    }
}
