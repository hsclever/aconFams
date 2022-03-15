package com.joo.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.joo.study.model.mapper.TestTableMapper;

public class TestTableServiceImpl {
	
	@Autowired
    TestTableMapper testtableMapper;
    
    public List<Map<String, Object>> SelectAllList() throws Exception {
        // TODO Auto-generated method stub
        return testtableMapper.SelectAllList();
    }
}
