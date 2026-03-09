package com.ignishers.dao;

import com.ignishers.pojo.User;

public interface UserDao {
	User checkUserCred(String email, String pass);
}
