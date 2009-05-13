package com.baosight.sms.service;

import java.util.List;

import com.baosight.sms.mode.SmsTransferInfo;
import com.baosight.sms.mode.SmsTransferList;

/**
 * <p>Decription:����ת��</p>
 * @author heaton.cai
 * <p>Create Time:2008-10-8</p>
 */
public interface TransferMgr {

	public abstract void saveInfo(SmsTransferInfo instance);

	public abstract void deleteInfo(SmsTransferInfo persistentInstance);

	public abstract SmsTransferInfo findInfoById(String id);

	public abstract List findByExample(SmsTransferInfo instance);

	public abstract List findInfoAll();

	public abstract void saveList(SmsTransferList instance);

	public abstract void deleteList(SmsTransferList persistentInstance);

	public abstract SmsTransferList findListById(String id);

	public abstract List findListByExample(SmsTransferList instance);

	public abstract void deleteListByInfo(String infoId);

	/**
	 * <p>Decription:����ͨѶ¼������</p>
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-13</p>
	 */
	public abstract List findAddBookList();

	/**
	 * <p>Decription:����ͨѶ¼��������</p>
	 * @param type ȡ�Ĳ�ͬ��ֵ��move_phone:�ֻ���fax:����
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-13</p>
	 */
	public abstract List findBookPersonList(String type);

	/**
	 * <p>Decription:��ѯת���б�</p>
	 * @param instance
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-10-10</p>
	 */
	public abstract List findListByQuery(SmsTransferList instance);

}