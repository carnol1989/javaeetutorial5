package com.baosight.base.dao;

import com.baosight.mode.TbWrit8;

public interface ITbWrit8DAO {

//	���
	public abstract void save(TbWrit8 transientInstance);

	//�޸�
	public abstract void update(TbWrit8 transientInstance);

	//ɾ��
	public abstract void delete(TbWrit8 persistentInstance);

	//����ID��ѯ
	public abstract TbWrit8 findById(java.lang.String id);
}
