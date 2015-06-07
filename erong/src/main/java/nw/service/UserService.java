package nw.service;

import java.util.List;
import java.util.regex.Pattern;

import nw.dao.BaseDAO;
import nw.entity.NwAccount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
	
	@Autowired
	private BaseDAO dao;
	public static final String TOKEN = "$token";
	public static final String USERNAME = "$username";
	public static final String PHONENUMBER = "$phonenumber";
	public static final String regexPhonenumb = "^1[3-9][0-9]{9}$";
	public static final String regexEmail = "^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w+)+)$";
	public static final String regexAccount = "^[a-zA-Z_][a-zA-Z0-9]{1,15}$";
	private Pattern pPhonenumb = Pattern.compile(regexPhonenumb);
	private Pattern pEmail = Pattern.compile(regexEmail);
	private Pattern pAccount = Pattern.compile(regexAccount);
	
	@Transactional
	public void save(NwAccount ka){
		dao.save(NwAccount.class, ka);
	}
	
	@Transactional
	public NwAccount logon(NwAccount ka){
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
		System.out.println(ka);
		List<NwAccount> list = dao.findByExample(NwAccount.class, ka);
		if(list != null && list.size() > 0){
			return list.get(0);
		}		
		return null;
	}
	

}
