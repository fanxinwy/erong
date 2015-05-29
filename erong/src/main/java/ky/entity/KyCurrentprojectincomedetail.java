package ky.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * KyCurrentprojectincomedetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_currentprojectincomedetail", catalog = "erong")
public class KyCurrentprojectincomedetail implements java.io.Serializable {

	// Fields

	private Long id;
	private Long pid;
	private Long aid;
	private Float currenttotal;
	private Float currentincome;

	// Constructors

	/** default constructor */
	public KyCurrentprojectincomedetail() {
	}

	/** minimal constructor */
	public KyCurrentprojectincomedetail(Long pid, Long aid) {
		this.pid = pid;
		this.aid = aid;
	}

	/** full constructor */
	public KyCurrentprojectincomedetail(Long pid, Long aid, Float currenttotal,
			Float currentincome) {
		this.pid = pid;
		this.aid = aid;
		this.currenttotal = currenttotal;
		this.currentincome = currentincome;
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

	@Column(name = "currenttotal", precision = 12, scale = 0)
	public Float getCurrenttotal() {
		return this.currenttotal;
	}

	public void setCurrenttotal(Float currenttotal) {
		this.currenttotal = currenttotal;
	}

	@Column(name = "currentincome", precision = 12, scale = 0)
	public Float getCurrentincome() {
		return this.currentincome;
	}

	public void setCurrentincome(Float currentincome) {
		this.currentincome = currentincome;
	}

}