package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//http://localhost:8090/myfinal/helpMain.do

@Controller
public class HelpCController {
	
	@RequestMapping("/helpMain.do")
	public String helpMain() {
		return "helpC";
	}
}
