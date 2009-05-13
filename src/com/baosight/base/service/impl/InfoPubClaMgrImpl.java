package com.baosight.base.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.baosight.base.dao.ITbInfoPubClaDAO;
import com.baosight.base.service.IInfoPubClaMgr;
import com.baosight.mode.TbInfoPubCla;
import com.baosight.mode.TbRighttype;
import com.baosight.mode.TbRoleCla;
import com.baosight.mode.TbUser;


public class InfoPubClaMgrImpl implements IInfoPubClaMgr {
	private HashMap cache = new HashMap();
	private ITbInfoPubClaDAO tbInfoPubClaDAO;
	public void delete(String id) {
		TbInfoPubCla item = this.tbInfoPubClaDAO.findById(id);
		this.tbInfoPubClaDAO.delete(item);
	}

	public List findAll() {
		// TODO Auto-generated method stub
		return this.tbInfoPubClaDAO.findAll();
	}

	public TbInfoPubCla findById(String id) {
		// TODO Auto-generated method stub
		return this.tbInfoPubClaDAO.findById(id);
	}
	
	public List findByParentid(Object parentid) {
		// TODO Auto-generated method stub
		return this.tbInfoPubClaDAO.findByParentid(parentid);
	}
	
	public List findByParentIdOrder(Object parentid){
		return this.tbInfoPubClaDAO.findByParentIdOrder(parentid);
	}
	
	public Serializable save(TbInfoPubCla model) {
		// TODO Auto-generated method stub
		Serializable id = this.tbInfoPubClaDAO.save(model);
		cacheSave(model);
		return id;
	}
	private void cacheSave(TbInfoPubCla model) {
		String parentId = model.getParentid();
		if (parentId != null && !parentId.equals("")) {
			if (this.cache.containsKey(parentId)) {
				Collection temp = (Collection) this.cache.get(parentId);
				temp.add(model);
			} else {
				Collection temp = new ArrayList();
				temp.add(model);
				this.cache.put(parentId, temp);
			}
		}
	}

	public void updte(TbInfoPubCla model) {
		// TODO Auto-generated method stub
		this.tbInfoPubClaDAO.update(model);
		cacheUpdate(model);
	}
	
	private void cacheUpdate(TbInfoPubCla model) {
		String parentId = model.getParentid();
		if (parentId != null && !parentId.equals("")) {
			if (this.cache.containsKey(parentId)) {
				Collection temp = (Collection) this.cache.get(parentId);
				for (Iterator iter = temp.iterator(); iter.hasNext();) {
					Object child = iter.next();
					if (child instanceof TbInfoPubCla) {
						if (((TbInfoPubCla) child).getId().equals(
								((TbInfoPubCla) model).getId())) {
							iter.remove();
							break;
						}
					}
				}
				temp.add(model);
			} else {
				Collection temp = new ArrayList();
				temp.add(model);
				this.cache.put(parentId, temp);
			}
		}
	}
	
	public TbInfoPubCla getRoot(String type) {
		List list = tbInfoPubClaDAO.findEnableIsTure(type);
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			TbInfoPubCla item = (TbInfoPubCla) iter.next();
			if (item.getParentid() == null || item.getParentid().equals("") || item.getParentid().equals("0")) {
				return item;
			}
		}
		return null;
	}
	
	public Collection getChildren(String parentId,String[] roleForCla) {
		if (this.cache.containsKey(parentId)) {
			return (Collection) this.cache.get(parentId);
		}
		Collection temp = this.tbInfoPubClaDAO.getChildren(parentId,roleForCla);
		this.cache.put(parentId, temp);
		return temp;
	}

	public List getId(String code)
	{
		//sql����
		String sql=""
			+"	select cla.id "
			+"	from tb_info_pub_cla cla "
			+"	where cla.code='"+code+"'";
		return tbInfoPubClaDAO.findBySql(sql);
	}
	public List findEnableIsTure(String type) {
		// TODO Auto-generated method stub
		return this.tbInfoPubClaDAO.findEnableIsTure(type);
	}
	public List findParentID_EnableIsTure(String parentid){
		return this.tbInfoPubClaDAO.findParentID_EnableIsTure(parentid);
	}
	public ITbInfoPubClaDAO getTbInfoPubClaDAO() {
		return tbInfoPubClaDAO;
	}

	public void setTbInfoPubClaDAO(ITbInfoPubClaDAO tbInfoPubClaDAO) {
		this.tbInfoPubClaDAO = tbInfoPubClaDAO;
	}

	public List findByPIdClaName(String parentid,String claname,TbUser user){
		String hql="from TbInfoPubCla model where model.name like '%"+claname+"%' " +
				"and model.parentid = '"+parentid+"' and model.id in " +
				"(select distinct rc.claId from TbUserRole ur,TbRoleCla rc where ur.userid='"+user.getId()+"' " +
				"and ur.roleid=rc.roleId) order by model.defOrder asc";
		return this.tbInfoPubClaDAO.findByHQL(hql, true, -1, -1);
	}

	public void upAndDownCla(String parentid,String nodeId,String type){
		String hql = "";
		TbInfoPubCla item1 = this.tbInfoPubClaDAO.findById(nodeId);
		long defOrder1 = item1.getDefOrder();
		List list = null;
		TbInfoPubCla item2 = new TbInfoPubCla();
		if ("up".equals(type)){
			hql = "from TbInfoPubCla model where model.defOrder=" +
					"(select max(t1.defOrder) from TbInfoPubCla t1 where t1.parentid='"+parentid+"' " +
					"and t1.defOrder<'"+item1.getDefOrder()+"') and model.parentid = '"+parentid+"'";
			
		}
		else if ("down".equals(type)){
			hql = "from TbInfoPubCla model where model.defOrder=" +
			"(select min(t1.defOrder) from TbInfoPubCla t1 where t1.parentid='"+parentid+"' " +
			"and t1.defOrder>'"+item1.getDefOrder()+"') and model.parentid = '"+parentid+"'";
		}
		list = this.tbInfoPubClaDAO.findByHQL(hql, true, -1, -1);
		item2 = list.isEmpty()?null:(TbInfoPubCla)list.get(0);
		
		item1.setDefOrder(item2.getDefOrder());
		item2.setDefOrder(defOrder1);
		this.tbInfoPubClaDAO.update(item1);
		this.tbInfoPubClaDAO.update(item2);
		
		this.cacheUpdate(item1);
		this.cacheUpdate(item2);
	}

	/**
	 * ȡdeforder�����ֵ
	 * 
	 * @param parentId
	 * @return
	 */
	public long getMaxDefOrder(String parentId) {
		
		return this.tbInfoPubClaDAO.findMaxDefOrder(parentId);
	}
	/**
	 *��idȡ��Ŀ��
	 * @param id
	 * @return
	 */
	public String selectClas(String id) {
		/*if (id.indexOf(',')!=-1)
			id = id.substring(id.indexOf(',')+1);*/
		String ids = this.idStr(id);
		String sql = "select ipc.name from Tb_Info_Pub_Cla ipc where ipc.id in ("+ids+")";
		List list = this.tbInfoPubClaDAO.findBySql(sql);
		String nameStr = list.toString();
		return nameStr.substring(nameStr.indexOf('[')+1,nameStr.lastIndexOf(']'));
		//return ((TbInfoPubCla)this.tbInfoPubClaDAO.findById(id)).getName();
	}
	public String idStr(String id) {
		String[] idArry = null;
		StringBuffer ids = new StringBuffer("");
		int len = 0;
		if (id.indexOf(',')!=-1) {
			idArry = id.split(",");
		if (idArry!=null)
			len = idArry.length;
		for (int i=0;i<len;i++) {
			if (i!=len-1)
				ids.append("'").append(idArry[i]).append("',");
			else
				ids.append("'").append(idArry[i]).append("'");
		}
			return ids.toString();
		}
		else return "'"+id+"'";
	}
	//ȡ��Ŀ��Ӧ�����н�ɫ
	public List getRolesForClaList() {
		return this.tbInfoPubClaDAO.findRolesForCla();
	}
	//ȡ��Ŀ��Ӧ����ѡ��ɫ
	public List findRolesSeled(String id) {
		return this.tbInfoPubClaDAO.findRolesSeled(id);
	}
	//ȡ��Ŀ��Ӧδѡ��ɫ
	public List findRolesUnSeled(String id) {
		return this.tbInfoPubClaDAO.findRolesUnSeled(id);
	}
	//Ϊ��Ŀ���ѡ��Ľ�ɫ
	public boolean disRolesForCla(String claid,String[] roles) {
			//2008-10-07 cjf��(ԭ�򣺸��ڵ��ɫȥ�����ӽӵ���Ӧ��ɫҲͬʱȥ��)
			this.tbInfoPubClaDAO.deleteFromRoleCla(claid,roles);
			/*//2008-10-07 cjf��(ԭ�򣺸ýڵ��ɫ��ӣ��ýӵ㸸�ӵ���Ӧ��ɫҲͬʱ���)*/
			String sql = "select ipc.id from Tb_Info_Pub_Cla ipc start with id='"+claid+"' connect by prior ipc.id=ipc.parentid";
			List claIdList = this.tbInfoPubClaDAO.findBySql(sql);
			if (roles.length>0)
			for (String role:roles) {
				if (claIdList!=null&&!claIdList.isEmpty()) {
					int size = claIdList.size();
					for (int i=0;i<size;i++) {
						TbRoleCla roleCla = new TbRoleCla(claIdList.get(i).toString(),role,"");
						this.tbInfoPubClaDAO.saveRoleCla(roleCla);
					}
				}
			}
		return true;
	}
	//	�ж��Ƿ��в���Ȩ��
	public boolean isCanNotdo(String claid,String rightcode,String userId) {
		String rightidSql = "from TbRighttype t where t.code like '%"+rightcode+"%'";
		List list = tbInfoPubClaDAO.findByHQL(rightidSql, true, -1, -1);
		String rightid = "";
		
		if (!list.isEmpty()) {
			for (int i=0;i<list.size();i++)
			rightid +=((TbRighttype)list.get(i)).getId()+",";
			
			rightid = rightid.substring(0,rightid.lastIndexOf(','));
		String hql = "from TbAuthInfo authinfo where authinfo.id in ( select roleauth.authid " +
				" from TbRoleAuth roleauth where roleauth.roleid in ( select userrole.roleid " +
				" from TbUserRole userrole where userrole.roleid in (select rolecla.roleId " +
				" from TbRoleCla rolecla  where rolecla.claId='"+claid+"') and userrole.userid='"+userId+"')) " +
				" and authinfo.righttypeid like '%"+rightid+"%'";
		return ((List)this.tbInfoPubClaDAO.findByHQL(hql, true, -1, -1)).isEmpty()?true:false;
		}
		else return true;
	}
	/**
	 * ȡ��Ŀ��
	 * @param roleForCla
	 * @return
	 */
	public List getClaListTest(String[] roleForCla,String rootId) {
		String roleStr="'00'"+",";
		for (int i=0;roleForCla.length>0&&i<roleForCla.length;i++)
			roleStr+="'"+roleForCla[i]+"'"+',';
		if (!"".equals(roleStr))
			roleStr=roleStr.substring(0,roleStr.lastIndexOf(','));
		String sql = "select * from (select level lvl,t.* from tb_info_pub_cla t " +
				"start with id='"+rootId+"' connect by prior id=parentid and t.enable='1' order by level) t2 " +
				"where  exists (select t1.cla_Id from Tb_Role_Cla t1 where t1.role_Id in ("+roleStr+") " +
				"and t2.id=t1.cla_Id) or t2.id='0' order by lvl,t2.def_order asc";
		return tbInfoPubClaDAO.findBySql(sql);
	}
	public String getClaForLayout(String belong,String code){
		String result = "";
		String sql = "";
		String innerCode = "";
		if(belong!=null && code!=null){
			//��
			if(belong.equals("1")){
				if(code.equals("jb")){
					innerCode = "ju_jb";//��
				}else if(code.equals("chinfo")){
					innerCode = "ju_cyxx";//������Ϣ
				}else if(code.equals("zhxx")){
					innerCode = "ju_zhxx";//�ۺ���Ϣ
				}else if(code.equals("swdt")){
					innerCode = "ju_swdt";//ˮ��̬
				}else if(code.equals("zt")){
					innerCode = "ju_zt";//ר��
				}else if(code.equals("tztg")){
					innerCode = "ju_tztg";//֪ͨͨ��
				}else if(code.equals("gs")){
					innerCode = "gs";//��ʾ
				}else{
					innerCode = code;
				}
				sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='bureauinfopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
			}
			//��������
			if(belong.equals("2")){
				if(code.equals("zt")){
					//ר��
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("slzxbb")){
					//���²���
					innerCode = "zxbb";
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("tztg")){
					//֪ͨͨ��
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("gs")){
					//��ʾ
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("hyjy")){
					//�����Ҫ
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("zxjb")){
					//���ļ�
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("ywtb")){
					//ҵ��ͨ��
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("zxfw")){
					//���ķ���
					innerCode = code;
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='sy' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("ddjs")){
					//���Ľ���
					innerCode = code;
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("ghyd")){
					//����԰��
					innerCode = code;
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("tysh")){
					//��Ա����
					innerCode = code;
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='shliinfopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else{
					innerCode = code;
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='govinfopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}
			}
			//��Ϣ����
			if(belong.equals("3")){
				if(code.equals("jb")){
					innerCode = "Briefing";//��
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("chinfo")){
					innerCode = "chinfo";//������Ϣ
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("zhxx")){
					innerCode = "zonghexinxi";//�ۺ���Ϣ
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("tztg")){
					innerCode = "tongzhitonggao";//֪ͨͨ��
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("gs")){
					innerCode = "gs";//��ʾ
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}else if(code.equals("DynamicBusiness")){
					innerCode = "DynamicBusiness";//ҵ��̬(86)(���±�(100-Briefing))
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='infopub' and t2.parentid=t1.id and t2.code='Briefing' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else if(code.equals("InfoMS")){
					innerCode = "InfoMS";//���簲ȫ(���Ҷ�̬�±ߵ�(��Ϣ�����(85))
					sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='infopub' and t2.parentid=t1.id and t2.code='DynamicSections' and t3.parentid=t2.id and t3.code='"+innerCode+"'";
				}else{
					innerCode = code;
					sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+innerCode+"'";
				}
			}			
		}
		if(sql!=null && !sql.equals("")){
			//��Ѵר��
			Map map = isFXZL(code);
			String isExist = (String)map.get("isExist");
			if(isExist!=null && isExist.equals("true")){
				String finalCode = (String)map.get("code");
				return finalCode;
			}
			//ˮ��Դר��
			map = isSZYZL(code);
			isExist = (String)map.get("isExist");
			if(isExist!=null && isExist.equals("true")){
				String finalCode = (String)map.get("code");
				return finalCode;
			}
			//����ר��
			map = isZWZL(code);
			isExist = (String)map.get("isExist");
			if(isExist!=null && isExist.equals("true")){
				String finalCode = (String)map.get("code");
				return finalCode;
			}			
			
			if(isExist!=null && isExist.equals("false")){
				List list = tbInfoPubClaDAO.findBySql(sql);
				if(list!=null && list.size()!=0){
					result = (String)list.get(0);
					return result;
				}
			}
		}
		return result;
	}
	/**
	 * ���Ի������ж�code�Ƿ�Ϊ��Ѵר��
	 * @param code
	 * @return
	 */
	public Map isFXZL(String code){
		Map result = new HashMap();
		result.put("isExist", "false");
		result.put("code", "");
		String sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='unifieddoor' and t2.parentid=t1.id and t2.code='fxzl' and t3.parentid=t2.id and t3.code='"+code+"'";
		List list = tbInfoPubClaDAO.findBySql(sql);
		if(list!=null && list.size()!=0){
			result.put("isExist", "true");
			result.put("code", (String)list.get(0));
		}
		return result;
	}
	/**
	 * ���Ի������ж�code�Ƿ�Ϊˮ��Դר��
	 * @param code
	 * @return
	 */
	public Map isSZYZL(String code){
		Map result = new HashMap();
		result.put("isExist", "false");
		result.put("code", "");
		String sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='unifieddoor' and t2.parentid=t1.id and t2.code='szyzl' and t3.parentid=t2.id and t3.code='"+code+"'";
		List list = tbInfoPubClaDAO.findBySql(sql);
		if(list!=null && list.size()!=0){
			result.put("isExist", "true");
			result.put("code", (String)list.get(0));
		}
		return result;
	}
	/**
	 * ���Ի������ж�code�Ƿ�Ϊ����ר��
	 * @param code
	 * @return
	 */
	public Map isZWZL(String code){
		Map result = new HashMap();
		result.put("isExist", "false");
		result.put("code", "");
		String sql = "";
		if(code.equals("gknb")){//�����걨(ͳһ�Ż�)
			sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='unifieddoor' and t2.parentid=t1.id and t2.code='"+code+"'";
		}else if(code.equals("zxbb")){//���²���(��ҳ)
			sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='unifieddoor' and t2.parentid=t1.id and t2.code='index' and t3.parentid=t2.id and t3.code='"+code+"'";
		}else if(code.equals("tongzhitonggao")){//֪ͨͨ��(��Ϣ������Ϣ����)
			sql = "select t2.id from tb_info_pub_cla t1,tb_info_pub_cla t2 where t1.code='infopub' and t2.parentid=t1.id and t2.code='"+code+"'";
		}else if(code.equals("swdt")){//ˮ��̬(��ҳ)
			sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='unifieddoor' and t2.parentid=t1.id and t2.code='index' and t3.parentid=t2.id and t3.code='"+code+"'";
		}else if(code.equals("zfxxgk")){//������Ϣ��������
			sql = "select t1.id from tb_info_pub_cla t1 where t1.code='govinfopub'";
		}else{
			sql = "select t3.id from tb_info_pub_cla t1,tb_info_pub_cla t2,tb_info_pub_cla t3 where t1.code='unifieddoor' and t2.parentid=t1.id and t2.code='zwzl' and t3.parentid=t2.id and t3.code='"+code+"'";
		}
		List list = tbInfoPubClaDAO.findBySql(sql);
		if(list!=null && list.size()!=0){
			result.put("isExist", "true");
			result.put("code", (String)list.get(0));
		}
		return result;
	}	
}
