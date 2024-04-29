package onlie_test_web_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "tests")
public class Test {
    @Id
    @GeneratedValue
    @Column(insertable = true, columnDefinition = "uuid default uuid_generate_v4()")
    private UUID id;

    private String title;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Science science;

    @OneToMany(cascade = CascadeType.PERSIST)
    private List<Question> questions;
}
