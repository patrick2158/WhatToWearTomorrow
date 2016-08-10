package com.msk.wtwt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.msk.wtwt.dto.Image;
import com.msk.wtwt.dto.Items;
import com.msk.wtwt.dto.Outfits;
import com.msk.wtwt.dto.People;
import com.msk.wtwt.service.ItemsService;
import com.msk.wtwt.service.OutfitsService;
import com.msk.wtwt.service.PeopleService;

@Controller
public class WtwtController {

	@Resource(name="peopleService")
	private PeopleService peopleService;

	@Resource(name="itemsService")
	private ItemsService itemsService;
	
	@Resource(name="outfitsService")
	private OutfitsService outfitsService;

	public void setPeopleService(PeopleService peopleService) {
		this.peopleService = peopleService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public void setOutfitsService(OutfitsService outfitsService) {
		this.outfitsService = outfitsService;
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

	@RequestMapping(value = "/goOutfits.do")
	public ModelAndView goOutfits(HttpSession session) {
		People person = (People) session.getAttribute("person");
		List<Outfits> outfitList = outfitsService.selcetByEmail(person.getEmail());
		
		ModelAndView mav = new ModelAndView("outfits");
		mav.addObject("outfitList", outfitList);
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

	@RequestMapping(value = "/goMakeOutfit.do")
	public ModelAndView goMakeOutfit(HttpSession session) {
		People person = (People) session.getAttribute("person");
		List<Items> itemList = itemsService.selcetByEmail(person.getEmail());

		ModelAndView mav = new ModelAndView("makeOutfit");
		mav.addObject("itemList", itemList);
		return mav;
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
		People person = (People) session.getAttribute("person");
		item.setEmail(person.getEmail());
		itemsService.addItem(item);
		return "redirect:/goClothes.do";
	}

	@RequestMapping(value="/makeOutfit.do")
	public ModelAndView makeOutfit(@RequestParam(value="image") String file) {
		ModelAndView mav = new ModelAndView();
		
		String rootPath = System.getProperty("catalina.home");
		File dir = new File(rootPath + File.separator + "tmpFiles");
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String fileName = System.currentTimeMillis() + (int) Math.random()*10000 + ".png";
		File outFile = new File(dir, fileName);
		
		String data = file.replaceAll("data:image/png;base64,", "");
		byte[] dataFile = Base64.decodeBase64(data);

		try {
			FileOutputStream imageFile = new FileOutputStream(outFile);
			imageFile.write(dataFile);
			imageFile.close();
			mav.setViewName("saveOutfit");
			mav.addObject("img_path", "/img/"+fileName);
		} catch (Exception e) {
			mav.setViewName("makeOutfit");
			mav.addObject("flag", false);
		}
		
		return mav;
	}

	@RequestMapping(value="/saveOutfit.do")
	public String saveOutfit(Outfits outfit, HttpSession session){
		People person = (People) session.getAttribute("person");
		outfit.setEmail(person.getEmail());
		outfitsService.addOutfit(outfit);
		return "redirect:/goOutfits.do";
	}
}