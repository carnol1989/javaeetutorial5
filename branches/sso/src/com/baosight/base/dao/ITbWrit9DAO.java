package com.baosight.base.dao;

import com.baosight.mode.TbWrit9;

public interface ITbWrit9DAO {

//	���
	public abstract void save(TbWrit9 transientInstance);

	//�޸�
	public abstract void update(TbWrit9 transientInstance);

	//ɾ��
	public abstract void delete(TbWrit9 persistentInstance);

	//����ID��ѯ
	public abstract TbWrit9 findById(java.lang.String id);
}
