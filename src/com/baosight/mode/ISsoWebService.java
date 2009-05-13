package com.baosight.mode;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

public interface ISsoWebService {

	/**
	 * ��ѯ��¼�û���Ϣ
	 * 
	 * @param loginName:��¼��
	 * @return UserInfo����
	 */
	public UserInfo getUserInfo(String loginName, String uuid);

	/**
	 * ��ѯ�û���Ϣ����
	 * 
	 * @param UserId
	 *            �û���ʶ
	 * @param UserName
	 *            �û���
	 * @param UserLevel
	 *            �û�����
	 * @param Department
	 *            �û�������֯
	 * @return
	 */
	public User getUser(String UserId, String UserName, String UserLevel,
			String Department);

	/**
	 * ��ѯ������Ϣ����
	 * 
	 * @param DeptCode
	 *            ���ű��
	 * @param DeptName
	 *            ��������
	 * @param Superior
	 *            �ϼ����ű��
	 * @param DeptLevel
	 *            ���ż���
	 * @return
	 */
	public Dept getDept(String DeptCode, String DeptName, String Superior,
			String DeptLevel);
	/**
	 * ��ȡ���ŵ��û��б����
	 * @param DeptCode ���ű��
	 * @param DeptName ��������
	 * @return
	 */
	public List <User> getUserInfoByDept(String DeptCode,String DeptName); 
	/**
	 * ��ȡ���ŵ��û����б����
	 * @param DeptCode ���ű��
	 * @param DeptName ��������
	 * @return
	 */	
	public List <UserGroup> getUserGroupByDept(String DeptCode,String DeptName);
	/**
	 * ��ȡ�û�����û��б����
	 * @param GroupCode �û�����
	 * @return
	 */
	public List <User> getUserInfoByGroup(String GroupCode);
}