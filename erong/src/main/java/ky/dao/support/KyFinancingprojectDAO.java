package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseHibernateDAO;
import ky.entity.KyFinancingproject;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyFinancingproject entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see root.bean.KyFinancingproject
 * @author MyEclipse Persistence Tools
 */
public class KyFinancingprojectDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyFinancingprojectDAO.class);
	// property constants
	public static final String PROJECTNAME = "projectname";
	public static final String PROJECTCODE = "projectcode";
	public static final String ISSUINGAID = "issuingaid";
	public static final String EXPECTINCOME = "expectincome";
	public static final String ISSUINGTOTAL = "issuingtotal";
	public static final String MININVEST = "mininvest";
	public static final String TIMELIMIT = "timelimit";

	public void save(KyFinancingproject transientInstance) {
		log.debug("saving KyFinancingproject instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyFinancingproject persistentInstance) {
		log.debug("deleting KyFinancingproject instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyFinancingproject findById(java.lang.Long id) {
		log.debug("getting KyFinancingproject instance with id: " + id);
		try {
			KyFinancingproject instance = (KyFinancingproject) getSession()
					.get("root.bean.KyFinancingproject", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyFinancingproject> findByExample(KyFinancingproject instance) {
		log.debug("finding KyFinancingproject instance by example");
		try {
			List<KyFinancingproject> results = (List<KyFinancingproject>) getSession()
					.createCriteria("root.bean.KyFinancingproject")
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
		log.debug("finding KyFinancingproject instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from KyFinancingproject as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyFinancingproject> findByProjectname(Object projectname) {
		return findByProperty(PROJECTNAME, projectname);
	}

	public List<KyFinancingproject> findByProjectcode(Object projectcode) {
		return findByProperty(PROJECTCODE, projectcode);
	}

	public List<KyFinancingproject> findByIssuingaid(Object issuingaid) {
		return findByProperty(ISSUINGAID, issuingaid);
	}

	public List<KyFinancingproject> findByExpectincome(Object expectincome) {
		return findByProperty(EXPECTINCOME, expectincome);
	}

	public List<KyFinancingproject> findByIssuingtotal(Object issuingtotal) {
		return findByProperty(ISSUINGTOTAL, issuingtotal);
	}

	public List<KyFinancingproject> findByMininvest(Object mininvest) {
		return findByProperty(MININVEST, mininvest);
	}

	public List<KyFinancingproject> findByTimelimit(Object timelimit) {
		return findByProperty(TIMELIMIT, timelimit);
	}

	public List findAll() {
		log.debug("finding all KyFinancingproject instances");
		try {
			String queryString = "from KyFinancingproject";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyFinancingproject merge(KyFinancingproject detachedInstance) {
		log.debug("merging KyFinancingproject instance");
		try {
			KyFinancingproject result = (KyFinancingproject) getSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyFinancingproject instance) {
		log.debug("attaching dirty KyFinancingproject instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyFinancingproject instance) {
		log.debug("attaching clean KyFinancingproject instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}