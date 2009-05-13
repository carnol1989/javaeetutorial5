package com.baosight.base.service;

import java.util.List;

import com.baosight.base.dao.ITbUserOpeationDAO;
import com.baosight.mode.TbUserOpeation;

public interface ITbUserOpeationMgr {

	
	public void save(TbUserOpeation transientInstance);
	
	public void update(TbUserOpeation transientInstance);

	public void delete(TbUserOpeation persistentInstance) ;

	public TbUserOpeation findById(java.lang.String id) ;

	public List findByProperty(String propertyName, Object value);

	public List findAll() ;

	/**
	 * ����userid�������Ƿ��м�¼���м�¼�� ��������[openum]++������������¼��
	 * @param Userid ��ԱID
	 * @param opeation ��������
	 * @param AddOrCut ture��++��false��--;
	 */
	public void byUseridSaveOrUpdate(String Userid,String opeation,boolean AddOrCut);
	public void archiveApplySaveOrUpdate(String addOrMinus);
	public int count(String userid,String operation);
	public void SaveOrUpdate(String userid,String operation,String addOrMinus);
}
