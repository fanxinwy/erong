package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseHibernateDAO;
import ky.entity.KyFinancing;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyFinancing entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see root.bean.KyFinancing
 * @author MyEclipse Persistence Tools
 */
public class KyFinancingDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyFinancingDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String PROVINCE = "province";
	public static final String CITY = "city";
	public static final String ADDRESS = "address";
	public static final String BUSINESS = "business";
	public static final String FINANCINGUSE = "financinguse";
	public static final String COLUMN8 = "column8";
	public static final String COLUMN9 = "column9";
	public static final String COLUMN10 = "column10";
	public static final String COLUMN11 = "column11";
	public static final String COLUMN12 = "column12";

	public void save(KyFinancing transientInstance) {
		log.debug("saving KyFinancing instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyFinancing persistentInstance) {
		log.debug("deleting KyFinancing instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyFinancing findById(java.lang.Long id) {
		log.debug("getting KyFinancing instance with id: " + id);
		try {
			KyFinancing instance = (KyFinancing) getSession().get(
					"root.bean.KyFinancing", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyFinancing> findByExample(KyFinancing instance) {
		log.debug("finding KyFinancing instance by example");
		try {
			List<KyFinancing> results = (List<KyFinancing>) getSession()
					.createCriteria("root.bean.KyFinancing")
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
		log.debug("finding KyFinancing instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from KyFinancing as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyFinancing> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<KyFinancing> findByProvince(Object province) {
		return findByProperty(PROVINCE, province);
	}

	public List<KyFinancing> findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List<KyFinancing> findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List<KyFinancing> findByBusiness(Object business) {
		return findByProperty(BUSINESS, business);
	}

	public List<KyFinancing> findByFinancinguse(Object financinguse) {
		return findByProperty(FINANCINGUSE, financinguse);
	}

	public List<KyFinancing> findByColumn8(Object column8) {
		return findByProperty(COLUMN8, column8);
	}

	public List<KyFinancing> findByColumn9(Object column9) {
		return findByProperty(COLUMN9, column9);
	}

	public List<KyFinancing> findByColumn10(Object column10) {
		return findByProperty(COLUMN10, column10);
	}

	public List<KyFinancing> findByColumn11(Object column11) {
		return findByProperty(COLUMN11, column11);
	}

	public List<KyFinancing> findByColumn12(Object column12) {
		return findByProperty(COLUMN12, column12);
	}

	public List findAll() {
		log.debug("finding all KyFinancing instances");
		try {
			String queryString = "from KyFinancing";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyFinancing merge(KyFinancing detachedInstance) {
		log.debug("merging KyFinancing instance");
		try {
			KyFinancing result = (KyFinancing) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyFinancing instance) {
		log.debug("attaching dirty KyFinancing instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyFinancing instance) {
		log.debug("attaching clean KyFinancing instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}