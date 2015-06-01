package ky.dao.support;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import ky.dao.BaseHibernateDAO;
import ky.entity.KyAccount;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * A data access object (DAO) providing persistence and search support for
 * KyAccount entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see root.bean.KyAccount
 * @author MyEclipse Persistence Tools
 */
@Repository
public class KyAccountDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(KyAccountDAO.class);
	// property constants
	public static final String ACCOUNT = "account";
	public static final String PASSWORD = "password";
	public static final String PHONENUMB = "phonenumb";
	public static final String ACCOUNTTYPE = "accounttype";
	public static final String EMAIL = "email";
	public static final String NAME = "name";
	public static final String IDCARDTYPE = "idcardtype";
	public static final String IDCARD = "idcard";
	public static final String AVATAR = "avatar";
	public static final String INTEGRAL = "integral";
	public static final String SECUREQUESTION = "securequestion";
	public static final String SECUREANSWER = "secureanswer";

	@Transactional
	public void save(KyAccount transientInstance) {
		log.debug("saving KyAccount instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(KyAccount persistentInstance) {
		log.debug("deleting KyAccount instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public KyAccount findById(java.lang.Long id) {
		log.debug("getting KyAccount instance with id: " + id);
		try {
			KyAccount instance = (KyAccount) getSession().get(
					"root.bean.KyAccount", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<KyAccount> findByExample(KyAccount instance) {
		log.debug("finding KyAccount instance by example");
		try {
			List<KyAccount> results = (List<KyAccount>) getSession()
					.createCriteria("root.bean.KyAccount")
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
		log.debug("finding KyAccount instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from KyAccount as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<KyAccount> findByAccount(Object account) {
		return findByProperty(ACCOUNT, account);
	}

	public List<KyAccount> findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List<KyAccount> findByPhonenumb(Object phonenumb) {
		return findByProperty(PHONENUMB, phonenumb);
	}

	public List<KyAccount> findByAccounttype(Object accounttype) {
		return findByProperty(ACCOUNTTYPE, accounttype);
	}

	public List<KyAccount> findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List<KyAccount> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<KyAccount> findByIdcardtype(Object idcardtype) {
		return findByProperty(IDCARDTYPE, idcardtype);
	}

	public List<KyAccount> findByIdcard(Object idcard) {
		return findByProperty(IDCARD, idcard);
	}

	public List<KyAccount> findByAvatar(Object avatar) {
		return findByProperty(AVATAR, avatar);
	}

	public List<KyAccount> findByIntegral(Object integral) {
		return findByProperty(INTEGRAL, integral);
	}

	public List<KyAccount> findBySecurequestion(Object securequestion) {
		return findByProperty(SECUREQUESTION, securequestion);
	}

	public List<KyAccount> findBySecureanswer(Object secureanswer) {
		return findByProperty(SECUREANSWER, secureanswer);
	}

	public List findAll() {
		log.debug("finding all KyAccount instances");
		try {
			String queryString = "from KyAccount";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public KyAccount merge(KyAccount detachedInstance) {
		log.debug("merging KyAccount instance");
		try {
			KyAccount result = (KyAccount) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(KyAccount instance) {
		log.debug("attaching dirty KyAccount instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(KyAccount instance) {
		log.debug("attaching clean KyAccount instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}