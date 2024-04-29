package onlie_test_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.Question;
import onlie_test_web_app.entity.Result;
import onlie_test_web_app.entity.User;
import onlie_test_web_app.repo.UserRepo;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getAnswers", value = "/get/answers")
public class GetAnswerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        List<Result> results = new ArrayList<>();

        User user = null;

        Object obj = session.getAttribute("currentUser");
        if (obj != null) {
            user = (User) obj;
        }

        UserRepo userRepo = new UserRepo();
        User optionalUser = userRepo.getUserByCookie(req);
        if (optionalUser != null) {
            user = optionalUser;
        }
        LocalDateTime userTime = user.getTime();
        LocalDateTime now = LocalDateTime.now();

        if (now.isAfter(userTime)) {
            Duration duration = Duration.between(userTime, now);
            long seconds = duration.getSeconds() + questions.size() * 60L;
            long minutes =  seconds / 60;
            seconds = seconds % 60;
            session.setAttribute("duration", "%02d:%02d".formatted(minutes,seconds));
            req.setAttribute("duration", "%02d:%02d".formatted(minutes,seconds));
            resp.sendRedirect("/errPageForTime.jsp");
//            user.setTime(null);
            return;
        }


        for (Question question : questions) {
            String chosenAnswerId = req.getParameter("" + question.getId());
            Result result = new Result();
            result.setQuestion(question);
            if (question.getAnswer().getId().toString().equals(chosenAnswerId)) {
                result.setResult("✅");
            } else {
                result.setResult("❌");
            }
            results.add(result);
        }

        session.setAttribute("results", results);
        resp.sendRedirect("/resultPage.jsp");
    }
}
