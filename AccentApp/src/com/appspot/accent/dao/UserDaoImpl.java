package com.appspot.accent.dao;

import javax.persistence.EntityManager;

import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.User;


public enum UserDaoImpl implements UserDao {
	INSTANCE;


	public void createLeerling(String username,String password) {
		synchronized (this) {
			EntityManager em = EMFService.get().createEntityManager();
			User u = new Leerling (username,password);
			em.persist(u);
			em.close();
		}
		
	}

	@Override
	public void updateUser(User user) {
		if(user instanceof Leerling){
			
		}
		
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		
	}
	

}
