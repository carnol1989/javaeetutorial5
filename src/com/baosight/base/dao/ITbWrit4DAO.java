package com.baosight.base.dao;

import com.baosight.mode.TbWrit4;

public interface ITbWrit4DAO {

//	���
	public abstract void save(TbWrit4 transientInstance);

	//�޸�
	public abstract void update(TbWrit4 transientInstance);

	//ɾ��
	public abstract void delete(TbWrit4 persistentInstance);

	//����ID��ѯ
	public abstract TbWrit4 findById(java.lang.String id);
}
