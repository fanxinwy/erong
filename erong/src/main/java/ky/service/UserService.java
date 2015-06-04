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
	public static final String TOKEN = "$token";
	public static final String regexPhonenumb = "^1[3-9][0-9]{9}$";
	public static final String regexEmail = "^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w+)+)$";
	public static final String regexAccount = "^[a-zA-Z_][a-zA-Z0-9]{1,15}$";
	private Pattern pPhonenumb = Pattern.compile(regexPhonenumb);
	private Pattern pEmail = Pattern.compile(regexEmail);
	private Pattern pAccount = Pattern.compile(regexAccount);
	
	@Transactional
	public void save(KyAccount ka){
		dao.save(KyAccount.class, ka);
	}
	
	@Transactional
	public KyAccount logon(KyAccount ka){
		String account = ka.getAccount();
		if(pPhonenumb.matcher(account).matches()){
			ka.setPhonenumb(account);
			ka.setAccount(null);
		}else if(pEmail.matcher(account).matches()){
			ka.setEmail(account);
			ka.setAccount(null);
		}else if(pAccount.matcher(account).matches()){
			
		}else{
			return null;
		}
		List<KyAccount> list = dao.findByExample(KyAccount.class, ka);
		if(list != null && list.size() > 0){
			return list.get(0);
		}		
		return null;
	}
	

}
