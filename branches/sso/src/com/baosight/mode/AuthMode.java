package com.baosight.mode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AuthMode {
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
	 * ��ϵͳ�б�
	 */
	private List appList = new ArrayList();
	/**
	 * key:TbAppsys��id
	 * value:TbAuthInfo����
	 */
	private Map authMap = new HashMap();
	/**
	 * key:TbAppsys��id
	 * value:TbFunction����
	 */
	private Map funMap = new HashMap();	
	/**
	 * key:TbFunction��id
	 * value:TbRighttype����
	 */
	private Map rightTypeMap = new HashMap();	
}
