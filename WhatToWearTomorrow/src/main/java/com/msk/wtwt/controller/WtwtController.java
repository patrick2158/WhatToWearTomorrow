package com.msk.wtwt.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.msk.wtwt.dto.Image;
import com.msk.wtwt.dto.Items;
import com.msk.wtwt.dto.People;
import com.msk.wtwt.service.ItemsService;
import com.msk.wtwt.service.PeopleService;

@Controller
public class WtwtController {

	@Resource(name="peopleService")
	private PeopleService peopleService;

	@Resource(name="itemsService")
	private ItemsService itemsService;

	public void setPeopleService(PeopleService peopleService) {
		this.peopleService = peopleService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	@RequestMapping(value = "/")
	public String goJoin() {
		return "join";
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
	public ModelAndView goClothes(HttpSession session) {
		People person = (People) session.getAttribute("person");
		List<Items> itemList = itemsService.selcetByEmail(person.getEmail());
		
		ModelAndView mav = new ModelAndView("clothes");
		mav.addObject("itemList", itemList);
		return mav;
	}

	@RequestMapping(value = "/goFavorites.do")
	public String goFavorites() {
		return "favorites";
	}

	@RequestMapping(value = "/goSearch.do")
	public String goSearch() {
		return "search";
	}

	@RequestMapping(value = "/goTakePhoto.do")
	public String goTakePhoto() {
		return "takePhoto";
	}
	@RequestMapping(value = "/goSaveItem.do")
	public String goSaveItem() {
		return "saveItem";
	}

	@RequestMapping(value = "/checkId.do")
	public ModelAndView checkId(@RequestParam(value="email") String email) {
		People person =  peopleService.selcetPerson(email);
		boolean flag = false;
		if(person == null) {
			flag = true;
		}

		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("flag", flag);
		return mav;
	}

	@RequestMapping(value="/join.do")
	public String join(People person, HttpSession session){
		peopleService.addPerson(person);
		session.setAttribute("person", person);
		return "home";
	}

	@RequestMapping(value="/login.do")
	public String login(People person, HttpSession session){
		String result = "";
		People p =  peopleService.selcetPerson(person.getEmail());

		if(p != null && (person.getPassword()).equals(p.getPassword())) {
			session.setAttribute("person", p);
			result = "home";
		} else {
			result = "login";
		}

		return result;
	}

	@RequestMapping(value="/uploadImage.do")
	public ModelAndView uploadImage(Image file) {
		ModelAndView mav = new ModelAndView();
		String fileName;

		try {
			fileName = file.cropImage();
			mav.setViewName("saveItem");
			mav.addObject("img_path", "/img/"+fileName);
		} catch (IOException e) {
			mav.setViewName("takePhoto");
			mav.addObject("flag", false);
		}
		return mav;
	}

	@RequestMapping(value="/saveItem.do")
	public String saveItem(Items item, HttpSession session){
		People person = (People) session.getAttribute("people");
		item.setEmail(person.getEmail());
		itemsService.addItem(item);
		return "redirect:/goClothes.do";
	}

}