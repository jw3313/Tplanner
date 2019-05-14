package com.increpas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.increpas.dao.MemDAO;
import com.tplanner.vo.MemVO;

@Controller
public class AddMemController {
	
	@Autowired
	MemDAO m_dao;
	
	@RequestMapping("/login.inc")
	public String ViewAddMem() {
		return "login";
	}
	
	@RequestMapping(value="/login.inc", method=RequestMethod.GET)
	public ModelAndView AddMem(MemVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean value = m_dao.addMem(vo);
		
		if(value) {
			mv.setViewName("addOk");
		}else
			mv.setViewName("addFail");
		
		return mv;
	}

}
