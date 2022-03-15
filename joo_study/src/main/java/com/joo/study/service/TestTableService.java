package com.joo.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface TestTableService {
	
	public List<Map<String, Object>> SelectAllList() throws Exception;
}
