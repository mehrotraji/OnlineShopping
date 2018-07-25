package com.shoppingsite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.userback.DAO.CategoryDAO;
import com.userback.model.Category;

@ControllerAdvice
public class GlobalController {

	@Autowired
	CategoryDAO categoryDAO;
	
	@ModelAttribute("catlist")
	public List<Category> getCategory(){
		return categoryDAO.getAll();
	}
	
}
