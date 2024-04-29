package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import onlie_test_web_app.entity.User;
import onlie_test_web_app.service.GmailService;

import java.io.IOException;
import java.util.Random;
@MultipartConfig
@WebServlet(name = "signUp", value = "/auth/signUp")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Part part = req.getPart("photo");
        byte[] photo = part.getInputStream().readAllBytes();

        String username = req.getParameter("username");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");

        User temporaryUser = User.builder()
                .username(username)
                .lastName(lastName)
                .firstName(firstName)
                .password(password)
                .email(email)
                .photo(photo)
                .build();

        GmailService emailService = GmailService.getInstance();
        int randomNumber = generateSixDigitNumber();
        emailService.sendCodeToGmail(email,randomNumber+"");
//        req.setAttribute("randomNumber",randomNumber);
        HttpSession session = req.getSession();
        session.setAttribute("randomNumber",randomNumber);
        session.setAttribute("temporaryUser",temporaryUser);
        resp.sendRedirect("/users/checkEmail.jsp");
    }
    public static int generateSixDigitNumber() {
        Random random = new Random();
        return random.nextInt(900000) + 100000;
    }
}
