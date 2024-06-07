package com.example.eightmonthcheckpoint.vo;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TestVo {


    @JsonProperty("SEQ")
    private String SEQ;

    @JsonProperty("TIT")
    private String TIT;

    @JsonProperty("STR_DT")
    private String STR_DT;

    @JsonProperty("END_DT")
    private String END_DT;

    @JsonProperty("CNTE")
    private String CNTE;

}
