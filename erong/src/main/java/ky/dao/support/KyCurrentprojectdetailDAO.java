package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseDAO;
import ky.entity.KyCurrentprojectdetail;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyCurrentprojectdetail entities. Transaction control of the save(), update()
 * and delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see root.bean.KyCurrentprojectdetail
 * @author MyEclipse Persistence Tools
 */
public class KyCurrentprojectdetailDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyCurrentprojectdetailDAO.class);
	// property constants
	public static final String PID = "pid";
	public static final String AID = "aid";
	public static final String INMONEY = "inmoney";
	public static final String OUTMONEY = "outmoney";

	public void save(KyCurrentprojectdetail transientInstance) {
		log.debug("saving KyCurrentprojectdetail instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyCurrentprojectdetail persistentInstance) {
		log.debug("deleting KyCurrentprojectdetail instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyCurrentprojectdetail findById(java.lang.Long id) {
		log.debug("getting KyCurrentprojectdetail instance with id: " + id);
		try {
			KyCurrentprojectdetail instance = (KyCurrentprojectdetail) getSession()
					.get("root.bean.KyCurrentprojectdetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyCurrentprojectdetail> findByExample(
			KyCurrentprojectdetail instance) {
		log.debug("finding KyCurrentprojectdetail instance by example");
		try {
			List<KyCurrentprojectdetail> results = (List<KyCurrentprojectdetail>) getSession()
					.createCriteria("root.bean.KyCurrentprojectdetail")
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
		log.debug("finding KyCurrentprojectdetail instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from KyCurrentprojectdetail as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyCurrentprojectdetail> findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	public List<KyCurrentprojectdetail> findByAid(Object aid) {
		return findByProperty(AID, aid);
	}

	public List<KyCurrentprojectdetail> findByInmoney(Object inmoney) {
		return findByProperty(INMONEY, inmoney);
	}

	public List<KyCurrentprojectdetail> findByOutmoney(Object outmoney) {
		return findByProperty(OUTMONEY, outmoney);
	}

	public List findAll() {
		log.debug("finding all KyCurrentprojectdetail instances");
		try {
			String queryString = "from KyCurrentprojectdetail";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyCurrentprojectdetail merge(KyCurrentprojectdetail detachedInstance) {
		log.debug("merging KyCurrentprojectdetail instance");
		try {
			KyCurrentprojectdetail result = (KyCurrentprojectdetail) getSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyCurrentprojectdetail instance) {
		log.debug("attaching dirty KyCurrentprojectdetail instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyCurrentprojectdetail instance) {
		log.debug("attaching clean KyCurrentprojectdetail instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}