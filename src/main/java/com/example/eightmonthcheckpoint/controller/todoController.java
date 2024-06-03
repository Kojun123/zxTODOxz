package com.example.eightmonthcheckpoint.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/todo/*")
public class todoController {

    @ResponseBody
    @PostMapping("/save")
    public ResponseEntity<Map<String,Object>> getDetail() throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("LIST",svr.save());

        return ResponseEntity.ok().body(result);
    }
}
