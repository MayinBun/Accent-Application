package com.appspot.accent.dao;

import com.appspot.accent.model.User;

public interface UserDao {
	
	
	//CUD Users
	
	public void createLeerling(String username,String password);
	
	public void updateUser(User user);
	
	public void deleteUser(User user);
	
	

}
