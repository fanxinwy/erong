package ky.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * KyCurrentproject entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_currentproject", catalog = "erong")
public class KyCurrentproject implements java.io.Serializable {

	// Fields

	private Long id;
	private String projectname;
	private String projectcode;
	private Long issuingaid;
	private Float expectincome;

	// Constructors

	/** default constructor */
	public KyCurrentproject() {
	}

	/** full constructor */
	public KyCurrentproject(String projectname, String projectcode,
			Long issuingaid, Float expectincome) {
		this.projectname = projectname;
		this.projectcode = projectcode;
		this.issuingaid = issuingaid;
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

	@Column(name = "projectname", nullable = false, length = 100)
	public String getProjectname() {
		return this.projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	@Column(name = "projectcode", nullable = false, length = 100)
	public String getProjectcode() {
		return this.projectcode;
	}

	public void setProjectcode(String projectcode) {
		this.projectcode = projectcode;
	}

	@Column(name = "issuingaid", nullable = false)
	public Long getIssuingaid() {
		return this.issuingaid;
	}

	public void setIssuingaid(Long issuingaid) {
		this.issuingaid = issuingaid;
	}

	@Column(name = "expectincome", nullable = false, precision = 12, scale = 0)
	public Float getExpectincome() {
		return this.expectincome;
	}

	public void setExpectincome(Float expectincome) {
		this.expectincome = expectincome;
	}

}