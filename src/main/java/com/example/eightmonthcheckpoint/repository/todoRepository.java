package com.example.eightmonthcheckpoint.repository;


import com.example.eightmonthcheckpoint.vo.TestVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class todoRepository {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    private final JdbcTemplate jdbcTemplate;


    public todoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void SAVE(TestVo model) throws Exception {
        StringBuffer sb = new StringBuffer();
        ArrayList<Object> values = new ArrayList<>();

        sb.append("\n  INSERT INTO todo (SEQ, TIT, STR_DT, END_DT, CNTE) ");
        sb.append("\n  VALUES ( ");
        sb.append("\n  ? -- seq "); values.add(model.getSEQ());
        sb.append("\n  ,? -- tit "); values.add(model.getTIT());
        sb.append("\n  ,? -- strdt "); values.add(model.getSTR_DT());
        sb.append("\n  ,? -- enddt "); values.add(model.getEND_DT());
        sb.append("\n  ,? -- cnte "); values.add(model.getCNTE());
        sb.append("\n  ) ");

        logger.debug("TODO REPOSITORY INSERT - sql : {}", sb.toString());
        logger.debug("TODO REPOSITORY INSERT - values : {}", values.toArray());
        jdbcTemplate.update(sb.toString(), values.toArray());
    }


}
