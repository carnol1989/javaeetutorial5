package com.baosight.base.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.baosight.mode.TbCommission;
import com.baosight.mode.TbUser;

public interface ICommissionMgr 
{
	//�޸�
	public void update(TbCommission model);

	//ɾ��
	public void delete(String id);

	//���
	public void save(TbCommission model);

	//ȫ��ѯ
	public List findAll();

	//����ID��ѯ
	public TbCommission findById(String id);
	
	/**
	 * ����type��ί�л�ί���б�
	 * @param user type
	 * @return
	 */
	public List findCommissionListByType(TbUser user, String comm_name, String beginTime,String endTime, Date now, String type);
	
	/**
	 * �����û�id������û�ͬ���ŵ���Ա��
	 * @param loginUserId
	 * @return
	 */
	public Map findUserTree(TbUser user);
}
