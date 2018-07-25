package com.userback.DAO.IMPL;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.userback.DAO.UserDAO;
import com.userback.model.User;

@Repository("userDAO")
@Transactional
public class userDAOIMPL implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addUser(User user) {
		try {
			sessionFactory.getCurrentSession().save(user);
			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean updateUser(User user) {
		try {
			sessionFactory.getCurrentSession().update(user);
			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean deleteUser(String mail) {
		try {
			sessionFactory.getCurrentSession().delete(getSingleUser(mail));
			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

	@Override
	public User getSingleUser(String mail) {
		try {
			return sessionFactory.getCurrentSession().get(User.class, mail);

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUser() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from User").list();

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

}
