package com.baosight.base.service;

import com.baosight.mode.TbWrit9;

public interface IWrit9Mgr {

//	�޸�
	public void update(TbWrit9 model);

	//ɾ��
	public void delete(TbWrit9 model);

	//���
	public void save(TbWrit9 model);
	
    //����ID��ѯ
	public TbWrit9 findById(String id);
}
