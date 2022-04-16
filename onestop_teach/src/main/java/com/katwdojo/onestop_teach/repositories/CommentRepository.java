package com.katwdojo.onestop_teach.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.katwdojo.onestop_teach.models.Comment;
import com.katwdojo.onestop_teach.models.User;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {
	List<Comment> findAll();
	List<Comment> findByUser(User user);

}
