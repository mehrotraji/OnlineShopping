package com.userback.DAO;

import java.util.List;

import com.userback.model.Category;

public interface CategoryDAO {

	public boolean addCategory(Category category);
	public List<Category> getAll();
	public Category getCategoryById(int CategoryId);
	public boolean updateCategory(Category category);
	public boolean deleteCategory(int CategoryId);
}