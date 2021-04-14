package com.codingdojo.ct.controllers;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MasterController {
ArrayList<String> activity = new ArrayList<String>(); 
Integer totalGold = 0;
Integer random;

	@RequestMapping("/")
	public String index(HttpSession session) {
		session.setAttribute("count", totalGold);
		session.setAttribute("actions", activity);
		return "index.jsp";
	}
	
	@RequestMapping("/clear")
	public String clear(HttpSession session) {;
		return "redirect:/";
	}
	
	@RequestMapping("/process_money")
	public String processMoney(@RequestParam(value="which_form") String location) {
		Date formatter = new Date();
		if (location.equals("farm")){
			random = (int) (Math.random() * 11) + 10;
			totalGold += random;

			activity.add("You entered the " + location + " and earned " + random +
					" gold ( " + formatter + " )");
			
		}
		if (location.equals("cave")){
			random = (int) (Math.random() * 6) + 5;
			totalGold += random;
			activity.add("You entered the " + location + " and earned " + random +
					" gold ( " + formatter + " )");
		}
		if (location.equals("house")){
			random = (int) (Math.random() * 4) + 2;
			activity.add("You entered the " + location + " and earned " + random +
					" gold ( " + formatter + " )");
			totalGold += random;
		}
		if (location.equals("casino")){
			random = (int) (Math.random() * 101) +(-50) ;
			if(random < 0) {
				activity.add("You entered the " + location + " and lost " + random +
						" gold ( " + formatter + " )");
			}
			else {
				activity.add("You entered the " + location + " and earned " + random +
						" gold ( " + formatter + " )");
			}
			totalGold += random;
		}
		return "redirect:/";
	}
}
