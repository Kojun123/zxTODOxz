package com.example.eightmonthcheckpoint.service;


import com.example.eightmonthcheckpoint.repository.todoRepository;
import com.example.eightmonthcheckpoint.vo.TestVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class todoService {

    @Autowired
    todoRepository dao;

    public Map<String, Object> SAVE (TestVo vo) throws Exception {
        Map<String, Object> result = new HashMap<>();
        result.put("result", 0);
        result.put("message", "정상 처리되었습니다.");

        dao.SAVE(vo);

        return result;
    }


}
