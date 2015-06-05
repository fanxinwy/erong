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
 * KyNotice entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ky_notice", catalog = "erong")
public class KyNotice implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String content;
	private Date noticedate;

	// Constructors

	/** default constructor */
	public KyNotice() {
	}

	/** full constructor */
	public KyNotice(String title, String content, Date noticedate) {
		this.title = title;
		this.content = content;
		this.noticedate = noticedate;
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

	@Column(name = "title", nullable = false, length = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", nullable = false, length = 500)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "noticedate", nullable = false, length = 10)
	public Date getNoticedate() {
		return this.noticedate;
	}

	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}

}