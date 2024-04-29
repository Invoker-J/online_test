package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.User;

import java.io.IOException;

import static onlie_test_web_app.config.DBConfig.entityManager;

@WebServlet(value = "/auth/check/email")
public class CheckEmailPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String randomNumber = req.getParameter("randomNumber");

        HttpSession session = req.getSession();
        String randomNumber =  session.getAttribute("randomNumber").toString();
        User temporaryUser = (User) session.getAttribute("temporaryUser");
        String password = req.getParameter("password");


        System.out.println("randomNumber = " + randomNumber);
        System.out.println("password = " + password);

        if (randomNumber.equals(password)) {
            entityManager.getTransaction().begin();
            entityManager.persist(temporaryUser);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/index.jsp");
            return;
        } else {
            session.invalidate();
            req.setAttribute("error","Password not equals!");
            resp.sendRedirect("/errPage.jsp");
            System.out.println("Xatolik");
        }

    }
}
