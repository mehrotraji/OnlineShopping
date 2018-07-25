package com.userback;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.userback.DAO.UserDAO;
import com.userback.model.User;

public class usertest {

	private static AnnotationConfigApplicationContext context = null;
	private static UserDAO userDAO = null;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {

		context = new AnnotationConfigApplicationContext();
		context.scan("com.userback");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");
	}

	@Test
	public void testAddUser() {
		User user = new User();
		user.setName("Manish");
		user.setMail("manish@gmail.com");
		user.setPassword("12345");

		assertTrue("cannot save check the code", userDAO.addUser(user));
	}

	@Ignore
	@Test
	public void testUpdateUser() {
		User obj1 = userDAO.getSingleUser("manish@gmail.com");
		obj1.setName("Rishabh");

		assertTrue("cannot save check the code", userDAO.updateUser(obj1));
	}

	@Test
	public void testDeleteUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetSingleUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllUser() {
		fail("Not yet implemented");
	}

}
