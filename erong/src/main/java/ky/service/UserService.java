package ky.service;

import ky.dao.BaseDAO;
import ky.entity.KyAccount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserService {
	
	@Autowired
	private BaseDAO dao;
	
	@Transactional
	public void save(KyAccount ka){
		dao.save(KyAccount.class, ka);
	}
	
	
	public KyAccount logon(KyAccount ka){
		String phonenumb = ka.getPhonenumb();
		String email = ka.getEmail();
		String account = ka.getAccount();
		
		dao.findByProperty(KyAccount.class, "phonenumb", phonenumb);
		
//		kyAccountDAO.fin
		
		return null;
	}
	

}
