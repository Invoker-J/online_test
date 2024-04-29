package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.Question;
import onlie_test_web_app.entity.User;
import onlie_test_web_app.repo.QuestionRepo;
import onlie_test_web_app.repo.UserRepo;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static onlie_test_web_app.config.DBConfig.entityManager;

@WebServlet(name = "generateTests" , value = "/test/settings")
public class GenerateUserTestsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String scienceId = req.getParameter("scienceId");
        String level = req.getParameter("level");
        String amount = req.getParameter("amount");

        User user = null;

        Object obj = req.getSession().getAttribute("currentUser");
        if (obj != null) {
            user = (User) obj;
        }

        UserRepo userRepo = new UserRepo();
        User optionalUser = userRepo.getUserByCookie(req);
        if (optionalUser!=null) {
            user = optionalUser;
        }

        LocalDateTime currentDateTime = LocalDateTime.now();


        List<Question> questions = new ArrayList<>(QuestionRepo.filterBy(scienceId,level, Integer.valueOf((amount))));
        entityManager.getTransaction().begin();
        user.setTime(currentDateTime.plusMinutes(questions.size()));
        entityManager.getTransaction().commit();
        String orderType = req.getParameter("orderType");
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);
        System.out.println("orderType = " + orderType);

        if (orderType.equalsIgnoreCase("random")) {
            Collections.shuffle(questions);
        }

        HttpSession session = req.getSession();
        session.setAttribute("questions",questions);
        resp.sendRedirect("/test.jsp");


    }
}
