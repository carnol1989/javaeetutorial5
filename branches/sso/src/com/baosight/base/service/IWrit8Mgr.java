package com.baosight.base.service;

import com.baosight.mode.TbWrit8;

public interface IWrit8Mgr {

//	�޸�
	public void update(TbWrit8 model);

	//ɾ��
	public void delete(TbWrit8 model);

	//���
	public void save(TbWrit8 model);
	
    //����ID��ѯ
	public TbWrit8 findById(String id);
}
