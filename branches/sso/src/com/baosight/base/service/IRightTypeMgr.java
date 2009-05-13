package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbRighttype;

public interface IRightTypeMgr {

	List findAll();
	
	//��������appsysID��funID��ѯ
	List findByExample(TbRighttype instance);

	TbRighttype find(String id);

	void delete(String id);

	void save(TbRighttype item);

	void updte(TbRighttype item);
	
	//Ȩ�����͹�������ظ���֤
	public String checkRighttypeCode(String id,String value,String funid);

}
