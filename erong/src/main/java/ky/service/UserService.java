package ky.service;

import ky.dao.support.KyAccountDAO;
import ky.entity.KyAccount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserService {
	
	@Autowired
	private KyAccountDAO kyAccountDAO;
	
	@Transactional
	public void save(KyAccount transientInstance){
		kyAccountDAO.save(transientInstance);
	}
	

}
