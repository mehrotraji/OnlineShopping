package com.userback.DAO.IMPL;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.userback.DAO.ProductDAO;
import com.userback.model.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().save(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAll() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Product").list();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public Product getProductById(int ProductID) {
		try {
			return sessionFactory.getCurrentSession().get(Product.class, ProductID);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updateProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteProduct(int ProductId) {
		try {
			sessionFactory.getCurrentSession().delete(getProductById(ProductId));
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Product> listSelected(int categoryID) {
		String query = "From Product WHERE categoryID = :categoryID";
		try {
			return sessionFactory.getCurrentSession().createQuery(query, Product.class)
					.setParameter("categoryID", categoryID).getResultList();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}

	}
}
