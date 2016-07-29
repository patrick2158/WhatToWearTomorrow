package com.msk.wtwt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WtwtController {

	@RequestMapping(value = "/enter.do")
	public String enter() {
		return "enter";
	}
	
	@RequestMapping(value = "/")
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