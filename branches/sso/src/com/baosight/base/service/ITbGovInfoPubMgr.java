package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbGovInfoPub;

public interface ITbGovInfoPubMgr 
{
	//����
	public void update(TbGovInfoPub model);

	//ɾ��
	public void delete(String id);

	//����
	public void save(TbGovInfoPub model);
	
	//ȫ��ѯ
	public List findAll();

	//����ID��ѯ
	public TbGovInfoPub findById(String id);
	
	//
	public List findByProperty(String propertyName, Object value);

}
