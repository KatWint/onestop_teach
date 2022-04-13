package com.katwdojo.onestop_teach.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;

import com.katwdojo.onestop_teach.models.LoginUser;
import com.katwdojo.onestop_teach.models.User;
import com.katwdojo.onestop_teach.repositories.UserRepository;

@Service
public class UserServices {

	@Autowired
	private UserRepository userRepo;

	public void validate(User newUser, BindingResult errors) {
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			errors.rejectValue("password","Mismatch","Password does not match!!" );
		}
		if(userRepo.findByEmail(newUser.getEmail()).orElse(null)!=null) {
			errors.rejectValue("email", "unique","Email is already taken!");
			System.out.println(userRepo.findByEmail(newUser.getEmail()));
		}
		
	}

	public User registerUser(User newUser) {
		String hashedPass=BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPass);
		userRepo.save(newUser);
		return null;
	}

	public User findByEmail(String email) {
		return userRepo.findByEmail(email).orElse(null);
	}

	public User findById(Long id) {
		return userRepo.findById(id).orElse(null);
		
	}


	public boolean authenticateUser(LoginUser newLogin, Errors errors) {
		User user= userRepo.findByEmail(newLogin.getEmail()).orElse(null);
		if(user==null) {
			errors.rejectValue("email", "missingEmail","Email not found!");
			return false;
		}else {
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				errors.rejectValue("password", "Matches", "Invalid Password!");
				return false;
			}
		}
		
		return true;
	}

}
