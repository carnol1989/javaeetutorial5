package com.baosight.base.dao;

import com.baosight.mode.TbWrit2;

public interface ITbWrit2DAO {

//	���
	public abstract void save(TbWrit2 transientInstance);

	//�޸�
	public abstract void update(TbWrit2 transientInstance);

	//ɾ��
	public abstract void delete(TbWrit2 persistentInstance);

	//����ID��ѯ
	public abstract TbWrit2 findById(java.lang.String id);
}
