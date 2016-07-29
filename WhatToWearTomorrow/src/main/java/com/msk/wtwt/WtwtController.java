package com.msk.wtwt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WtwtController {

	@RequestMapping(value = "/")
	public String enter() {
		return "clothes";
	}
}
