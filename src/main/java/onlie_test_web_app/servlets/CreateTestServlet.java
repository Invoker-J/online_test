package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.Science;
import onlie_test_web_app.entity.Test;
import onlie_test_web_app.repo.ScienceRepo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static onlie_test_web_app.config.DBConfig.entityManager;

@WebServlet(name = "createTest", value = "/create/test")
public class CreateTestServlet extends HttpServlet {
    ScienceRepo scienceRepo = new ScienceRepo();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        entityManager.getTransaction().begin();
        String title = req.getParameter("title");
        String id = req.getParameter("scienceId");

        if (title == null||id==null) {
            resp.sendRedirect("/users/createTest.jsp");
            return;
        }
        UUID scienceId = UUID.fromString(id);

        HttpSession session = req.getSession();
        Science byId = scienceRepo.findById(scienceId);

        Test test = new Test();
        test.setQuestions(new ArrayList<>());
        test.setScience(byId);
        test.setTitle(title);

        entityManager.persist(test);

        session.setAttribute("currentTest",test);
        resp.sendRedirect("/users/createQuestion.jsp");
        entityManager.getTransaction().commit();

    }
}
