package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseHibernateDAO;
import ky.entity.KyProjectdetail;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyProjectdetail entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see root.bean.KyProjectdetail
 * @author MyEclipse Persistence Tools
 */
public class KyProjectdetailDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyProjectdetailDAO.class);
	// property constants
	public static final String PID = "pid";
	public static final String AID = "aid";
	public static final String ISSUING = "issuing";

	public void save(KyProjectdetail transientInstance) {
		log.debug("saving KyProjectdetail instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyProjectdetail persistentInstance) {
		log.debug("deleting KyProjectdetail instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyProjectdetail findById(java.lang.Long id) {
		log.debug("getting KyProjectdetail instance with id: " + id);
		try {
			KyProjectdetail instance = (KyProjectdetail) getSession().get(
					"root.bean.KyProjectdetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyProjectdetail> findByExample(KyProjectdetail instance) {
		log.debug("finding KyProjectdetail instance by example");
		try {
			List<KyProjectdetail> results = (List<KyProjectdetail>) getSession()
					.createCriteria("root.bean.KyProjectdetail")
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
		log.debug("finding KyProjectdetail instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from KyProjectdetail as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyProjectdetail> findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	public List<KyProjectdetail> findByAid(Object aid) {
		return findByProperty(AID, aid);
	}

	public List<KyProjectdetail> findByIssuing(Object issuing) {
		return findByProperty(ISSUING, issuing);
	}

	public List findAll() {
		log.debug("finding all KyProjectdetail instances");
		try {
			String queryString = "from KyProjectdetail";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyProjectdetail merge(KyProjectdetail detachedInstance) {
		log.debug("merging KyProjectdetail instance");
		try {
			KyProjectdetail result = (KyProjectdetail) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyProjectdetail instance) {
		log.debug("attaching dirty KyProjectdetail instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyProjectdetail instance) {
		log.debug("attaching clean KyProjectdetail instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}