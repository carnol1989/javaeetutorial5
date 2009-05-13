package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbGovInfoPubContent;

public interface IGovInfoPubContentMgr 
{
	//�޸�
	public void update(TbGovInfoPubContent model);

	//ɾ��
	public void delete(String id);

	//���
	public void save(TbGovInfoPubContent model);

	//ȫ��ѯ
	public List findAll();

	//����ID��ѯ
	public TbGovInfoPubContent findById(String id);

	public List findById(Long id);
	public List findByTitle(String title); 
	public List findAllInfo();

}
