package com.baosight.mode;

/**
 * TbIndividual generated by MyEclipse Persistence Tools
 */

public class TbIndividual implements java.io.Serializable {

	// Fields

	private String id;

	private String individualId;

	private String name;

	private String duty;

	private String department;

	private String fax;

	private String post;

	private String address;

	private String partmentPhone;

	private String movePhone;

	private String homePhone;

	private String email;

	private String qq;

	private String msn;

	private String remark;

	private String attr1;

	private String attr2;

	// Constructors

	/** default constructor */
	public TbIndividual() {
	}

	/** full constructor */
	public TbIndividual(String individualId, String name, String duty,
			String department, String fax, String post, String address,
			String partmentPhone, String movePhone, String homePhone,
			String email, String qq, String msn, String remark, String attr1,
			String attr2) {
		this.individualId = individualId;
		this.name = name;
		this.duty = duty;
		this.department = department;
		this.fax = fax;
		this.post = post;
		this.address = address;
		this.partmentPhone = partmentPhone;
		this.movePhone = movePhone;
		this.homePhone = homePhone;
		this.email = email;
		this.qq = qq;
		this.msn = msn;
		this.remark = remark;
		this.attr1 = attr1;
		this.attr2 = attr2;
	}
	
	public TbIndividual(String individualId, String name, String duty,
			String department, String fax, String post, String address,
			String partmentPhone, String movePhone, String homePhone,
			String email, String qq, String msn, String remark, String attr1) {
		this.individualId = individualId;
		this.name = name;
		this.duty = duty;
		this.department = department;
		this.fax = fax;
		this.post = post;
		this.address = address;
		this.partmentPhone = partmentPhone;
		this.movePhone = movePhone;
		this.homePhone = homePhone;
		this.email = email;
		this.qq = qq;
		this.msn = msn;
		this.remark = remark;
		this.attr1 = attr1;

	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIndividualId() {
		return this.individualId;
	}

	public void setIndividualId(String individualId) {
		this.individualId = individualId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPartmentPhone() {
		return this.partmentPhone;
	}

	public void setPartmentPhone(String partmentPhone) {
		this.partmentPhone = partmentPhone;
	}

	public String getMovePhone() {
		return this.movePhone;
	}

	public void setMovePhone(String movePhone) {
		this.movePhone = movePhone;
	}

	public String getHomePhone() {
		return this.homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getMsn() {
		return this.msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAttr1() {
		return this.attr1;
	}

	public void setAttr1(String attr1) {
		this.attr1 = attr1;
	}

	public String getAttr2() {
		return this.attr2;
	}

	public void setAttr2(String attr2) {
		this.attr2 = attr2;
	}

}