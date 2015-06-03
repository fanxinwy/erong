package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseDAO;
import ky.entity.KyCurrentprojectincomedetail;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyCurrentprojectincomedetail entities. Transaction control of the save(),
 * update() and delete() operations can directly support Spring
 * container-managed transactions or they can be augmented to handle
 * user-managed Spring transactions. Each of these methods provides additional
 * information for how to configure it for the desired type of transaction
 * control.
 * 
 * @see root.bean.KyCurrentprojectincomedetail
 * @author MyEclipse Persistence Tools
 */
public class KyCurrentprojectincomedetailDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyCurrentprojectincomedetailDAO.class);
	// property constants
	public static final String PID = "pid";
	public static final String AID = "aid";
	public static final String CURRENTTOTAL = "currenttotal";
	public static final String CURRENTINCOME = "currentincome";

	public void save(KyCurrentprojectincomedetail transientInstance) {
		log.debug("saving KyCurrentprojectincomedetail instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyCurrentprojectincomedetail persistentInstance) {
		log.debug("deleting KyCurrentprojectincomedetail instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyCurrentprojectincomedetail findById(java.lang.Long id) {
		log.debug("getting KyCurrentprojectincomedetail instance with id: "
				+ id);
		try {
			KyCurrentprojectincomedetail instance = (KyCurrentprojectincomedetail) getSession()
					.get("root.bean.KyCurrentprojectincomedetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyCurrentprojectincomedetail> findByExample(
			KyCurrentprojectincomedetail instance) {
		log.debug("finding KyCurrentprojectincomedetail instance by example");
		try {
			List<KyCurrentprojectincomedetail> results = (List<KyCurrentprojectincomedetail>) getSession()
					.createCriteria("root.bean.KyCurrentprojectincomedetail")
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
		log.debug("finding KyCurrentprojectincomedetail instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from KyCurrentprojectincomedetail as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyCurrentprojectincomedetail> findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	public List<KyCurrentprojectincomedetail> findByAid(Object aid) {
		return findByProperty(AID, aid);
	}

	public List<KyCurrentprojectincomedetail> findByCurrenttotal(
			Object currenttotal) {
		return findByProperty(CURRENTTOTAL, currenttotal);
	}

	public List<KyCurrentprojectincomedetail> findByCurrentincome(
			Object currentincome) {
		return findByProperty(CURRENTINCOME, currentincome);
	}

	public List findAll() {
		log.debug("finding all KyCurrentprojectincomedetail instances");
		try {
			String queryString = "from KyCurrentprojectincomedetail";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyCurrentprojectincomedetail merge(
			KyCurrentprojectincomedetail detachedInstance) {
		log.debug("merging KyCurrentprojectincomedetail instance");
		try {
			KyCurrentprojectincomedetail result = (KyCurrentprojectincomedetail) getSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyCurrentprojectincomedetail instance) {
		log.debug("attaching dirty KyCurrentprojectincomedetail instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyCurrentprojectincomedetail instance) {
		log.debug("attaching clean KyCurrentprojectincomedetail instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}