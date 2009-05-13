package com.baosight.infocenter.docsend.service;

import java.util.List;

import com.baosight.infocenter.docsend.mode.TbDocSendXxzx;
import com.baosight.infocenter.docsend.mode.TbDocsendControlXxzx;
import com.baosight.mode.TbUser;

/**
 * <p>Decription:IDocSendMgr</p>
 * @author heaton.cai
 * <p>Create Time:2008-8-13</p>
 */
public interface IDocSendMgr {

	public void save(TbDocSendXxzx instance);

	public void delete(TbDocSendXxzx instance);

	public TbDocSendXxzx findById(String id);

	public void saveControl(TbDocsendControlXxzx instance);

	public void deleteControl(TbDocsendControlXxzx instance);

	public TbDocsendControlXxzx findControlById(String controlId);

	/**
	 * <p>Decription:��е�����</p>
	 * @param docId ����Id
	 * @param stateType ��ѡ��״̬���
	 * @return ����state in ('1','2')������
	 * @author heaton.cai
	 * <p>Create Time:2008-8-14</p>
	 */
	public List findActiveControl(String docId,String stateType);

	public List findClosedControl(String docId);

	public TbUser getPrinter();
	
	//��������
	public final static String STATE_NAME_NEWBOOK = "�����";
	public final static String STATE_NAME_CHARGER = "�����˴���";
	public final static String STATE_NAME_LEADER = "�쵼����";
	public final static String STATE_NAME_PRINTER = "��ӡ�Ҵ���";
	public final static String STATE_NAME_END = "�������";
	
	//����״̬
	public final static String STATE_END = "0";
	public final static String STATE_NEW = "1";
	public final static String STATE_DISPOSE = "2";
	public final static String STATE_BOOKING = "3";

	//��������
	public final static String STATE_TYPE_DRAFTER = "0";//�����
	public final static String STATE_TYPE_CHARGER = "1";//������
	public final static String STATE_TYPE_LEADER = "2";//�쵼����
	public final static String STATE_TYPE_PRINTER = "3";//��ӡ��
}
