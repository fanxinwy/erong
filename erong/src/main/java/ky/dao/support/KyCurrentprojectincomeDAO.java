package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseDAO;
import ky.entity.KyCurrentprojectincome;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyCurrentprojectincome entities. Transaction control of the save(), update()
 * and delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see root.bean.KyCurrentprojectincome
 * @author MyEclipse Persistence Tools
 */
public class KyCurrentprojectincomeDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyCurrentprojectincomeDAO.class);
	// property constants
	public static final String CPID = "cpid";
	public static final String EXPECTINCOME = "expectincome";

	public void save(KyCurrentprojectincome transientInstance) {
		log.debug("saving KyCurrentprojectincome instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyCurrentprojectincome persistentInstance) {
		log.debug("deleting KyCurrentprojectincome instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyCurrentprojectincome findById(java.lang.Long id) {
		log.debug("getting KyCurrentprojectincome instance with id: " + id);
		try {
			KyCurrentprojectincome instance = (KyCurrentprojectincome) getSession()
					.get("root.bean.KyCurrentprojectincome", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyCurrentprojectincome> findByExample(
			KyCurrentprojectincome instance) {
		log.debug("finding KyCurrentprojectincome instance by example");
		try {
			List<KyCurrentprojectincome> results = (List<KyCurrentprojectincome>) getSession()
					.createCriteria("root.bean.KyCurrentprojectincome")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding KyCurrentprojectincome instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from KyCurrentprojectincome as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyCurrentprojectincome> findByCpid(Object cpid) {
		return findByProperty(CPID, cpid);
	}

	public List<KyCurrentprojectincome> findByExpectincome(Object expectincome) {
		return findByProperty(EXPECTINCOME, expectincome);
	}

	public List findAll() {
		log.debug("finding all KyCurrentprojectincome instances");
		try {
			String queryString = "from KyCurrentprojectincome";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyCurrentprojectincome merge(KyCurrentprojectincome detachedInstance) {
		log.debug("merging KyCurrentprojectincome instance");
		try {
			KyCurrentprojectincome result = (KyCurrentprojectincome) getSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyCurrentprojectincome instance) {
		log.debug("attaching dirty KyCurrentprojectincome instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyCurrentprojectincome instance) {
		log.debug("attaching clean KyCurrentprojectincome instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}