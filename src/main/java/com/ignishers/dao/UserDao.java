package com.ignishers.dao;

import java.util.List;

import com.ignishers.pojo.User;

public interface UserDao {
	User checkUserCred(String email, String pass);
	User checkExistence(String email);
	boolean updateUser(User user);
	boolean deleteUser(User user);
	List<User> getAllUser();
}
