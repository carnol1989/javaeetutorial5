package com.baosight.base.service;

import java.util.List;
import java.util.Map;

import com.baosight.mode.TbAuthlvl;

public interface IAuthlvlMgr {

	List findAll();

	TbAuthlvl find(String id);

	void updte(TbAuthlvl item);

	void delete(String id);

	void save(TbAuthlvl item);

	//Ȩ�޼�������ظ���֤
	public String checkAuthlvl(String id,String value,String flag);

}
