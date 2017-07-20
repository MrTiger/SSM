package com.xc.dao;

import java.util.List;

import javax.annotation.Resource;

import com.xc.entity.User;

@Resource
public interface UserDao {

	public List<User> getAllUsers();

	public void edit(int id);

	public void delete(int id);
}
