package com.baosight.base.service;

import java.util.Collection;
import java.util.List;

import com.baosight.mode.TbDept;

public interface IDeptMgr {

	TbDept getSystemRoot();

	Collection getChildren(String parentId);

	void save(TbDept item);
	
	public List findAllDept();
	
	public String selectDepts(String ids);
	
	public String checkName(String id,String name,String par,String field);

	boolean delete(String nodeId);
	//start
	/**
	 * ���ݣɣĲ鲿��
	 */
	public TbDept find(String id);
	/**
	 * �༭����
	 */
	public void updateDept(TbDept item);
	/**
	 * �ڵ��ƶ�
	 * @param parentId
	 * @param nodeId
	 * @param type
	 */
	public void upDownMoveS(String parentId,String nodeId,String nodeType,String nextNType,String defOrder,String type);
	/**
	 * ȡdeforder�����ֵ
	 * @param parentId
	 * @return
	 */
	public long getMaxDefOrder(String parentId);
	//end
	public List getTwoDept(String deptId);
	/**
	 * <p>Decription:���Ҳ�����</p>
	 * @param rootId ���ڵ��ID
	 * @return ���ڵ����µ������ӽڵ�
	 * @author heaton.cai
	 * <p>Create Time:2008-10-28</p>
	 */
	public List find4Tree(String rootId);
}