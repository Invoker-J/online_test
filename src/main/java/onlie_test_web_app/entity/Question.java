package onlie_test_web_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import onlie_test_web_app.entity.enums.TestLevel;

import java.util.List;
import java.util.UUID;
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "questions")
public class Question {
    @Id
    @GeneratedValue
    @Column(insertable = true, columnDefinition = "uuid default uuid_generate_v4()")
    private UUID id;
    private String questionText;
    private TestLevel testLevel;
    private byte[] photo;
    @OneToOne(cascade = CascadeType.PERSIST)
    private Answer answer;
}
