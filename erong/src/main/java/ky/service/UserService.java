package ky.service;

import java.util.List;
import java.util.regex.Pattern;

import ky.dao.BaseDAO;
import ky.entity.KyAccount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserService {
	
	@Autowired
	private BaseDAO dao;
	
	public static final String regexPhonenumb = "^13[0-9]{9}$";
	public static final String regexEmail = "^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w+)+)$";
	public static final String regexAccount = "^[a-zA-Z_][a-zA-Z0-9]{3,15}$";
	private Pattern pPhonenumb = Pattern.compile(regexPhonenumb);
	private Pattern pEmail = Pattern.compile(regexEmail);
	private Pattern pAccount = Pattern.compile(regexAccount);
	
	@Transactional
	public void save(KyAccount ka){
		dao.save(KyAccount.class, ka);
	}
	
	
	public KyAccount logon(KyAccount ka){
		String propName = null;
		String account = ka.getAccount();
		if(pPhonenumb.matcher(account).matches()){
			propName = "phonenumb";
		}else
		if(pEmail.matcher(account).matches()){
			propName = "email";
		}else
		if(pAccount.matcher(account).matches()){
			propName = "account";
		}
		if(propName == null){
			return null;
		}
		List<KyAccount> list = dao.findByProperty(KyAccount.class, propName, account);
		if(list != null && list.size() > 0){
			return list.get(0);
		}		
		return null;
	}
	

}
