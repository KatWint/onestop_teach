package com.katwdojo.onestop_teach.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.katwdojo.onestop_teach.models.Link;
import com.katwdojo.onestop_teach.models.User;
import com.katwdojo.onestop_teach.repositories.LinkRepository;

@Service
public class LinkServices {

	@Autowired
	private LinkRepository linkRepo;
	
	public Link findbyID(Long id) {
		return linkRepo.findById(id).orElse(null);
	}
	
	public Link addLink(Link link) {
		return linkRepo.save(link);
	}
	
	public Link updateLink(Link link) {
		return linkRepo.save(link);
	}
	
	public List<Link> getAllLinks(){
		return linkRepo.findAll();
	}
	
	public List<Link> getByCategory(String Category){
		return linkRepo.findByCategory(Category);
	}
	
	public List<Link> getByApproval(String approval){
		return linkRepo.findByApproval(approval);
	}
	
	public void likeLink(Link link, User user) {
		List<User> likers=link.getLikers();
		likers.add(user);
		linkRepo.save(link);
	}
	
	public void unLikeLink(Link link, User user) {
		List<User> likers=link.getLikers();
		likers.remove(user);
		linkRepo.save(link);
	}
}
