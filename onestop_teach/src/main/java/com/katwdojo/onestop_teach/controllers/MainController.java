package com.katwdojo.onestop_teach.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.katwdojo.onestop_teach.models.Comment;
import com.katwdojo.onestop_teach.models.Link;
import com.katwdojo.onestop_teach.models.LoginUser;
import com.katwdojo.onestop_teach.models.User;
import com.katwdojo.onestop_teach.services.CommentServices;
import com.katwdojo.onestop_teach.services.LinkServices;
import com.katwdojo.onestop_teach.services.UserServices;


@Controller
public class MainController {
	
	@Autowired
	private UserServices userServ;
	
	@Autowired
	private LinkServices linkServ;
	
	@Autowired
	private CommentServices commentServ;
	
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
	public String homePage(HttpSession session, Model viewReading, Model viewMath, Model viewWorksheets, Model viewWriting, Model viewComments) {
		viewReading.addAttribute("reading", linkServ.getByCategory("reading"));
		viewMath.addAttribute("mathematics", linkServ.getByCategory("math"));
		viewWorksheets.addAttribute("worksheets", linkServ.getByCategory("worksheet"));
		viewWriting.addAttribute("writing", linkServ.getByCategory("writing"));
		viewComments.addAttribute("comments", commentServ.findAllComments());
		if(session.getAttribute("loggedInUser")!=null) {
			return "homepage.jsp";
		}else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/link/new")
	public String newBook(@ModelAttribute("newLink")Link newLink, HttpSession session) {
		if(session.getAttribute("loggedInUser")!=null) {
			return "addlink.jsp";
		}else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/addlink")
	public String addBook(@Valid @ModelAttribute("newLink")Link newLink, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "addlink.jsp";
		} else {
			linkServ.addLink(newLink);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/comment")
	public String newComment(@ModelAttribute("newComment")Comment newComment, HttpSession session) {
		if(session.getAttribute("loggedInUser")!=null) {
			return "addcomment.jsp";
		}else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/addcomment")
	public String addBook(@Valid @ModelAttribute("newComment")Comment newComment, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "addcomment.jsp";
		} else {
			commentServ.addComment(newComment);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/updateComment/{id}")
	public String viewComment(@PathVariable("id") Long id, Model oneComment) {
		oneComment.addAttribute("oneComment", commentServ.findById(id));
		return "updateDetails.jsp";
	}
	
	@GetMapping("deleteComment/{id}")
	public String deleteComment(@PathVariable Long id) {
		commentServ.deleteComment(id);
		return "redirect:/home";
	}
	
	@PutMapping("/updatecomment/{id}")
	public String updateComment(@PathVariable("id") Long id, @ModelAttribute("oneComment")Comment oneComment, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "updateDetails.jsp";
		} else {
			commentServ.updateComment(oneComment);
			return "redirect:/home";
		}
	}
}
