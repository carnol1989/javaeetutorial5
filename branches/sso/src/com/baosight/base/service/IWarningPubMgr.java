package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbWarningPub;

public interface IWarningPubMgr {
//	�޸�
	public void update(TbWarningPub mode);
//	ɾ��	
	public void delete(String id);
//	���	
	public void save(TbWarningPub mode);
//	ȫ��ѯ	
	public List findAll();
//	����ID��ѯ
	public TbWarningPub findById(String id);
	public List findForQuery(TbWarningPub item);
}
