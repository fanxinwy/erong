package nw.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * KyCurrentprojectdetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_currentprojectdetail", catalog = "erong")
public class KyCurrentprojectdetail implements java.io.Serializable {

	// Fields

	private Long id;
	private Long pid;
	private Long aid;
	private Float inmoney;
	private Float outmoney;
	private Timestamp opdate;

	// Constructors

	/** default constructor */
	public KyCurrentprojectdetail() {
	}

	/** minimal constructor */
	public KyCurrentprojectdetail(Long pid, Long aid) {
		this.pid = pid;
		this.aid = aid;
	}

	/** full constructor */
	public KyCurrentprojectdetail(Long pid, Long aid, Float inmoney,
			Float outmoney, Timestamp opdate) {
		this.pid = pid;
		this.aid = aid;
		this.inmoney = inmoney;
		this.outmoney = outmoney;
		this.opdate = opdate;
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

	@Column(name = "pid", nullable = false)
	public Long getPid() {
		return this.pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	@Column(name = "aid", nullable = false)
	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	@Column(name = "inmoney", precision = 12, scale = 0)
	public Float getInmoney() {
		return this.inmoney;
	}

	public void setInmoney(Float inmoney) {
		this.inmoney = inmoney;
	}

	@Column(name = "outmoney", precision = 12, scale = 0)
	public Float getOutmoney() {
		return this.outmoney;
	}

	public void setOutmoney(Float outmoney) {
		this.outmoney = outmoney;
	}

	@Column(name = "opdate", length = 19)
	public Timestamp getOpdate() {
		return this.opdate;
	}

	public void setOpdate(Timestamp opdate) {
		this.opdate = opdate;
	}

}