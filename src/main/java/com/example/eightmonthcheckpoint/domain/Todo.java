package com.example.eightmonthcheckpoint.domain;


import com.example.eightmonthcheckpoint.domain.Enum.Priority;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonProperty("title")
    private String title;
    @JsonProperty("description")
    private String description;

    @JsonProperty("priority")
    @Enumerated(EnumType.STRING)
    private Priority priority;
    @JsonProperty("completed")
    private String completed;

    public Todo(String title, String description, Priority priority, String completed) {
        this.title = title;
        this.description = description;
        this.priority = priority;
        this.completed = completed;
    }
}
