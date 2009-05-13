package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbApply;

public interface IApplyMgr 
{
	//�޸�
	public void update(TbApply model);

	//ɾ��
	public void delete(String id);

	//���
	public void save(TbApply model);

	//ȫ��ѯ
	public List findAll();

	//����ID��ѯ
	public TbApply findById(String id);
	public List findByView();
	public List findByViewAll();

}
