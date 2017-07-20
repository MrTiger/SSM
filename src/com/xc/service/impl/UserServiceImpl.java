package com.xc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xc.dao.UserDao;
import com.xc.entity.User;
import com.xc.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	UserDao userDao;
	
	@Override
	public List<User> getAllUsers() {
		
		return userDao.getAllUsers();
	}

	@Override
	public void editUser(int id) {
		
		userDao.edit(id);
	}

	@Override
	public void deleteUser(int id) {
		userDao.delete(id);
		
	}
	
}
