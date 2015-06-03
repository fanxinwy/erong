package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseDAO;
import ky.entity.KyBankcard;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyBankcard entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see root.bean.KyBankcard
 * @author MyEclipse Persistence Tools
 */
public class KyBankcardDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyBankcardDAO.class);
	// property constants
	public static final String AID = "aid";
	public static final String CARDNUMB = "cardnumb";
	public static final String NAME = "name";
	public static final String DEPOSIT = "deposit";
	public static final String DEPOSITPROVINCE = "depositprovince";
	public static final String DEPOSITCITY = "depositcity";
	public static final String BRANCH = "branch";

	public void save(KyBankcard transientInstance) {
		log.debug("saving KyBankcard instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyBankcard persistentInstance) {
		log.debug("deleting KyBankcard instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyBankcard findById(java.lang.Long id) {
		log.debug("getting KyBankcard instance with id: " + id);
		try {
			KyBankcard instance = (KyBankcard) getSession().get(
					"root.bean.KyBankcard", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyBankcard> findByExample(KyBankcard instance) {
		log.debug("finding KyBankcard instance by example");
		try {
			List<KyBankcard> results = (List<KyBankcard>) getSession()
					.createCriteria("ky.entity.KyBankcard")
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
		log.debug("finding KyBankcard instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from KyBankcard as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyBankcard> findByAid(Object aid) {
		return findByProperty(AID, aid);
	}

	public List<KyBankcard> findByCardnumb(Object cardnumb) {
		return findByProperty(CARDNUMB, cardnumb);
	}

	public List<KyBankcard> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<KyBankcard> findByDeposit(Object deposit) {
		return findByProperty(DEPOSIT, deposit);
	}

	public List<KyBankcard> findByDepositprovince(Object depositprovince) {
		return findByProperty(DEPOSITPROVINCE, depositprovince);
	}

	public List<KyBankcard> findByDepositcity(Object depositcity) {
		return findByProperty(DEPOSITCITY, depositcity);
	}

	public List<KyBankcard> findByBranch(Object branch) {
		return findByProperty(BRANCH, branch);
	}

	public List findAll() {
		log.debug("finding all KyBankcard instances");
		try {
			String queryString = "from KyBankcard";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyBankcard merge(KyBankcard detachedInstance) {
		log.debug("merging KyBankcard instance");
		try {
			KyBankcard result = (KyBankcard) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyBankcard instance) {
		log.debug("attaching dirty KyBankcard instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyBankcard instance) {
		log.debug("attaching clean KyBankcard instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}