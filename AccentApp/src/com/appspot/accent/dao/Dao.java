package com.appspot.accent.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.Todo;
import com.appspot.accent.model.User;

public enum Dao {
  INSTANCE;

  public List<Todo> listTodos() {
    EntityManager em = EMFService.get().createEntityManager();
    // read the existing entries
    Query q = em.createQuery("select m from Todo m");
    List<Todo> todos = q.getResultList();
    return todos;
  }

////////////////////////////// Create Remove User classes ////////////////////////////////////////////////////////////////// 
  public void createLeerling(String username, String password) {
	    synchronized (this) {
	      EntityManager em = EMFService.get().createEntityManager();
	      User newLeerling = new Leerling(username,password);
	      em.persist(newLeerling);
	      em.close();
	    }
	  }
  
  public void removeLeerling(long id) {
	    synchronized (this) {
	      EntityManager em = EMFService.get().createEntityManager();
	      Leerling l = em.find(Leerling.class, id);
	      em.remove(l);
	      em.close();
	    }
	  }
  
  public void createDocent(String username, String password) {
	    synchronized (this) {
	      EntityManager em = EMFService.get().createEntityManager();
	      User newUser = new Docent(username,password);
	      em.persist(newUser);
	      em.close();
	    }
	  }

public void removeDocent(long id) {
	    synchronized (this) {
	      EntityManager em = EMFService.get().createEntityManager();
	      Docent d = em.find(Docent.class, id);
	      em.remove(d);
	      em.close();
	    }
	  }

public void createAdministrator(String username, String password) {
    synchronized (this) {
      EntityManager em = EMFService.get().createEntityManager();
      User newUser = new Administrator(username,password);
      em.persist(newUser);
      em.close();
    }
  }

public void removeAdministrator(long id) {
    synchronized (this) {
      EntityManager em = EMFService.get().createEntityManager();
      Administrator a = em.find(Administrator.class, id);
      em.remove(a);
      em.close();
    }
  }

public void createCompetentieItem(String omschrijving){
	synchronized (this){
		 EntityManager em = EMFService.get().createEntityManager();
	      CompetentieItem ci = new CompetentieItem(omschrijving);
	      em.persist(ci);
	      em.close();
	}
}

public void removeCompetentieItem(long id){
	synchronized (this){
		 EntityManager em = EMFService.get().createEntityManager();
	      CompetentieItem ci = em.find(CompetentieItem.class, id);
	      em.remove(ci);
	      em.close();
	}
}

/////////////////////////////// Create/Remove User classes //////////////////////////////////////////////////////////////////  
  

  public List<Todo> getTodos(String userId) {
    EntityManager em = EMFService.get().createEntityManager();
    Query q = em
        .createQuery("select t from Todo t where t.author = :userId");
    q.setParameter("userId", userId);
    List<Todo> todos = q.getResultList();
    return todos;
  }
  
  public List<User> getAlleLeerlingen() {
	    EntityManager em = EMFService.get().createEntityManager();
	    Query q = em.createQuery("select l from Leerling l");
	    List<User> leerlingen = q.getResultList();
	    return leerlingen;
	  }
  
  public List<User> getAlleDocenten() {
	    EntityManager em = EMFService.get().createEntityManager();
	    Query q = em.createQuery("select d from Docent d");
	    List<User> docenten = q.getResultList();
	    return docenten;
	  }
  
  public List<CompetentieItem> getAlleCompetentieItems() {
	    EntityManager em = EMFService.get().createEntityManager();
	    Query q = em.createQuery("select c from CompetentieItem c");
	    List<CompetentieItem> items = q.getResultList();
	    return items;
	  }

  public void remove(long id) {
    EntityManager em = EMFService.get().createEntityManager();
    try {
      Todo todo = em.find(Todo.class, id);
      em.remove(todo);
    } finally {
      em.close();
    }
  }
  
  public void finishTodo(long id, boolean state) {
	    EntityManager em = EMFService.get().createEntityManager();
	    try {
	      Todo todo = em.find(Todo.class, id);
	      todo.setFinished(state);
	    } finally {
	      em.close();
	    }
	  }
    
  
  
} 