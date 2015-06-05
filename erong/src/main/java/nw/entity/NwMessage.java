package nw.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * KyMessage entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "nw_message", catalog = "erong")
public class NwMessage implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String content;
	private Timestamp msgdate;
	private String msgtype;

	// Constructors

	/** default constructor */
	public NwMessage() {
	}

	/** minimal constructor */
	public NwMessage(String title, String content, Timestamp msgdate) {
		this.title = title;
		this.content = content;
		this.msgdate = msgdate;
	}

	/** full constructor */
	public NwMessage(String title, String content, Timestamp msgdate,
			String msgtype) {
		this.title = title;
		this.content = content;
		this.msgdate = msgdate;
		this.msgtype = msgtype;
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

	@Column(name = "msgdate", nullable = false, length = 19)
	public Timestamp getMsgdate() {
		return this.msgdate;
	}

	public void setMsgdate(Timestamp msgdate) {
		this.msgdate = msgdate;
	}

	@Column(name = "msgtype", length = 1)
	public String getMsgtype() {
		return this.msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}

}