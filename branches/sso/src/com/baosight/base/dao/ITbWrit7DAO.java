package com.baosight.base.dao;

import com.baosight.mode.TbWrit7;

public interface ITbWrit7DAO {

//	���
	public abstract void save(TbWrit7 transientInstance);

	//�޸�
	public abstract void update(TbWrit7 transientInstance);

	//ɾ��
	public abstract void delete(TbWrit7 persistentInstance);

	//����ID��ѯ
	public abstract TbWrit7 findById(java.lang.String id);
}
