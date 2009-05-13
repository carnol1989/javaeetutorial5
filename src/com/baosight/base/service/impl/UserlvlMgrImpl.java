package com.baosight.base.service.impl;

import java.util.List;

import com.baosight.base.dao.ITbUserDAO;
import com.baosight.base.dao.ITbUserlvlDAO;
import com.baosight.base.service.IUserlvlMgr;
import com.baosight.mode.TbDept;
import com.baosight.mode.TbDeptlvl;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserinfo;
import com.baosight.mode.TbUserlvl;

public class UserlvlMgrImpl implements IUserlvlMgr {

	private ITbUserlvlDAO tbUserlvlDAO;

	private ITbUserDAO tbUserDAO;

	public void setTbUserlvlDAO(ITbUserlvlDAO tbUserlvlDAO) {
		this.tbUserlvlDAO = tbUserlvlDAO;
	}

	public void delete(String id) {
		this.tbUserlvlDAO.delete(find(id));
	}

	public TbUserlvl find(String id) {
		return tbUserlvlDAO.findById(id);
	}

	public List findAll() {
		return this.tbUserlvlDAO.findAll();
	}

	public void save(TbUserlvl item) {
		this.tbUserlvlDAO.save(item);
	}

	public void updte(TbUserlvl item) {
		this.tbUserlvlDAO.update(item);
	}

	public String checkUserlvl(String id, String value, String flag) {
		List list=tbUserlvlDAO.checkUserlvl(id, value, flag);
		String checkMessage="true";
		if(list.size() > 0)
		{
			checkMessage="false";
		}
		return checkMessage;
	}


	public void updteMore(TbUserlvl item, String oldname) {
		// TODO Auto-generated method stub

		// �����û�Ȩ�ޱ�
		this.tbUserlvlDAO.update(item);
		// �û�����(tb_userlvl)�޸�ʱ,������ԭname,��tb_user���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼��������Щ��¼��lvl�ֶ�ֵ����Ϊ��name

		String newname = item.getName();
		// ��ѯlvlΪ��name�Ķ���
		List list = this.tbUserDAO.findByProperty("lvl", oldname);
		for (int i = 0; i < list.size(); i++) {
			TbUser tbUser = (TbUser) list.get(i);
			tbUser.setLvl(newname);

			this.tbUserDAO.save(tbUser);
		}
	}

	public void deleteMore(String id, String oldname) {
		// TODO Auto-generated method stub

		// �����û�Ȩ�ޱ�
		TbUserlvl item = this.tbUserlvlDAO.findById(id);
		this.tbUserlvlDAO.delete(item);

		// �û�����(tb_userlvl)ɾ��ʱ��������ԭname,��tb_user���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼,������Щ��¼��lvl�ֶ�ֵ���
		List list = tbUserDAO.findByProperty("lvl", oldname);
		for (int i = 0; i < list.size(); i++) {
			TbUser tbUser = (TbUser) list.get(i);
			tbUser.setLvl(null);

			this.tbUserDAO.save(tbUser);
		}

	}

	public ITbUserDAO getTbUserDAO() {
		return tbUserDAO;
	}

	public void setTbUserDAO(ITbUserDAO tbUserDAO) {
		this.tbUserDAO = tbUserDAO;
	}

	public ITbUserlvlDAO getTbUserlvlDAO() {
		return tbUserlvlDAO;
	}

}
