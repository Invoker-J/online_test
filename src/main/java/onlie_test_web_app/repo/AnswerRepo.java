package onlie_test_web_app.repo;

import onlie_test_web_app.entity.Answer;
import onlie_test_web_app.entity.Question;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

public class AnswerRepo extends BaseRepo<Answer, UUID> {

    public  ArrayList<Answer> getAnswers(UUID questionId){
        Question question = findQuestionById(questionId);

        List<Answer> list1 = findAll().stream().filter(answer -> {
            return answer.getQuestionId().equals(question.getId());
        }).toList();


        ArrayList<Answer> list = new ArrayList<>(list1);



        Collections.shuffle(list);
        return list;
    }

    private static Question findQuestionById(UUID questionId) {
        QuestionRepo questionRepo = new QuestionRepo();
        List<Question> all = questionRepo.findAll();

        for (Question question : all) {
            if (question.getId().equals(questionId)) {
                return question;
            }
        }
        return null;
    }
}
