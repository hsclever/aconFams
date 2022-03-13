package com.study.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface MemberMapper {
	List<HashMap> getUserList() throws Exception;
}
