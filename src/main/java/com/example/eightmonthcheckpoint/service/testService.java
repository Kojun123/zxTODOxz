package com.example.eightmonthcheckpoint.service;


import com.example.eightmonthcheckpoint.repository.testRepository;
import com.example.eightmonthcheckpoint.vo.TestVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class testService {

    @Autowired
    testRepository dao;

    public List<Map<String, Object>> getList() {
        return dao.getList();
    }


}
