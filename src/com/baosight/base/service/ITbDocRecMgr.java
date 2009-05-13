package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbDocControl;
import com.baosight.mode.TbDocRec;

public interface ITbDocRecMgr {

	//��ǰ����״̬
	public final static String STATE_CLOSED= "0";//�Ѵ���
	public final static String STATE_NEW = "1";//δ����
	public final static String STATE_DISPOSING = "2";//������
	public final static String STATE_NEWBOOK = "3";//�����
	public final static String STATE_CAN_MONITOR = "4";//�ɼ��
	public final static String STATE_WAIT_DISPOSE = "5";//�ȴ�����

	public final static String STATE_NAME_NEW = "���յ�";
	public final static String STATE_NAME_NEWBOOK = "�����";
	public final static String STATE_NAME_BOOKED = "���ĵǼ�";
	public final static String STATE_NAME_DISPOSE = "���";
	public final static String STATE_NAME_MAIN_DEPT = "���첿�Ű���";
	public final static String STATE_NAME_MAIN_PERSON = "������Ա����";
	public final static String STATE_NAME_SECEND_DEPT = "Э�첿�Ŵ���";
	public final static String STATE_NAME_LEADER = "�쵼����";
	public final static String STATE_NAME_ARCHIVE = "�ѹ鵵";
	public final static String STATE_NAME_PERSON = "�����Ա����";
	public final static String STATE_NAME_END = "�������";
	public final static String STATE_NAME_READ = "������";

	//��������
	public final static String STATE_TYPE_OTHER = "0";//�����������
	public final static String STATE_TYPE_LEADER = "1";//�쵼����
	public final static String STATE_TYPE_MAIN_DEPT = "2";//���첿�Ŵ���
	public final static String STATE_TYPE_SECEND_DEPT = "3";//Э�첿�Ŵ���(��д�������)
	public final static String STATE_TYPE_PERSON = "4";//�����Ա����
	public final static String STATE_TYPE_READ = "5";//����
	public final static String STATE_TYPE_NEW = "6";//���յ����������

	public void save(TbDocRec transientInstance);

	public void delete(TbDocRec persistentInstance);

	public TbDocRec findById(java.lang.String id);

	public List findByExample(TbDocRec instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public TbDocRec merge(TbDocRec detachedInstance);

	public void saveControl(TbDocControl instance);

	public TbDocControl findControlById(String controlId);

	public TbDocControl findCuruserControl(String userId,String docId);

	/**
	 * <p>Decription:������Ϣ�ȼ��б�</p>
	 * @return List-TbDocInfoLevelSeq
	 * @author heaton.cai
	 * <p>Create Time:2008-8-1</p>
	 */
	public List findAllInfoLevel();

	/**
	 * <p>Decription:��ȡ��ǰ�õȼ������кţ�������ǰ���к�+1</p>
	 * @param level ��ǰ�ȼ�
	 * @return ��ǰ�ȼ����к�
	 * @author heaton.cai
	 * <p>Create Time:2008-8-1</p>
	 */
	public String getCurInfoLevel(String level);

	/**
	 * <p>Decription:�ҵ����е������б�</p>
	 * @param docId
	 * @return List-TbDocControl
	 * @author heaton.cai
	 * <p>Create Time:2008-8-5</p>
	 */
	public List findNextControl(String docId);

	public void deleteControl(TbDocControl instance);

	public List findNotClosedControl(String docId);

	public List findNotClosedControl(String docId,String stateType);
	
	public List findDisposeNext(String docId);

	public List findControl(String docId,String type);

	/**
	 * <p>Decription:findBookControl</p>
	 * @param docId
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public TbDocControl findBookControl(String docId);
}
