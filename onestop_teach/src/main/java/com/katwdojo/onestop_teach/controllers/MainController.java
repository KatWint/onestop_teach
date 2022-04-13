package com.katwdojo.onestop_teach.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.katwdojo.onestop_teach.models.LoginUser;
import com.katwdojo.onestop_teach.models.User;
import com.katwdojo.onestop_teach.services.LinkServices;
import com.katwdojo.onestop_teach.services.UserServices;


@Controller
public class MainController {
	
	@Autowired
	private UserServices userServ;
	
	@Autowired
	private LinkServices linkServ;
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser")User newUser, @ModelAttribute("newLogin")LoginUser loginuser) {
		return "index.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid@ModelAttribute("newUser") User newUser, 
			BindingResult result, HttpSession session, @ModelAttribute("newLogin")LoginUser loginuser) {
		userServ.validate(newUser, result);
		if(result.hasErrors()) {
			return "index.jsp";
     }
		userServ.registerUser(newUser);
		session.setAttribute("loggedInUser", newUser);
			return "redirect:/home";
	}
 
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, HttpSession session, @ModelAttribute("newUser") User newUser) {
		userServ.authenticateUser(newLogin, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User loggedInUser=userServ.findByEmail(newLogin.getEmail());
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/home";
	}
 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/home")
	public String homePage(HttpSession session, Model viewReading, Model viewMath, Model viewWorksheets, Model viewWriting) {
		viewReading.addAttribute("reading", linkServ.getByCategory("reading"));
		viewMath.addAttribute("mathematics", linkServ.getByCategory("math"));
		viewWorksheets.addAttribute("worksheets", linkServ.getByCategory("worksheet"));
		viewWriting.addAttribute("writing", linkServ.getByCategory("writing"));
		if(session.getAttribute("loggedInUser")!=null) {
			return "homepage.jsp";
		}else {
			return "redirect:/";
		}
	}
	
}
