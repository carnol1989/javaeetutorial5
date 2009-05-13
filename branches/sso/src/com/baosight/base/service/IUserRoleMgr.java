package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserRole;

public interface IUserRoleMgr {

	void save(TbUserRole item);

	List findAll();

	List findByRoleId(String roleId, boolean inCache);

	void deleteByRoleId(String roleId);
	/**
	 * ȡ�û������Ľ�ɫ�б�
	 * @param user
	 * @return
	 */
	public List getUserRoleList(TbUser user);

}