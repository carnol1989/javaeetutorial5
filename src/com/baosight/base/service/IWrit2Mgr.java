package com.baosight.base.service;

import com.baosight.mode.TbWrit2;

public interface IWrit2Mgr {

//	�޸�
	public void update(TbWrit2 model);

	//ɾ��
	public void delete(TbWrit2 model);

	//���
	public void save(TbWrit2 model);
	
    //����ID��ѯ
	public TbWrit2 findById(String id);
}
