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
 * KyFinancingproject entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "nw_financingproject", catalog = "erong")
public class NwFinancingproject implements java.io.Serializable {

	// Fields

	private Long id;
	private String projectname;
	private String projectcode;
	private Long issuingaid;
	private Float expectincome;
	private Float issuingtotal;
	private Float mininvest;
	private Integer timelimit;
	private Date startdate;

	// Constructors

	/** default constructor */
	public NwFinancingproject() {
	}

	/** minimal constructor */
	public NwFinancingproject(String projectname, String projectcode,
			Long issuingaid, Float expectincome, Float issuingtotal,
			Float mininvest, Integer timelimit) {
		this.projectname = projectname;
		this.projectcode = projectcode;
		this.issuingaid = issuingaid;
		this.expectincome = expectincome;
		this.issuingtotal = issuingtotal;
		this.mininvest = mininvest;
		this.timelimit = timelimit;
	}

	/** full constructor */
	public NwFinancingproject(String projectname, String projectcode,
			Long issuingaid, Float expectincome, Float issuingtotal,
			Float mininvest, Integer timelimit, Date startdate) {
		this.projectname = projectname;
		this.projectcode = projectcode;
		this.issuingaid = issuingaid;
		this.expectincome = expectincome;
		this.issuingtotal = issuingtotal;
		this.mininvest = mininvest;
		this.timelimit = timelimit;
		this.startdate = startdate;
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

	@Column(name = "issuingtotal", nullable = false, precision = 12, scale = 0)
	public Float getIssuingtotal() {
		return this.issuingtotal;
	}

	public void setIssuingtotal(Float issuingtotal) {
		this.issuingtotal = issuingtotal;
	}

	@Column(name = "mininvest", nullable = false, precision = 12, scale = 0)
	public Float getMininvest() {
		return this.mininvest;
	}

	public void setMininvest(Float mininvest) {
		this.mininvest = mininvest;
	}

	@Column(name = "timelimit", nullable = false)
	public Integer getTimelimit() {
		return this.timelimit;
	}

	public void setTimelimit(Integer timelimit) {
		this.timelimit = timelimit;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "startdate", length = 10)
	public Date getStartdate() {
		return this.startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

}