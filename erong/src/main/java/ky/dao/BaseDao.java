package ky.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDao {

	@Autowired
	protected SessionFactory sessitonFactory;

	public Session getSession() {
		return sessitonFactory.getCurrentSession();
	}

	public Session getNewSession() {
		return sessitonFactory.openSession();
	}

	public Object load(Class<?> cls, Serializable id) {
		Session ss = getSession();
		return ss.load(cls, id);
	}

}
