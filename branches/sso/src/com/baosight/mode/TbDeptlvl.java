package com.baosight.mode;

/**
 * TbDeptlvl generated by MyEclipse Persistence Tools
 */

public class TbDeptlvl implements java.io.Serializable {

	// Fields

	private String id;

	private String name;
	//��д����
	private String ename;

	private String code;

	private String rem;

	// Constructors

	/** default constructor */
	public TbDeptlvl() {
	}

	/** full constructor */
	public TbDeptlvl(String name, String ename, String code, String rem) {
		this.name = name;
		this.ename = ename;
		this.code = code;
		this.rem = rem;
	}

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

	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRem() {
		return this.rem;
	}

	public void setRem(String rem) {
		this.rem = rem;
	}

}