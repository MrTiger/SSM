package com.xc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xc.entity.User;


public interface UserService {
	
	public List<User> getAllUsers();
	
	public void editUser(int id);
	
	public void deleteUser(int id);
}
