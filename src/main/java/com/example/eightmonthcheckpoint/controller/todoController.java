package com.example.eightmonthcheckpoint.controller;


import com.example.eightmonthcheckpoint.service.todoService;
import com.example.eightmonthcheckpoint.vo.TestVo;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/todo/*")
public class todoController {

    private final todoService svr;

    public todoController(todoService svr) {
        this.svr = svr;
    }

    @ResponseBody
    @PostMapping("/save")
    public ResponseEntity<Map<String,Object>> SAVE(HttpServletRequest req, @RequestBody TestVo vo) throws Exception {
        System.out.println("Received VO: " + vo);

        Map<String, Object> response = new HashMap<>();

        svr.SAVE(vo);
        response.put("status", vo);
        return ResponseEntity.ok(response);
    }

}
