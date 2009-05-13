package com.baosight.base.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.baosight.base.dao.ITbRoleDAO;
import com.baosight.base.dao.ITbUserDAO;
import com.baosight.base.dao.ITbUserRoleDAO;
import com.baosight.base.dao.ITbUserdeptDAO;
import com.baosight.base.service.ITbUserMgr;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserdept;

public class TbUserMgrImpl implements ITbUserMgr {
	private ITbUserDAO tbUserDAO;

	private ITbUserRoleDAO tbUserRoleDAO;

	private ITbRoleDAO tbRoleDAO;

	private ITbUserdeptDAO tbUserdeptDAO;
	
	private HashMap cache = new HashMap();

	public ITbUserDAO getTbUserDAO() {
		return tbUserDAO;
	}

	public void setTbUserDAO(ITbUserDAO tbUserDAO) {
		this.tbUserDAO = tbUserDAO;
	}
	public TbUser checkSSL(String key){
		List list;
		if(key!=null && !key.equals("")){
			list = tbUserDAO.findByHQL(
					"from TbUser model where model.ca='" + key + "'", true, -1, -1);
			System.out.println("checkSSL-------------------:"+list.size());
			if(list.size()!=0){
				return (TbUser)list.get(0);
			}else{
				return null;
			}
		}
		return null;
	}
	public String checkUser(String string, String string2, String key) {
		// TODO Auto-generated method stub
		List list;
		/*if(key==null || key.equals("") ){
			return "nameOrcodeError";
		}*/
		if(key!=null && !key.equals("")){
			list = tbUserDAO.findByHQL(
					"from TbUser model where model.ca='" + key + "'", true, -1, -1);
			if(list.size()!=0){
				return "loginIn";
			}else{
				return "nameOrcodeError";
			}
		}else{
			if (string2 == null || "".equals(string2)) {
				list = tbUserDAO.findByHQL(
						"from TbUser model where model.userAcc='" + string
								+ "' and model.pwd is null", true, -1, -1);
			} else {
				list = tbUserDAO
						.findByHQL("from TbUser model where model.userAcc='"
								+ string + "' and model.pwd='" + string2 + "'",
								true, -1, -1);
			}
			// ����У���û��������Ƿ���ȷ
			if (list.size() != 0) {

				// return true;

				// TbUser user = (TbUser) list.get(0);
				// String userID = user.getId();
				// // У���Ƿ�Ϊϵͳ����Ա
				// // ��ѯtb_user_role ���û�id��Ӧ��roleid
				// List userrole = this.tbUserRoleDAO.findByUserid(userID);
				// if (userrole.size() != 0) {
				return "loginIn";
				/*
				 * // key=1 Ϊ��¼sso // ����Ϊ��¼��ϵͳ if (key != null && key.equals("1")) {
				 * TbUserRole tbUserRole = (TbUserRole) userrole.get(0); //
				 * ���û�id��Ӧ��roleid String roleID = tbUserRole.getRoleid(); //
				 * ��ѯtb_role ��roleID��Ӧ��code // �Ƿ�Ϊadministrator,����Ϊ����Ա�ɵ�¼�����򲻿ɵ�¼
				 * TbRole tbRole = this.tbRoleDAO.findById(roleID); if (tbRole !=
				 * null && "administrator".equals(tbRole.getCode())) { return
				 * "loginIn"; } else { return "NoRight"; } } else { return
				 * "loginIn"; }
				 */
				// } else {
				// return "nameOrcodeError";
				// }
			} else {
				return "nameOrcodeError";
			}	
		}
	}

	public Collection getChildren(String parentId) {
		if (this.cache.containsKey(parentId)) {
			return (Collection) this.cache.get(parentId);
		}
		Collection result = new LinkedList();
		// result.addAll(this.tbUserDAO.findByDeptCode(parentId));
		// result.addAll(this.tbUserDAO.findByPst(parentId));
		result.addAll(this.tbUserDAO.findAllUser(parentId, "dept"));
		result.addAll(this.tbUserDAO.findAllUser(parentId, "post"));
		this.cache.put(parentId, result);
		return result;
	}

	public TbUser find(String id) {
		return this.tbUserDAO.findById(id);
	}

	public boolean delete(String nodeId) {
		TbUser item = this.tbUserDAO.findById(nodeId);
		if (item == null) {
			return false;
		}
		// �ڻ�����ͬ��ɾ��
		cacheDelete(item);
		this.tbUserDAO.delete(item);
		return true;
	}

	private void cacheDelete(TbUser item) {
		String parentId = "";
		if ((item.getDeptCode() != null || !"".equals(item.getDeptCode()))
				&& (item.getPst() == null || "".equals(item.getPst()))) {
			parentId = item.getDeptCode();
		} else {
			parentId = item.getPst();
		}
		if (parentId != null && !parentId.equals("")) {
			if (this.cache.containsKey(parentId)) {
				Collection temp = (Collection) this.cache.get(parentId);
				for (Iterator iter = temp.iterator(); iter.hasNext();) {
					TbUser i = (TbUser) iter.next();
					if (i.getId().equals(item.getId())) {
						iter.remove();
						break;
					}
				}
			}
		}
	}

	public void save(TbUser item, String type) {
		this.tbUserDAO.save(item);
		// �ڻ�����ͬ������
		cacheSave(item, type);
	}

	private void cacheSave(TbUser item, String type) {
		String parentId = "";
		/*
		 * if (item.getDeptCode() != null && !item.getDeptCode().equals("")) {
		 * parentId = item.getDeptCode(); } else { parentId = item.getPst(); }
		 */
		if ("dept".equals(type))
			parentId = item.getDeptCode();
		else
			parentId = item.getPst();
		if (parentId != null && !parentId.equals("")) {
			if (this.cache.containsKey(parentId)) {
				Collection temp = (Collection) this.cache.get(parentId);
				temp.add(item);
			} else {
				Collection temp = new ArrayList();
				temp.add(item);
				this.cache.put(parentId, temp);
			}
		}
	}

	public void update(TbUser item) {
		this.tbUserDAO.update(item);
		// �ڻ�����ͬ������
		cacheUpdate(item);
	}

	public void cacheUpdate(TbUser item) {
		String parentId = "";
		/*
		 * if (item.getDeptCode() != null && !item.getDeptCode().equals("")) {
		 * parentId = item.getDeptCode(); } else { parentId = item.getPst(); }
		 */
		if ((item.getDeptCode() != null || !"".equals(item.getDeptCode()))
				&& (item.getPst() == null || "".equals(item.getPst())))
			parentId = item.getDeptCode();
		else
			parentId = item.getPst();
		if (parentId != null && !parentId.equals("")) {
			if (this.cache.containsKey(parentId)) {
				Collection temp = (Collection) this.cache.get(parentId);
				for (Iterator iter = temp.iterator(); iter.hasNext();) {
					Object child = iter.next();
					if (child instanceof TbUser) {
						if (((TbUser) child).getId().equals(item.getId())) {
							iter.remove();
						}
					}
				}
				temp.add(item);
			} else {
				Collection temp = new ArrayList();
				temp.add(item);
				this.cache.put(parentId, temp);
			}
		}
	}

	public List findByLVL(String lvl) {
		return this.tbUserDAO.findByLvl(lvl);
	}

	public List findAll() {
		return this.tbUserDAO.findAll();
	}

	public boolean isValid(String loginName, String password) {
		List userList = tbUserDAO.findByHQL(
				"from TbUser model where model.userAcc='" + loginName
						+ "' and model.pwd='" + password + "'", true, -1, -1);
		if (userList.size() == 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * �ڵ��ƶ�
	 * 
	 * @param parentId
	 * @param nodeId
	 * @param type
	 */
	public void upDownMoveS(String parentId, String nodeId, String defOrder,
			String type) {
		TbUser user = this.tbUserDAO.findById(nodeId);
		TbUser user1 = this.tbUserDAO.findByPDefOrder(parentId, Long
				.parseLong(defOrder), type);
		user.setDefOrder(user1.getDefOrder());
		user1.setDefOrder(Long.parseLong(defOrder));
		this.tbUserDAO.update(user);
		this.tbUserDAO.update(user1);
		this.cacheUpdate(user);
		this.cacheUpdate(user1);

	}

	/**
	 * ȡdeforder�����ֵ
	 * 
	 * @param parentId
	 * @return
	 */
	public long findMaxDefOrder(String parentId) {
		return this.tbUserDAO.findMaxDefOrder(parentId);
	}

	/**
	 * ���û�����ְλ�Ĳ���ID
	 * 
	 * @param parentId
	 * @return
	 */
	public String findDeptIdForUser(String parentId) {
		return this.tbUserDAO.findDeptIdForUser(parentId);
	}

	public ITbRoleDAO getTbRoleDAO() {
		return tbRoleDAO;
	}

	public void setTbRoleDAO(ITbRoleDAO tbRoleDAO) {
		this.tbRoleDAO = tbRoleDAO;
	}

	public ITbUserRoleDAO getTbUserRoleDAO() {
		return tbUserRoleDAO;
	}

	public void setTbUserRoleDAO(ITbUserRoleDAO tbUserRoleDAO) {
		this.tbUserRoleDAO = tbUserRoleDAO;
	}

	public String checkName(String id, String name, String field) {
		List list = tbUserDAO.checkName(id, name, field);
		String checkMessage = "true";
		if (list.size() > 0) {
			checkMessage = "false";
		}
		return checkMessage;
	}

	public String authCA(String capassword) {
		String result = "";
		result = ca(capassword);
		return result;
	}

	public String ca(String capassword) {
		shecasafeapi.SafeEngine my = new shecasafeapi.SafeEngine();
		int ii;
		String result = "";
		String cert;

		System.out.println("-------------------------");
		ii = my.shecaInitEnviroment(9,"com1", capassword, 0, 2, "", "");
		System.out.println(Integer.toHexString(my.getErrorCode()));
		if (my.intReturned != 0) {
			result = my.getErrorCode() + ":" + "CA������ʼ�������CA��Կ����";
			my.shecaClearEnviroment();
			return result;
		} else {
			cert = my.shecaGetSelfCertificate(9, "com1", capassword);
			if (my.intReturned != 0) {
				result = my.getErrorCode() + ":" + "CA��ȡ֤�����";
				my.shecaClearEnviroment();
				return result;
			}
			String caUnique = null;
			caUnique = my.shecaGetCertUniqueID(cert);
			if (my.intReturned != 0) {
				result = my.getErrorCode() + ":" + "CA��ȡΨһ��ʶ����";
				my.shecaClearEnviroment();
				return result;
			}
			if (!caUnique.equals("")) {
				List l = tbUserDAO.findByHQL(
						"from TbUser model where model.capass = '" + capassword
								+ "' and model.ca='" + caUnique + "'", true,
						-1, -1);
				if (l.size() == 0) {
					result = "false:CA��Կ�����CA��Կ����ʲ�ƥ��";
					my.shecaClearEnviroment();
					return result;
				}
			}
			my.shecaClearEnviroment();
			return result;
		}
	}

	/**
	 * �����û�����ѯ�û�
	 */
	public TbUser findUserByName(String name) {
		return (TbUser) tbUserDAO.findByUserAcc(name).get(0);
	}

	public TbUser findByNameAndPwd(String username, String password) {
		// TODO Auto-generated method stub
		if (password == null || "".equals(password)) {
			return findUserByName(username);
		} else {
			TbUser user = new TbUser();
			user.setUserAcc(username);
			user.setPwd(password);

			List list = this.tbUserDAO.findByExample(user);
			return (TbUser) list.get(0);
		}
	}

	// �ճ̰���ѡ���û�������ids��ѯ���û�����
	public String selectUsers(String ids) {
		// TODO Auto-generated method stub

		List userList = new ArrayList();
		String users = "";

		String id[] = ids.split(",");
		int len = id.length;
		if (len > 0) {
			for (int i = 0; i < len; i++) {
				TbUser user = this.tbUserDAO.findById(id[i]);
				userList.add(user);
			}
		}
		int ulen = userList.size();
		if (ulen > 0) {
			for (int j = 0; j < ulen; j++) {
				TbUser tuser = (TbUser) userList.get(j);
				if (j == 0) {
					users = users + tuser.getName();
				} else {
					users = users + "," + tuser.getName();
				}
			}
		}
		// System.out.println(users+"????????????????????????????????????????");
		return users;
	}
	public void checkWorkFlowUser(TbUser user,String newLoginName){
		if(user!=null){
			List list = this.tbUserDAO.findByNativeSql("select * from oademo.T_USER t where t.ENAME='"+user.getUserAcc()+"' and t.NAME='"+user.getName()+"'");
			if(list!=null && list.size()!=0){
				this.tbUserDAO.insertSql("update oademo.T_USER t set t.ENAME='"+newLoginName+"' where t.ENAME='"+user.getUserAcc()+"' and t.NAME='"+user.getName()+"'");
			}
		}
	}
	public List getUserNameAndId(String deptCode){
	 return	tbUserDAO.getUserNameAndId(deptCode);
	}

	public List find4Tree(String rootDeptId){
		String sql="select {t.*} from tb_user t where t.insure=1 and t.dept_code in ("
			+ "select d.id from tb_dept d start with d.id='"+rootDeptId+"' "
			+ "connect by prior d.id=d.par_code) order by name";
		return tbUserDAO.findBySql(sql,"t",TbUser.class);
	}
	
	public String getUserDept(String id){
		String result = "";
		List list = tbUserDAO.findByNativeSql("select t2.attr1 from tb_user t1,tb_userdept t2 where t1.id='"+id+"' and t1.userdept=t2.id");
		if(list!=null && list.size()!=0){
			result  = (String)list.get(0);	
		}
		return result;
	}

	public ITbUserdeptDAO getTbUserdeptDAO() {
		return tbUserdeptDAO;
	}

	public void setTbUserdeptDAO(ITbUserdeptDAO tbUserdeptDAO) {
		this.tbUserdeptDAO = tbUserdeptDAO;
	}
	/**
	 * �����û�����id��ȡ�û�����
	 */
	public TbUserdept findByUserId(String id){		
		List list = this.tbUserdeptDAO.findByHQL("from TbUserdept model1,TbUser model2 where model2.userdept=model1.id and model2.id='"+id+"'", true, -1, -1);
		if(list!=null && list.size()!=0){
			return (TbUserdept)list.get(0);
		}else{
			return null;
		}
	}
	/**
	 * �ж��û��Ƿ���������������
	 * �Ƿ���true�����Ƿ���false
	 * @return
	 */
	public boolean isForDeptOfUser (TbUser user, String deptId) {
		String sql = "select * from (select * from tb_dept t start with t.id=(select us.dept_code from tb_user us where us.id='"+user.getId()+"') " +
				"connect by prior t.id=t.par_code) t1 where t1.id='"+deptId+"'";
		List list = this.tbUserDAO.findByNativeSql(sql);
		if(list!=null && list.size()!=0){
			return true;
		}else{
			return false;
		}
	}
	
	public String getPwdForAutoCert(String userLogin,String cert){
		String result = "";
		List list = tbUserDAO.findByHQL("from TbUser model where model.userAcc='"+userLogin+"' and model.ca='"+cert+"'", true, -1, -1);
		if(list!=null && list.size()!=0){
			TbUser mode   = (TbUser)list.get(0);	
			if(mode!=null){
				result = mode.getPwd();
			}
		}		
		return result;
	}

	public TbUserdept findUserDeptByUserId(String id){		
		List list = this.tbUserdeptDAO.findByHQL("select model1.id from TbUserdept model1,TbUser model2 where model2.userdept=model1.id and model2.id='"+id+"'", true, -1, -1);
		if(list!=null && list.size()!=0){
			String userDeptId = (String)list.get(0);
			TbUserdept mode = this.tbUserdeptDAO.findById(userDeptId);
			return mode;
		}else{
			return null;
		}
	}
	public String caAuth(String userName,String caIdentity){
		String result = "false";
		List list = tbUserDAO.findByHQL("from TbUser model where model.userAcc='"+userName+"' and model.capass='"+caIdentity+"'", true, -1, -1);
		if(list!=null && list.size()!=0){
			result = "true";
		}
		return result;
	}
}
