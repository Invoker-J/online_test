package onlie_test_web_app.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.Answer;
import onlie_test_web_app.entity.Question;
import onlie_test_web_app.entity.Test;
import org.hibernate.annotations.processing.Find;

import java.io.IOException;
import java.util.List;

import static onlie_test_web_app.config.DBConfig.entityManager;

@WebServlet(value = "/save/task")
@MultipartConfig
public class SaveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        entityManager.getTransaction().begin();
        HttpSession session = req.getSession();
        List<Question> questions = (List<Question>) session.getAttribute("getListOfQuestions");
        List<Answer> tests = (List<Answer>) session.getAttribute("getListOfAnswers");

        // Save questions
        for (Question question : questions) {
            System.out.println("question = " + question);
            entityManager.persist(question);
        }

        // Save answers
        for (Answer test : tests) {
            System.out.println("test = " + test);
            entityManager.persist(test);
        }

        entityManager.getTransaction().commit();
        resp.sendRedirect("/");
    }
}