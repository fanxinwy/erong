package ky.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * KyBankcard entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_bankcard", catalog = "erong", uniqueConstraints = @UniqueConstraint(columnNames = "cardnumb"))
public class KyBankcard implements java.io.Serializable {

	// Fields

	private Long id;
	private Long aid;
	private String cardnumb;
	private String name;
	private String deposit;
	private String depositprovince;
	private String depositcity;
	private String branch;

	// Constructors

	/** default constructor */
	public KyBankcard() {
	}

	/** minimal constructor */
	public KyBankcard(Long aid, String cardnumb, String name) {
		this.aid = aid;
		this.cardnumb = cardnumb;
		this.name = name;
	}

	/** full constructor */
	public KyBankcard(Long aid, String cardnumb, String name, String deposit,
			String depositprovince, String depositcity, String branch) {
		this.aid = aid;
		this.cardnumb = cardnumb;
		this.name = name;
		this.deposit = deposit;
		this.depositprovince = depositprovince;
		this.depositcity = depositcity;
		this.branch = branch;
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

	@Column(name = "aid", nullable = false)
	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	@Column(name = "cardnumb", unique = true, nullable = false, length = 50)
	public String getCardnumb() {
		return this.cardnumb;
	}

	public void setCardnumb(String cardnumb) {
		this.cardnumb = cardnumb;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "deposit", length = 50)
	public String getDeposit() {
		return this.deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	@Column(name = "depositprovince", length = 50)
	public String getDepositprovince() {
		return this.depositprovince;
	}

	public void setDepositprovince(String depositprovince) {
		this.depositprovince = depositprovince;
	}

	@Column(name = "depositcity", length = 50)
	public String getDepositcity() {
		return this.depositcity;
	}

	public void setDepositcity(String depositcity) {
		this.depositcity = depositcity;
	}

	@Column(name = "branch", length = 100)
	public String getBranch() {
		return this.branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

}