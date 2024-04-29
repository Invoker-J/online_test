package onlie_test_web_app.repo;

import onlie_test_web_app.entity.Answer;
import onlie_test_web_app.entity.Question;
import onlie_test_web_app.entity.Test;
import onlie_test_web_app.entity.enums.TestLevel;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class QuestionRepo extends BaseRepo<Question, UUID> {

    public static List<Question> filterBy(String scienceId, String level, Integer amount) {
        TestRepo testRepo = new TestRepo();
        List<Test> tests = testRepo.findAll().stream().filter(item -> {
            return item.getScience().getId().toString().equals(scienceId);
        }).toList();

        List<Question> list = new ArrayList<>();
        for (Test test : tests) {

            for (Question question : test.getQuestions()) {
                if(question.getTestLevel().equals(TestLevel.valueOf(level))){
                    list.add(question);
                }
            }
//            list = test.getQuestions().stream().filter(question -> {
//                return question.getTestLevel().equals(TestLevel.valueOf(level));
//            }).toList();
        };

        if (list.size()<=amount) {
            return list;
        }

        return list.subList(0,amount);
    }

}
