package com.baosight.base.service;

import java.util.List;


import com.baosight.mode.TbIndividualComm;
import com.baosight.mode.TbUser;

public interface IIndividualCommMgr {
	public List findAll(TbUser user);

	public TbIndividualComm findById(String id);

	public void updte(TbIndividualComm model);

	public void delete(String id);

	public void save(TbIndividualComm model);
	
	public List findSelectName(String SelectName,TbUser user);
	public List findStatus(TbUser user);
	public String checkIndividualCommName(String id, String value, String userid, String flag);
	/**
	 * ��ѯ���и���ͨѶ¼
	 * @param id
	 * @return
	 */
	public List findAllForTree();

	/**
	 * <p>Decription:���Ҹ���ͨѶ¼��</p>
	 * @param userId ��ǰ�û�
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-20</p>
	 */
	public List findForTree(String userId);
}
