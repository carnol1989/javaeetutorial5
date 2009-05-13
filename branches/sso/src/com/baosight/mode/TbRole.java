package com.baosight.mode;

/**
 * TbRole generated by MyEclipse Persistence Tools
 */

public class TbRole implements java.io.Serializable {

	// Fields

	private String id;

	private String name;

	private String rem;

	private Long insure;

	private String code;

	// Constructors

	public TbRole(String id, String name, String rem, Long insure, String code) {
		this.id = id;
		this.name = name;
		this.rem = rem;
		this.insure = insure;
		this.code = code;
	}
	public TbRole(String name, String rem, Long insure, String code) {
		this.name = name;
		this.rem = rem;
		this.insure = insure;
		this.code = code;
	}
	/** default constructor */
	public TbRole() {
	}

	/** full constructor */

	// Property accessors
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRem() {
		return this.rem;
	}

	public void setRem(String rem) {
		this.rem = rem;
	}

	public Long getInsure() {
		return insure;
	}

	public void setInsure(Long insure) {
		this.insure = insure;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}