package nw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * KyFinancing entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "nw_financing", catalog = "erong")
public class NwFinancing implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String province;
	private String city;
	private String address;
	private String business;
	private String financinguse;
	private Float column8;
	private Float column9;
	private Float column10;
	private String column11;
	private String column12;

	// Constructors

	/** default constructor */
	public NwFinancing() {
	}

	/** full constructor */
	public NwFinancing(String name, String province, String city,
			String address, String business, String financinguse,
			Float column8, Float column9, Float column10, String column11,
			String column12) {
		this.name = name;
		this.province = province;
		this.city = city;
		this.address = address;
		this.business = business;
		this.financinguse = financinguse;
		this.column8 = column8;
		this.column9 = column9;
		this.column10 = column10;
		this.column11 = column11;
		this.column12 = column12;
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

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "province", length = 50)
	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@Column(name = "city", length = 50)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "address", length = 150)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "business", length = 200)
	public String getBusiness() {
		return this.business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	@Column(name = "financinguse", length = 400)
	public String getFinancinguse() {
		return this.financinguse;
	}

	public void setFinancinguse(String financinguse) {
		this.financinguse = financinguse;
	}

	@Column(name = "Column_8", precision = 12, scale = 0)
	public Float getColumn8() {
		return this.column8;
	}

	public void setColumn8(Float column8) {
		this.column8 = column8;
	}

	@Column(name = "Column_9", precision = 12, scale = 0)
	public Float getColumn9() {
		return this.column9;
	}

	public void setColumn9(Float column9) {
		this.column9 = column9;
	}

	@Column(name = "Column_10", precision = 12, scale = 0)
	public Float getColumn10() {
		return this.column10;
	}

	public void setColumn10(Float column10) {
		this.column10 = column10;
	}

	@Column(name = "Column_11", length = 20)
	public String getColumn11() {
		return this.column11;
	}

	public void setColumn11(String column11) {
		this.column11 = column11;
	}

	@Column(name = "Column_12", length = 50)
	public String getColumn12() {
		return this.column12;
	}

	public void setColumn12(String column12) {
		this.column12 = column12;
	}

}