package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbGovInfoPubAudit;

public interface ITbGovInfoPubAuditMgr 
{
	//����
	public void update(TbGovInfoPubAudit model);

	//ɾ��
	public void delete(String id);

	//����
	public void save(TbGovInfoPubAudit model);
	
	//ȫ��ѯ
	public List findAll();

	//����ID��ѯ
	public TbGovInfoPubAudit findById(String id);
	
	//
	public List findByProperty(String propertyName, Object value);

}
