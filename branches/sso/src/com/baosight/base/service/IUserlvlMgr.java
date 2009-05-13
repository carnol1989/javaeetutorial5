package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbRighttype;
import com.baosight.mode.TbUserlvl;

public interface IUserlvlMgr {

	List findAll();

	TbUserlvl find(String id);

	void updte(TbUserlvl item);

	void delete(String id);

	void save(TbUserlvl item);
	
	//�û���������ظ���֤
	public String checkUserlvl(String id,String value,String flag);


	void updteMore(TbUserlvl item,String oldname);

	void deleteMore(String id, String oldname);

}
