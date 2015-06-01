package ky.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDAO implements IBaseHibernateDAO {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public Session getSession() {
//		return sessionFactory.getCurrentSession();
		return sessionFactory.openSession();
	}

//	public Session getNewSession() {
//		return sessionFactory.openSession();
//	}
//
//	public Object load(Class<?> cls, Serializable id) {
//		Session ss = getSession();
//		return ss.load(cls, id);
//	}
	
}