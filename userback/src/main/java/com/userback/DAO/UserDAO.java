package com.userback.DAO;

import java.util.List;

import com.userback.model.User;

public interface UserDAO {
	
		public boolean addUser(User user);
		public boolean updateUser(User user);
		public boolean deleteUser(String mail);
		
		public User getSingleUser(String mail);
		public List<User> getAllUser();
		
	}



