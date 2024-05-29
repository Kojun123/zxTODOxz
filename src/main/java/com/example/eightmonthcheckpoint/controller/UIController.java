package com.example.eightmonthcheckpoint.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class UIController {


    @RequestMapping(value="/index")
    public String index() {
        return "index";
    }

    @RequestMapping(value="/todoList")
    public String todoList() {
        return "todoList";
    }

}
