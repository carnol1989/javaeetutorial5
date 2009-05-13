package com.baosight.base.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import com.baosight.mode.TbInfoPubCla;
import com.baosight.mode.TbUser;

public interface IInfoPubClaMgr {
	TbInfoPubCla getRoot(String type);
	
	Collection getChildren(String parentId,String[] roleForCla);
	
	public List findAll();

	public  TbInfoPubCla findById(String id);

	public void updte(TbInfoPubCla model);

	public void delete(String id);

	public Serializable save(TbInfoPubCla model);
	
	public abstract List findByParentid(Object parentid);
	
	public abstract List findByParentIdOrder(Object parentid);
	
	public abstract List findEnableIsTure(String type);
	
	public abstract List findParentID_EnableIsTure(String parentid);
	
	public abstract List getId(String code);
	
	public abstract List findByPIdClaName(String parentid,String claname,TbUser user);
	
	public abstract void upAndDownCla(String parentid,String nodeId,String type);
	
	/**
	 * ȡdeforder�����ֵ
	 * @param parentId
	 * @return
	 */
	public long getMaxDefOrder(String parentId);
	/**
	 *��idȡ��Ŀ��
	 * @param id
	 * @return
	 */
	public String selectClas(String id);
	
	//ȡ��Ŀ��Ӧ�����н�ɫ
	public abstract List getRolesForClaList();
	//ȡ��Ŀ��Ӧ����ѡ��ɫ
	public abstract List findRolesSeled(String id);
	//ȡ��Ŀ��Ӧδѡ��ɫ
	public abstract List findRolesUnSeled(String id);
	//Ϊ��Ŀ���ѡ��Ľ�ɫ
	public abstract boolean disRolesForCla(String claid,String[] roles);
	//�ж��Ƿ��в���Ȩ��
	public boolean isCanNotdo(String claid,String rightcode,String userId);
	/**
	 * ȡ��Ŀ��
	 * @param roleForCla
	 * @return
	 */
	public List getClaListTest(String[] roleForCla,String rootId);
	public String getClaForLayout(String belong,String code);
}
