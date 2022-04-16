package com.katwdojo.onestop_teach.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.katwdojo.onestop_teach.models.Comment;
import com.katwdojo.onestop_teach.models.User;
import com.katwdojo.onestop_teach.repositories.CommentRepository;

@Service
public class CommentServices {
	
	@Autowired
	private CommentRepository commentRepo;
	
	public Comment findById(Long id) {
		return commentRepo.findById(id).orElse(null);
	}
	
	public Comment addComment(Comment comment) {
		return commentRepo.save(comment);
	}
	
	public Comment updateComment(Comment comment) {
		return commentRepo.save(comment);
	}
	
	public List<Comment> findAllComments(){
		return commentRepo.findAll();
	}
	
	public void deleteComment(Long id) {
		commentRepo.deleteById(id);
	}
	
	public List<Comment> findByUser (User user){
		return commentRepo.findByUser(user);
	}
}
