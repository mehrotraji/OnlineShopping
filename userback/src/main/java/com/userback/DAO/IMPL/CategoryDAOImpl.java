package com.userback.DAO.IMPL;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.userback.DAO.CategoryDAO;
import com.userback.model.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().save(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAll() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Category").list();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Category getCategoryById(int CategoryID) {
		try {
			return sessionFactory.getCurrentSession().get(Category.class, CategoryID);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateCategory(Category category)
	{
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean deleteCategory(int CategoryId)
	{
		try {
			sessionFactory.getCurrentSession().delete(getCategoryById(CategoryId));
			return true;
		}catch(Exception ex) {
		ex.printStackTrace();
		return false;
		}
	}
		}
	
