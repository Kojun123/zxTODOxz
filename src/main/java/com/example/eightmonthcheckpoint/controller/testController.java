package com.example.eightmonthcheckpoint.controller;


import com.example.eightmonthcheckpoint.service.testService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/test/*")
public class testController {

    private final testService svr;

    @Autowired
    public testController(testService svr) {
        this.svr = svr;
    }


    @ResponseBody
    @GetMapping("/getList")
    public ResponseEntity<Map<String,Object>> getDetail() throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("LIST",svr.getList());

        return ResponseEntity.ok().body(result);
    }
}
