package nw.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import nw.service.UserService;

import org.hibernate.validator.constraints.Email;

/**
 * KyAccount entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "nw_account", catalog = "erong", uniqueConstraints = { @UniqueConstraint(columnNames = "account"),
		@UniqueConstraint(columnNames = "phonenumb") })
public class NwAccount implements java.io.Serializable {

	// Fields

	private Long id;
	private String account;
	private String password;
	private String phonenumb;
	private String accounttype;
	private String email;
	private String name;
	private String idcardtype;
	private String idcard;
	private String avatar;
	private Integer integral;
	private Timestamp lastsignintime;
	private String securequestion;
	private String secureanswer;

	// Constructors

	/** default constructor */
	public NwAccount() {
	}

	/** minimal constructor */
	public NwAccount(String account, String password, String phonenumb) {
		this.account = account;
		this.password = password;
		this.phonenumb = phonenumb;
	}

	/** full constructor */
	public NwAccount(String account, String password, String phonenumb, String accounttype, String email, String name,
			String idcardtype, String idcard, String avatar, Integer integral, Timestamp lastsignintime,
			String securequestion, String secureanswer) {
		this.account = account;
		this.password = password;
		this.phonenumb = phonenumb;
		this.accounttype = accounttype;
		this.email = email;
		this.name = name;
		this.idcardtype = idcardtype;
		this.idcard = idcard;
		this.avatar = avatar;
		this.integral = integral;
		this.lastsignintime = lastsignintime;
		this.securequestion = securequestion;
		this.secureanswer = secureanswer;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "account", unique = true, nullable = false, length = 30)
	@Pattern(regexp = UserService.regexAccount, message = "account is not valid")
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "password", nullable = false, length = 30)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "phonenumb", unique = true, nullable = false, length = 11)
	@Pattern(regexp = UserService.regexPhonenumb, message = "phone is not valid")
	public String getPhonenumb() {
		return this.phonenumb;
	}

	public void setPhonenumb(String phonenumb) {
		this.phonenumb = phonenumb;
	}

	@Column(name = "accounttype", length = 1)
	public String getAccounttype() {
		return this.accounttype;
	}

	public void setAccounttype(String accounttype) {
		this.accounttype = accounttype;
	}

	@Column(name = "email", length = 50)
	@Email(message = "email is not valid")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "idcardtype", length = 1)
	public String getIdcardtype() {
		return this.idcardtype;
	}

	public void setIdcardtype(String idcardtype) {
		this.idcardtype = idcardtype;
	}

	@Column(name = "idcard", length = 50)
	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	@Column(name = "avatar", length = 100)
	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Column(name = "integral")
	public Integer getIntegral() {
		return this.integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	@Column(name = "lastsignintime", length = 19)
	public Timestamp getLastsignintime() {
		return this.lastsignintime;
	}

	public void setLastsignintime(Timestamp lastsignintime) {
		this.lastsignintime = lastsignintime;
	}

	@Column(name = "securequestion", length = 50)
	public String getSecurequestion() {
		return this.securequestion;
	}

	public void setSecurequestion(String securequestion) {
		this.securequestion = securequestion;
	}

	@Column(name = "secureanswer", length = 50)
	public String getSecureanswer() {
		return this.secureanswer;
	}

	public void setSecureanswer(String secureanswer) {
		this.secureanswer = secureanswer;
	}

}