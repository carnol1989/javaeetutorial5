package com.baosight.mode;

public class Dept {
	/**
	 * ���ű��
	 */
	private String code;

	/**
	 * ��������
	 */
	private String name;

	/**
	 * ��������
	 */
	private String type;

	/**
	 * ���ż���
	 */
	private String lvl;

	/**
	 * �ϼ�����
	 */
	private String superior;

	/**
	 * ��ϵ�绰
	 */
	private String tel;

	/**
	 * ��ϵ��
	 */
	private String ctc;

	/**
	 * ��ע�ֶ�
	 */
	private String rmk;

	/**
	 * 
	 * Ĭ�Ϲ��캯��
	 */
	public Dept() {
	}

	/**
	 * ��ʹ�����캯��
	 * 
	 * @param code
	 *            ���ű��
	 * @param name
	 *            ��������
	 * @param type
	 *            ���ż���
	 * @param lvl
	 *            ���ż���
	 * @param superior
	 *            �ϼ�����
	 * @param tel
	 *            ��ϵ�绰
	 * @param ctc
	 *            ��ϵ��
	 * @param rmk
	 *            ��ע�ֶ�
	 */
	public Dept(String code, String name, String type, String lvl,
			String superior, String tel, String ctc, String rmk) {
		this.code = code;
		this.name = name;
		this.type = type;
		this.lvl = lvl;
		this.superior = superior;
		this.tel = tel;
		this.ctc = ctc;
		this.rmk = rmk;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCtc() {
		return ctc;
	}

	public void setCtc(String ctc) {
		this.ctc = ctc;
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

	public String getSuperior() {
		return superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
