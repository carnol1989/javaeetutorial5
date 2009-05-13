package com.baosight.base.service.impl;

import java.util.List;

import com.baosight.base.dao.ITbDeptDAO;
import com.baosight.base.dao.ITbDeptlvlDAO;
import com.baosight.base.service.IDeptlvlMgr;
import com.baosight.mode.TbDept;
import com.baosight.mode.TbDeptlvl;
import com.baosight.mode.TbPst;
import com.baosight.mode.TbPstlvl;

public class DeptlvlMgrImpl implements IDeptlvlMgr {

	private ITbDeptlvlDAO tbDeptlvlDAO;

	private ITbDeptDAO tbDeptDAO;

	public void setTbDeptlvlDAO(ITbDeptlvlDAO tbDeptlvlDAO) {
		this.tbDeptlvlDAO = tbDeptlvlDAO;
	}

	public void delete(String id) {
		this.tbDeptlvlDAO.delete(find(id));
	}

	public TbDeptlvl find(String id) {
		return tbDeptlvlDAO.findById(id);
	}

	public List findAll() {
		return this.tbDeptlvlDAO.findAll();
	}

	public void save(TbDeptlvl item) {
		this.tbDeptlvlDAO.save(item);
	}

	public void updte(TbDeptlvl item) {
		this.tbDeptlvlDAO.update(item);
	}

	public void updteMore(TbDeptlvl item, String oldname) {
		// TODO Auto-generated method stub
		// ���²��ű�
		this.tbDeptlvlDAO.update(item);
		// ���ż���(tb_deptlvl)�޸�ʱ,������ԭname,��tb_dept���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼��������Щ��¼��lvl�ֶ�ֵ����Ϊ��name

		String newname = item.getName();
		// ��ѯlvlΪ��name�Ķ���
		List list = tbDeptDAO.findByProperty("lvl", oldname);
		for (int i = 0; i < list.size(); i++) {
			TbDept tbDept = (TbDept) list.get(i);
			tbDept.setLvl(newname);

			this.tbDeptDAO.save(tbDept);
		}
	}

	public ITbDeptDAO getTbDeptDAO() {
		return tbDeptDAO;
	}

	public void setTbDeptDAO(ITbDeptDAO tbDeptDAO) {
		this.tbDeptDAO = tbDeptDAO;
	}

	public ITbDeptlvlDAO getTbDeptlvlDAO() {
		return tbDeptlvlDAO;
	}

	public void deleteMore(String id, String oldname) {
		// TODO Auto-generated method stub

		// ���²��ű�
		TbDeptlvl item = this.tbDeptlvlDAO.findById(id);
		this.tbDeptlvlDAO.delete(item);

		// ���ż���(tb_deptlvl)�޸�ʱ,������ԭname,��tb_dept���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼��������Щ��¼��lvl�ֶ�ֵ����Ϊ��name
		List list = tbDeptDAO.findByProperty("lvl", oldname);
		for (int i = 0; i < list.size(); i++) {
			TbDept tbDept = (TbDept) list.get(i);
			tbDept.setLvl(null);

			this.tbDeptDAO.save(tbDept);
		}
	}

	public String checkDeptlvl(String id, String value, String flag) {
		List list=tbDeptlvlDAO.checkDeptlvl(id,value,flag);		
		String checkMessage="true";
		if(list.size() > 0)
		{
			checkMessage="false";
		}
		return checkMessage;
	}

}
