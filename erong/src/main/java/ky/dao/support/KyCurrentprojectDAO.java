package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseDAO;
import ky.entity.KyCurrentproject;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyCurrentproject entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see root.bean.KyCurrentproject
 * @author MyEclipse Persistence Tools
 */
public class KyCurrentprojectDAO extends BaseDAO {
	private static final Logger log = LoggerFactory.getLogger(KyCurrentprojectDAO.class);
	// property constants
	public static final String PROJECTNAME = "projectname";
	public static final String PROJECTCODE = "projectcode";
	public static final String ISSUINGAID = "issuingaid";
	public static final String EXPECTINCOME = "expectincome";

	public void save(KyCurrentproject transientInstance) {
		log.debug("saving KyCurrentproject instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyCurrentproject persistentInstance) {
		log.debug("deleting KyCurrentproject instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyCurrentproject findById(java.lang.Long id) {
		log.debug("getting KyCurrentproject instance with id: " + id);
		try {
			KyCurrentproject instance = (KyCurrentproject) getSession().get("root.bean.KyCurrentproject", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyCurrentproject> findByExample(KyCurrentproject instance) {
		log.debug("finding KyCurrentproject instance by example");
		try {
			List<KyCurrentproject> results = (List<KyCurrentproject>) getSession()
					.createCriteria("root.bean.KyCurrentproject").add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding KyCurrentproject instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from KyCurrentproject as model where model." + propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyCurrentproject> findByProjectname(Object projectname) {
		return findByProperty(PROJECTNAME, projectname);
	}

	public List<KyCurrentproject> findByProjectcode(Object projectcode) {
		return findByProperty(PROJECTCODE, projectcode);
	}

	public List<KyCurrentproject> findByIssuingaid(Object issuingaid) {
		return findByProperty(ISSUINGAID, issuingaid);
	}

	public List<KyCurrentproject> findByExpectincome(Object expectincome) {
		return findByProperty(EXPECTINCOME, expectincome);
	}

	public List findAll() {
		log.debug("finding all KyCurrentproject instances");
		try {
			String queryString = "from KyCurrentproject";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyCurrentproject merge(KyCurrentproject detachedInstance) {
		log.debug("merging KyCurrentproject instance");
		try {
			KyCurrentproject result = (KyCurrentproject) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyCurrentproject instance) {
		log.debug("attaching dirty KyCurrentproject instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyCurrentproject instance) {
		log.debug("attaching clean KyCurrentproject instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}