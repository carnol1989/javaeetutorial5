package com.baosight.mode;

public class User {
	/**
	 * �û���ʶ
	 */
	private String userid;

	/**
	 * �û���ʵ����
	 */
	private String name;

	/**
	 * �û���
	 */
	private String useracc;

	/**
	 * ����
	 */
	private String pwd;

	/**
	 * �û�����
	 */
	private String lvl;

	/**
	 * �û���������
	 */
	private String dept;

	/**
	 * ��ϵ�绰
	 */
	private String tel;

	/**
	 * ְ��
	 */
	private String pst;

	/**
	 * ��ע
	 */
	private String rmk;

	/**
	 * 
	 * Ĭ�Ϲ��캯��
	 */
	public User() {
	}

	/**
	 * ��ʹ�����캯��
	 * 
	 * @param userid
	 *            �û���ʶ
	 * @param name
	 *            �û���ʵ����
	 * @param useracc
	 *            �û���
	 * @param pwd
	 *            ����
	 * @param lvl
	 *            �û�����
	 * @param dept
	 *            �û���������
	 * @param tel
	 *            ��ϵ�绰
	 * @param pst
	 *            ְ��
	 * @param rmk
	 *            ��ע
	 */
	public User(String userid, String name, String useracc, String pwd,
			String lvl, String dept, String tel, String pst, String rmk) {
		this.userid = userid;
		this.name = name;
		this.useracc = useracc;
		this.pwd = pwd;
		this.lvl = lvl;
		this.dept = dept;
		this.tel = tel;
		this.pst = pst;
		this.rmk = rmk;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getLvl() {
		return lvl;
	}

	public void setLvl(String lvl) {
		this.lvl = lvl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPst() {
		return pst;
	}

	public void setPst(String pst) {
		this.pst = pst;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUseracc() {
		return useracc;
	}

	public void setUseracc(String useracc) {
		this.useracc = useracc;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
