package com.example.eightmonthcheckpoint.repository;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

@Repository
public class testRepository {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    private final JdbcTemplate jdbcTemplate;


    public testRepository(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Map<String, Object>> getList() {
        StringBuffer sb = new StringBuffer();

        sb.append("\n  SELECT  * FROM post ");


        logger.debug("test . getList - sql : {}", sb.toString());
        return jdbcTemplate.queryForList(sb.toString());
    }
}
