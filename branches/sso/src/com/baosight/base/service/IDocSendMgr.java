package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbDocSend;
import com.baosight.mode.TbDocsendControl;
import com.baosight.mode.TbUser;

/**
 * <p>Decription:IDocSendMgr</p>
 * @author heaton.cai
 * <p>Create Time:2008-8-13</p>
 */
public interface IDocSendMgr {

	public void save(TbDocSend instance);

	public void delete(TbDocSend instance);

	public TbDocSend findById(String id);

	public void saveControl(TbDocsendControl instance);

	public void deleteControl(TbDocsendControl instance);

	public TbDocsendControl findControlById(String controlId);

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

	/**
	 * <p>Decription:�칫�Ҹ�����</p>
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public TbUser getOfficeCharger();

	/**
	 * <p>Decription:��ӡ�Ҹ�����</p>
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public TbUser getPrinter();

	/**
	 * <p>Decription:�칫�������</p>
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-13</p>
	 */
	public TbUser getDrafter();

	/**
	 * <p>Decription:�칫����ǩ��</p>
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-13</p>
	 */
	public TbUser getSignsender();
	
	//��������
	public final static String STATE_NAME_NEWBOOK = "�����";
	public final static String STATE_NAME_DEPT_LEADERORRESPONSER = "�����쵼�����˴���";
	public final static String STATE_NAME_SIGN = "��ǩ";
	public final static String STATE_NAME_OFFICER = "�ְ칫�Ҹ����˴���";
	public final static String STATE_NAME_DRAFT = "�ְ칫�����";
	public final static String STATE_NAME_SIGN_SEND = "��ǩ";
	public final static String STATE_NAME_PRINTER = "��ӡ�Ҵ���";
	public final static String STATE_NAME_END = "�������";
	
	//����״̬
	public final static String STATE_END = "0";
	public final static String STATE_NEW = "1";
	public final static String STATE_DISPOSE = "2";
	public final static String STATE_BOOKING = "3";

	//��������
	public final static String STATE_TYPE_DRAFTER = "0";//�����
	public final static String STATE_TYPE_DEPT_LEADERORRESPONSER = "1";//�����쵼������
	public final static String STATE_TYPE_SIGN = "2";//��ǩ
	public final static String STATE_TYPE_OFFICER = "3";//�ְ칫�Ҹ����˴���
	public final static String STATE_TYPE_PRINTER = "4";//��ӡ��
	public final static String STATE_TYPE_DRAFT = "5";
	public final static String STATE_TYPE_SIGN_SEND = "6";
}
