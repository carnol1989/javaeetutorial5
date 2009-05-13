package com.baosight.mode;

public class UserGroup {
	/**
	 * �û�����
	 */
	private String code;

	/**
	 * �û�������
	 */
	private String name;

	/**
	 * �û��鼶��
	 */
	private String lvl;

	/**
	 * ��ע
	 */
	private String rmk;

	/**
	 * 
	 * Ĭ�Ϲ��캯��
	 */
	public UserGroup() {
	}

	/**
	 * ��ʹ�����캯��
	 * 
	 * @param code
	 *            �û�����
	 * @param name
	 *            �û�������
	 * @param lvl
	 *            �û��鼶��
	 * @param rmk
	 *            ��ע
	 */
	public UserGroup(String code, String name, String lvl, String rmk) {
		this.code = code;
		this.name = name;
		this.lvl = lvl;
		this.rmk = rmk;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}

}
