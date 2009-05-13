package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbDocSend;
import com.baosight.mode.TbUser;


public interface IDocSendDealMgr {

	public static final String DEPTLEADER="8a9981af1bbf23a3011bbf47c1c70003";
	public static final String LEADER="8a9981af1bbf23a3011bbf4a4b700004";
	public static final String PRINTROOM="8a9981a81bd89eca011bd90191eb0017";
	public static final String DRAFT="9f90831b1cf3d17e011cf43c22a40003";
	public static final String SIGNSEND="9f90831b1cf3d17e011cf43ddac40004";
	
	public abstract List findDocSendList(TbUser user,String type);
	/*����ݵ�����ɾ��*/
	public abstract void deleteSendDoc(String docId);
	/*�鿴*/
	public abstract TbDocSend findSendDocById(String docId);
	/* �߰�֪ͨ --�ұ��߰������� */
	public abstract List findPersonByDocId(String docId);
	/*�жϸ÷����Ƿ����ȡ��*/
	public abstract boolean isCanRollBack(String docId,String closetime);
	/*ȡ�ظ÷���*/
	public abstract void docSendRollBack(String docId,TbUser user);
	/*ѡ���û��б�*/
	public List findUserByRoleList(String roleId,TbUser user);
	/*���Ļ��ء����͡�����*/
	public abstract List findDeptList(String type);
	/*�����*/
	public abstract List findTypeList(long style);
	public abstract List findGongWenTypeList(long style);
	
}
