package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbCommonalityComm;;

public interface ICommonalityCommMgr {

	public List findAll();

	public TbCommonalityComm findById(String id);

	public void updte(TbCommonalityComm model);

	public void delete(String id);

	public void save(TbCommonalityComm model);
	
	public List findByCommType(String parentId,String belong,String flag);
	
	public List findByComm(String parentId,String name);
	
	public List findByParentId(String commonalityId);
	
	public List findMenu(String belong);
	
	public String checkName(String id,String pid,String name);
	
	
	/**
	 * ����id���ҳ�����ͨѶ¼����ӽ��
	 * @param id
	 * @return
	 */
	public List findAllForTree(String id);
	/**
	 * ����id���ҳ�����ͨѶ¼����ӽ��
	 * @param id
	 * @return
	 */	
	public List findAllForSubscribeTree(String id);
	public List findByIdAndName();
	/**
	 * ����type���ҳ�����ͨѶ¼�����
	 * @param type
	 * @return
	 */
	public List findCommTreeList(String type);

	/**
	 * <p>Decription:��ѯ��һ���ڵ�</p>
	 * @param parentId ��ǰ�ڵ�
	 * @param type ������
	 * @return ��ǰ�ڵ��������һ���ӽڵ�
	 * @author heaton.cai
	 * <p>Create Time:2008-10-28</p>
	 */
	public List find4Tree(String parentId,String type);
}
