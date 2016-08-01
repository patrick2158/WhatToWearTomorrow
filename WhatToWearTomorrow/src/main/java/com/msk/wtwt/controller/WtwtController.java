package com.msk.wtwt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.msk.wtwt.dto.People;
import com.msk.wtwt.service.PeopleService;

@Controller
public class WtwtController {
	
	@Resource(name="peopleService")
	private PeopleService peopleService;
	
	public void setPeopleService(PeopleService peopleService) {
		this.peopleService = peopleService;
	}

	@RequestMapping(value = "/")
	public String goJoin() {
		return "join";
	}
	
	@RequestMapping(value = "/checkId.do")
	public ModelAndView checkId(@RequestParam(value="email") String email) {
		People people =  peopleService.selcetPerson(email);
		boolean flag = false;
		if(people == null) {
			flag = true;
		}
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("flag", flag);
		return mav;
	}
	
	@RequestMapping(value="/join.do")
	public String join(People people, HttpSession session){
		peopleService.addPerson(people);
		session.setAttribute("people", people);
		return "home";
	}
	
	@RequestMapping(value="/login.do")
	public String login(People people, HttpSession session){
		String result = "";
		People p =  peopleService.selcetPerson(people.getEmail());

		if(p != null && (people.getPassword()).equals(p.getPassword())) {
			session.setAttribute("people", p);
			result = "home";
		} else {
			result = "login";
		}
		
		return result;
	}
	
	@RequestMapping(value = "/goLogin.do")
	public String goLogin() {
		return "login";
	}
	
	@RequestMapping(value = "/goHome.do")
	public String goHome() {
		return "home";
	}
	
	@RequestMapping(value = "/goClothes.do")
	public String goClothes() {
		return "clothes";
	}
	
	@RequestMapping(value = "/goFavorites.do")
	public String goFavorites() {
		return "favorites";
	}
	
	@RequestMapping(value = "/goSearch.do")
	public String goSearch() {
		return "search";
	}
}