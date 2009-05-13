package com.baosight.mode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class UserInfo {

	/**
	 * �û���
	 */
	private String userName;

	/**
	 * ��¼��
	 */
	private String loginName;

	/**
	 * ��������
	 */
	private String deptName;

	/**
	 * ����ID
	 */
	private String deptId;

	/**
	 * ��λ����
	 */
	private String postName;

	/**
	 * ��λID
	 */
	private String postId;

	/**
	 * �û���ɫ�б�
	 */
	private List<TbRole> roleList = new ArrayList<TbRole>();

	/**
	 * �û���Դ�б�
	 */
	private List<TbFunction> funList = new ArrayList<TbFunction>();

	/**
	 * �û�Ȩ�޲����б�
	 */
	private List<TbAuthInfo> authInfoList = new ArrayList<TbAuthInfo>();

	/**
	 * �û�����Ȩ�������б�
	 */
	private List<TbRighttype> rightTypeList = new ArrayList<TbRighttype>();

	/**
	 * �û���ɫ/����Ȩ�޹�ϵ�����б�
	 */
	private List<TbRoleAuth> roleAuthList = new ArrayList<TbRoleAuth>();

	/**
	 * Ӧ��ϵͳ�����б�
	 */
	private List<TbAppsys> appSysList = new ArrayList<TbAppsys>();

	public List<TbAuthInfo> getAuthInfoList() {
		return authInfoList;
	}

	public void setAuthInfoList(List<TbAuthInfo> authInfoList) {
		this.authInfoList = authInfoList;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public List<TbFunction> getFunList() {
		return funList;
	}

	public void setFunList(List<TbFunction> funList) {
		this.funList = funList;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public List<TbRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<TbRole> roleList) {
		this.roleList = roleList;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<TbRighttype> getRightTypeList() {
		return rightTypeList;
	}

	public void setRightTypeList(List<TbRighttype> rightTypeList) {
		this.rightTypeList = rightTypeList;
	}

	public List<TbRoleAuth> getRoleAuthList() {
		return roleAuthList;
	}

	public void setRoleAuthList(List<TbRoleAuth> roleAuthList) {
		this.roleAuthList = roleAuthList;
	}

	public List<TbAppsys> getAppSysList() {
		return appSysList;
	}

	public void setAppSysList(List<TbAppsys> appSysList) {
		this.appSysList = appSysList;
	}

	/**
	 * Ĭ�Ϲ��캯��
	 */
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * ��ʹ�����캯��
	 */

	public UserInfo(String userName, String loginName, String deptName,
			String deptId, String postName, String postId,
			List<TbRole> roleList, List<TbFunction> funList,
			List<TbAuthInfo> authInfoList, List<TbRighttype> rightTypeList,
			List<TbRoleAuth> roleAuthList, List<TbAppsys> appSysList) {
		super();
		this.userName = userName;
		this.loginName = loginName;
		this.deptName = deptName;
		this.deptId = deptId;
		this.postName = postName;
		this.postId = postId;
		this.roleList = roleList;
		this.funList = funList;
		this.authInfoList = authInfoList;
		this.rightTypeList = rightTypeList;
		this.roleAuthList = roleAuthList;
		this.appSysList = appSysList;
	}
	/**
	 * ����TbRole�������ϵͳ�����ȡ�ý�ɫ����Ӧ����Դ
	 * @param tbRole ��ɫ����
	 * @param appSysCode ��ϵͳ����
	 * @return ��Դ�б�
	 */
	public List<TbFunction> getFunListByRole(TbRole tbRole,String appSysCode){
		List<TbFunction> result = new ArrayList<TbFunction>();
		if(tbRole!=null){
			List <TbRoleAuth> roleAuthL = this.roleAuthList;
			List <TbAuthInfo> authInfoL = this.authInfoList;
			List <TbFunction> fL = this.funList;
			List <String> raL = new ArrayList<String>();
			List <String> funL = new ArrayList<String>();
			for(Iterator it = roleAuthL.iterator();it.hasNext();){
				TbRoleAuth tbRoleAuth = (TbRoleAuth)it.next();
				if(tbRoleAuth.getRoleid().equals(tbRole.getId())){
					raL.add(tbRoleAuth.getAuthid());
				}
			}
			for(Iterator it = authInfoL.iterator();it.hasNext();){
				TbAuthInfo tbAuthInfo = (TbAuthInfo)it.next();
				for(Iterator itR = raL.iterator();itR.hasNext();){
					String roleId = (String)itR.next();
					if(tbAuthInfo.getId().equals(roleId)){
						funL.add(tbAuthInfo.getFunid());
					}
				}
			}
			for(Iterator it = fL.iterator();it.hasNext();){
				TbFunction tbFunction = (TbFunction)it.next();
				for(Iterator itF = funL.iterator();itF.hasNext();){
					String funId = (String)itF.next();
					if(tbFunction.getId().equals(funId) && tbFunction.getSysId().equals(appSysCode)){
						result.add(tbFunction);
					}
				}
			}
			return result;
		}else{
			return null;
		}
	}
	/**
	 * ��ȡTbFunction���ܷ��ʵ�Ȩ�������б�
	 * @param tbFunction ��Դ����
	 * @return Ȩ�������б�
	 */
	public List<TbRighttype> getRightTypeListByFun(TbFunction tbFunction){
		List<TbRighttype> result = new ArrayList<TbRighttype>();
		if(tbFunction!=null){
			List <TbAuthInfo> authInfoL = this.authInfoList;
			List <TbRighttype> rightTypeL = this.rightTypeList;
			String  rightTypeId = "";
			for(Iterator it = authInfoL.iterator();it.hasNext();){
				TbAuthInfo tbAuthInfo = (TbAuthInfo)it.next();
				if(tbAuthInfo.getFunid().equals(tbFunction.getId())){
					rightTypeId = tbAuthInfo.getRighttypeid();
					break;
				}
			}
			if(!rightTypeId.equals("")){
				String r [] = rightTypeId.split(",");
				for(Iterator it = rightTypeL.iterator();it.hasNext();){
					TbRighttype tbRighttype = (TbRighttype)it.next();
					for(int i=0;i<r.length;i++){
						if(tbRighttype.getId().equals(r[i])){
							result.add(tbRighttype);
						}
					}
				}
			}
			return result;
		}else{
			return null;
		}
	}
}
