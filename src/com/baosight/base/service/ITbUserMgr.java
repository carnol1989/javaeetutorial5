package com.baosight.base.service;

import java.util.Collection;
import java.util.List;

import com.baosight.mode.TbPst;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserdept;
import com.baosight.mode.TbUserinfo;

public interface ITbUserMgr {

	String checkUser(String string, String string2, String key);

	Collection getChildren(String parentId);

	TbUser findByNameAndPwd(String username, String password);

	TbUser find(String id);

	boolean delete(String nodeId);

	void save(TbUser item, String type);

	void update(TbUser item);

	List findByLVL(String lvl);

	List findAll();

	public String checkName(String id, String name, String field);

	public String selectUsers(String ids);

	public boolean isValid(String loginName, String password);

	/**
	 * �ڵ��ƶ�
	 * 
	 * @param parentId
	 * @param nodeId
	 * @param type
	 */
	public void upDownMoveS(String parentId, String nodeId, String defOrder,
			String type);

	/**
	 * ȡdeforder�����ֵ
	 * 
	 * @param parentId
	 * @return
	 */
	public long findMaxDefOrder(String parentId);

	public void cacheUpdate(TbUser item);

	/**
	 * ���û�����ְλ�Ĳ���ID
	 * 
	 * @param parentId
	 * @return
	 */
	public String findDeptIdForUser(String parentId);

	public String authCA(String capassword);

	/**
	 * �����û�����ѯ�û�
	 */
	public TbUser findUserByName(String name);
	public TbUser checkSSL(String key);	
	public void checkWorkFlowUser(TbUser user,String newLoginName);
	public List getUserNameAndId(String deptCode);

	/**
	 * <p>Decription:���Ҳ����������û��������Ӳ��ŵ�</p>
	 * @param rootDeptId ���ڵ�Ĳ���Id
	 * @return �û��б�
	 * @author heaton.cai
	 * <p>Create Time:2008-10-29</p>
	 */
	public List find4Tree(String rootDeptId);
	/**
	 * ��ȡ�û������û�����
	 * @return
	 */
	public String getUserDept(String id);
	/**
	 * �����û���¼����KEY��ȡ����
	 * @param userId
	 * @param cert
	 * @return
	 */
	public String getPwdForAutoCert(String userLogin,String cert);	
	
	/**
	 * ��ȡ�û������û�����
	 * @return
	 */
	public TbUserdept findByUserId(String id);
	/**
	 * �ж��û��Ƿ���������������
	 * �Ƿ���true�����Ƿ���false
	 * @return
	 */
	public boolean isForDeptOfUser (TbUser user, String deptId);

	public TbUserdept findUserDeptByUserId(String id);
	/**
	 * �жϵ�ǰ�û���CA�Ƿ�һ��
	 * @param userName
	 * @param caIdentity
	 * @return
	 */
	public String caAuth(String userName,String caIdentity);
}
