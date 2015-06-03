package ky.service;

import java.util.List;

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
//		String phonenumb = ka.getPhonenumb();
//		String email = ka.getEmail();
		String account = ka.getAccount();
		List<KyAccount> list = dao.findByProperty(KyAccount.class, "account", account);
		if(list != null && list.size() > 0){
			return list.get(0);
		}		
		return null;
	}
	

}
