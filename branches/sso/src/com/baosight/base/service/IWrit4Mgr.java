package com.baosight.base.service;

import com.baosight.mode.TbWrit4;

public interface IWrit4Mgr {

//	�޸�
	public void update(TbWrit4 model);

	//ɾ��
	public void delete(TbWrit4 model);

	//���
	public void save(TbWrit4 model);
	
    //����ID��ѯ
	public TbWrit4 findById(String id);
}
