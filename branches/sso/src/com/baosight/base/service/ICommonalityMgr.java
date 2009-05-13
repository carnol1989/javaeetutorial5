package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbCommonality;;

public interface ICommonalityMgr {
	
	public List findAll();

	public TbCommonality findById(String id);

	public void updte(TbCommonality model);

	public void delete(String id);

	public void save(TbCommonality model);
	
	public List findByName(String parentid,String name,String phone,String duty,String remark);
	
	public String checkMphone(String name,String fax);
//	��ѯ�������µ�����ͨѶ¼
	public List findByNameAndPhone(String comParentId);
	
	/**
	 * ���ݹ���ͨѶ¼id��ѯ
	 * @param id
	 * @return
	 */
	public List findByCommId(String id);

	/**
	 * <p>Decription:������Id�������ڵ���</p>
	 * @param id
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-17</p>
	 */
	public List findByCommonalityId(String id);
	/**
	 * ������󲢷���id
	 * @param model
	 */
	public String saveObjRetrunId(TbCommonality model);
	/**
	 * ����һ�����Աidɾ���������еĸó�Ա
	 * @param userIdForZu
	 */
	public void deleteFromAllZu(String userIdForZu);
	/**
	 * ����һ�����Աid�Ҹó�Ա���ڵ�������
	 * @param userIdForZu
	 * @return
	 */
	public List findSelectedZuList(String userIdForZu);
	
	/**
	 * ��ѯͳ��ģ������ ͨ��Id��ȡ����
	 */
	public List findByIdReturnName(String id);
}
