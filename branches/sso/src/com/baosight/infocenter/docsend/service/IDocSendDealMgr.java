package com.baosight.infocenter.docsend.service;

import java.util.List;

import com.baosight.infocenter.docsend.mode.TbDocSendXxzx;
import com.baosight.mode.TbUser;


public interface IDocSendDealMgr {

	public static final String DEPTLEADER="9f90831d1c98aa42011c98bcfebb0004";
	public static final String LEADER="9f90831d1c98aa42011c98bec84f0005";
	public static final String PRINTROOM="9f90831d1c98aa42011c98bac39f0003";
	
	public abstract List findDocSendList(TbUser user,String type);
	/*����ݵ�����ɾ��*/
	public abstract void deleteSendDoc(String docId);
	/*�鿴*/
	public abstract TbDocSendXxzx findSendDocById(String docId);
	/* �߰�֪ͨ --�ұ��߰������� */
	public abstract List findPersonByDocId(String docId);
	/*�жϸ÷����Ƿ����ȡ��*/
	public abstract boolean isCanRollBack(String docId,String closetime);
	/*ȡ�ظ÷���*/
	public abstract void docSendRollBack(String docId,TbUser user);
	/*ѡ���û��б�*/
	public abstract List findUserByRoleList(String roleId,TbUser user);
	/*���Ļ��ء����͡�����*/
	public abstract List findDeptList(String type);
	/*�����*/
	public abstract List findTypeList(long style);
	public abstract List findGongWenTypeList(long style);
}
