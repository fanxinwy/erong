package nw.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * KyCurrentprojectincome entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_currentprojectincome", catalog = "erong")
public class KyCurrentprojectincome implements java.io.Serializable {

	// Fields

	private Long id;
	private Long cpid;
	private Date incomedate;
	private Float expectincome;

	// Constructors

	/** default constructor */
	public KyCurrentprojectincome() {
	}

	/** full constructor */
	public KyCurrentprojectincome(Long cpid, Date incomedate, Float expectincome) {
		this.cpid = cpid;
		this.incomedate = incomedate;
		this.expectincome = expectincome;
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

	@Column(name = "cpid", nullable = false)
	public Long getCpid() {
		return this.cpid;
	}

	public void setCpid(Long cpid) {
		this.cpid = cpid;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "incomedate", nullable = false, length = 10)
	public Date getIncomedate() {
		return this.incomedate;
	}

	public void setIncomedate(Date incomedate) {
		this.incomedate = incomedate;
	}

	@Column(name = "expectincome", nullable = false, precision = 12, scale = 0)
	public Float getExpectincome() {
		return this.expectincome;
	}

	public void setExpectincome(Float expectincome) {
		this.expectincome = expectincome;
	}

}