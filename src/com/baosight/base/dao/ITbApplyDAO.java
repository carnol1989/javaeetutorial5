package com.baosight.base.dao;

import java.util.List;

import com.baosight.mode.TbApply;

public interface ITbApplyDAO {

	//���
	public abstract void save(TbApply transientInstance);

	//�޸�
	public abstract void update(TbApply transientInstance);

	//ɾ��
	public abstract void delete(TbApply persistentInstance);

	//����ID��ѯ
	public abstract TbApply findById(java.lang.String id);

	//ȫ��ѯ
	public abstract List findAll();
	
	public abstract List findBySql(final String sql);

}