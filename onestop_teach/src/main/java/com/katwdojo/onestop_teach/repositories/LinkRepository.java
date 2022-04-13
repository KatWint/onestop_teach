package com.katwdojo.onestop_teach.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.katwdojo.onestop_teach.models.Link;

@Repository
public interface LinkRepository extends CrudRepository<Link, Long> {

	List<Link> findAll();
	
	List<Link> findByCategory(String category);
	
	List<Link> findByApproval(String approval);
}
