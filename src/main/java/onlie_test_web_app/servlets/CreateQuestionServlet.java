package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import onlie_test_web_app.entity.Answer;
import onlie_test_web_app.entity.Question;
import onlie_test_web_app.entity.Test;
import onlie_test_web_app.entity.enums.TestLevel;
import onlie_test_web_app.repo.QuestionRepo;
import onlie_test_web_app.repo.TestRepo;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static onlie_test_web_app.config.DBConfig.entityManager;

@MultipartConfig
@WebServlet(name = "createQuestion", value = "/create/question")
public class CreateQuestionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        entityManager.getTransaction().begin();
        HttpSession session = req.getSession();

        Test currentTest = (Test) session.getAttribute("currentTest");

        Part part = req.getPart("photo");
        InputStream inputStream = part.getInputStream();
        byte[] photo = inputStream.readAllBytes();

        String questionText = req.getParameter("questionText");

        TestLevel level = TestLevel.valueOf(req.getParameter("level"));

        String answer = req.getParameter("answer");

        Question question = new Question();
//        question.setId(UUID.randomUUID());
        question.setPhoto(photo);
        question.setQuestionText(questionText);
        question.setTestLevel(level);

        Answer trueAnswer = new Answer();
        question.setAnswer(trueAnswer);


        entityManager.persist(question);


        currentTest.getQuestions().add(question);

        trueAnswer.setQuestionId(question.getId());
        trueAnswer.setText(answer);


        entityManager.persist(trueAnswer);

        for (int i = 1; i <= 3; i++) {
            Answer falseAnswer = new Answer();
                falseAnswer.setQuestionId(question.getId());
                System.out.println("question.getId() = " + question.getId());
                falseAnswer.setText(req.getParameter("falseAnswer" + i));

                entityManager.persist(falseAnswer);
        }
        resp.sendRedirect("/users/createQuestion.jsp");
        entityManager.getTransaction().commit();
    }
}
