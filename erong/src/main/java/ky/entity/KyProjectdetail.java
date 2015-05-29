package ky.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * KyProjectdetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_projectdetail", catalog = "erong")
public class KyProjectdetail implements java.io.Serializable {

	// Fields

	private Long id;
	private Long pid;
	private Long aid;
	private Float issuing;

	// Constructors

	/** default constructor */
	public KyProjectdetail() {
	}

	/** full constructor */
	public KyProjectdetail(Long pid, Long aid, Float issuing) {
		this.pid = pid;
		this.aid = aid;
		this.issuing = issuing;
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

	@Column(name = "issuing", nullable = false, precision = 12, scale = 0)
	public Float getIssuing() {
		return this.issuing;
	}

	public void setIssuing(Float issuing) {
		this.issuing = issuing;
	}

}