package ky.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ky.entity.KyAccount;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDAO implements IBaseDAO {

	private static final Logger log = LoggerFactory.getLogger(BaseDAO.class);

	@Autowired
	protected SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	public <T> void save(Class<T> cls, T t) {
		log.debug("saving {} instance", cls.getSimpleName());
		try {
			getSession().save(t);
		} catch (RuntimeException re) {
			log.error("saving {} instance failed", cls.getSimpleName(), re);
			throw re;
		}
	}

	public <T> void delete(Class<T> cls, T t) {
		log.debug("deleting {} instance", cls.getSimpleName());
		try {
			getSession().delete(t);
		} catch (RuntimeException re) {
			log.error("deleting {} instance failed", cls.getSimpleName(), re);
			throw re;
		}
	}

	public <T> void update(Class<T> cls, T t) {
		log.debug("updating {} instance", cls.getSimpleName());
		try {
			getSession().update(t);
		} catch (RuntimeException re) {
			log.error("updating {} instance failed", cls.getSimpleName(), re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public <T> T get(Class<T> cls, Serializable id) {
		log.debug("getting {} instance with id {}", cls.getSimpleName(), id);
		try {
			T instance = (T) getSession().get(cls, id);
			return instance;
		} catch (RuntimeException re) {
			log.error("getting {} instance with id {} failed", cls.getSimpleName(), id, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> findByProperty(Class<T> cls, String propertyName, Object value) {
		log.debug("finding {} instance with property: {}, value: {}", cls.getSimpleName(), propertyName, value);
		try {
			StringBuilder queryString = new StringBuilder("from ").append(cls.getSimpleName()).append(" as model");
			queryString.append(" where model.").append(propertyName).append("= ?");
			Query queryObject = getSession().createQuery(queryString.toString());
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("finding {} instance with property: {}, value: {} falied", cls.getSimpleName(), propertyName, value, re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public <T> List<T> findByProperties(Class<T> cls, Map<String, Object> properties) {
		log.debug("finding {} instance with properties: {}", cls.getSimpleName(), properties);
		try {
			StringBuilder queryString = new StringBuilder("from ").append(cls.getSimpleName()).append(" as model");
			queryString.append(" where ");
			int size = properties.size();
			List<Object> values = new ArrayList<>(size);
			for(String prop:properties.keySet()){
				queryString.append("model.").append(prop).append("= ?");
				values.add(properties.get(prop));
				if(size > 1){
					queryString.append(" and ");
				}
				size--;
			}
			Query queryObject = getSession().createQuery(queryString.toString());
			for(int i=0;i<values.size();i++){
				queryObject.setParameter(i, values.get(i));
			}
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("finding {} instance with properties: {} failed", cls.getSimpleName(), properties, re);
			throw re;
		}
	}
	
	

	public static void main(String[] args) {
		BaseDAO bd = new BaseDAO();
		Map<String, Object> m = new HashMap<>();
		m.put("a", "1");
		m.put("b", "2");
		bd.findByProperties(KyAccount.class, m);
	}
	
	
	
	
}