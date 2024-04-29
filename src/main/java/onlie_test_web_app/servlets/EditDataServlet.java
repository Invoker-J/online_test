package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import onlie_test_web_app.entity.User;
import onlie_test_web_app.repo.UserRepo;

import java.io.IOException;

import static onlie_test_web_app.config.DBConfig.entityManager;

@WebServlet(value = "/edit/data")
@MultipartConfig
public class EditDataServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        entityManager.getTransaction().begin();
        User currentUser = UserRepo.getCurrentUser(req, req.getSession());

        UserRepo userRepo = new UserRepo();
        User user = userRepo.findById(currentUser.getId());


        String email = req.getParameter("email");
        Part part = req.getPart("photo");
        if (part!=null) {
            byte[] photo = part.getInputStream().readAllBytes();
            user.setPhoto(photo);
        }
        String password = req.getParameter("password");
        if (password != null) {
            user.setPassword(password);
        }
        String username = req.getParameter("username");
        if (username != null) {
            user.setUsername(username);
        }

        String firstName = req.getParameter("firstName");
        if (firstName != null) {
            user.setFirstName(firstName);
        }
        String lastName = req.getParameter("lastName");
        if (lastName != null) {
            user.setLastName(lastName);
        }

        System.out.println("username = " + username);
        System.out.println("firstName = " + firstName);
        System.out.println("lastName = " + lastName);
        System.out.println("password = " + password);
        System.out.println("email = " + email);

//        user.setEmail(email);
//
//        user.setUsername(username);
//        user.setFirstName(firstName);
//        user.setLastName(lastName);

//        entityManager.persist(user);
        System.out.println("currentUser = " + user);
        resp.sendRedirect("/success.jsp");

    entityManager.getTransaction().commit();
    }
}
