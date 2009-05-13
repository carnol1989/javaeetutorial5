package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbDocRec;
import com.baosight.mode.TbDocUrgent;
import com.baosight.mode.TbUser;


public interface IDocRecListMgr {

	/* ���յ������� */
	public abstract List findNewReceiveList(TbUser user);
	/*���ڰ��������*/
	public abstract List findDisposingList(TbUser user);
	/*�ɼ�ص�����*/
	public abstract List findCanMonitorList(TbUser user);
	/*�Ѱ��������*/
	public abstract List findDisposedList(TbUser user);
	/*����ݵ�����*/
	public abstract List findBookingList(TbUser user);
	/*����ݵ�����ɾ��*/
	public abstract void deleteRecDoc(String docId);
	/*�Ϻ���ˮ����Ϣ���Ĺ��Ĵ������鿴��*/
	public abstract TbDocRec findReceiveDocById(String docId);
	/* �����ת�� */
	public abstract List findSCLZDById(String docId);
	/* �߰�֪ͨ --�ұ��߰������� */
	public abstract List findPersonByDocId(String docId);
	/* �߰�֪ͨ --���� */
	public void saveDocUrgentObj(TbDocUrgent docUrgent);
}
