package com.baosight.base.service;

import com.baosight.mode.TbWrit7;

public interface IWrit7Mgr {

//	�޸�
	public void update(TbWrit7 model);

	//ɾ��
	public void delete(TbWrit7 model);

	//���
	public void save(TbWrit7 model);
	
    //����ID��ѯ
	public TbWrit7 findById(String id);
}
