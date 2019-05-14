package com.increpas.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.tplanner.vo.MemVO;

public class MemDAO {

	@Autowired
	SqlSessionTemplate ss;
	
	// 회원가입 기능
	public boolean addMem(MemVO vo) {
		boolean value = false;
		
		int cnt = ss.insert("mem.addMem", vo);
		if(cnt > 0)
			value = true;
		return value;
	}
}
