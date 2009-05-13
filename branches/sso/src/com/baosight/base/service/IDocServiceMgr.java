package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbDocRec;
import com.baosight.mode.TbDocSend;
import com.baosight.mode.TbUser;

/**
 * <p>Decription:���Ĺ�����ط���</p>
 * @author heaton.cai
 * <p>Create Time:2008-7-31</p>
 */
public interface IDocServiceMgr {

	public static final String UPLOAD_PATH_DOC = "DocReceive";
	public static final String UPLOAD_PATH_DOCSEND = "DocSend";
	public static final String UPLOAD_PATH_FAX = "fax";
	public static final String UPLOAD_TYPE_DOC = "1";//����
	public static final String UPLOAD_TYPE_DOCSEND = "2";//����
	public static final String UPLOAD_TYPE_DOCCONTEXT = "3";//��������
	public static final String UPLOAD_TYPE_FAX_CONTENT = "4";//��������
	public static final String UPLOAD_TYPE_FAX_ATTACH = "5";//���渽��

	//�շ������õĽ�ɫId
	public static final String ROLE_ID_LEADER = "8a9981f11b776225011b7779beeb0005";//�����쵼
	
	/**
	 * <p>Decription:�жϸ��û��Ƿ�������˻��ߵǼ���</p>
	 * @param userId �û�Id
	 * @return �Ƿ���true�����򷵻�false
	 * @author heaton.cai
	 * <p>Create Time:2008-7-31</p>
	 */
	public boolean isDisposerOrBooker(String userId);
	
	/**
	 * <p>Decription:�жϸ��û��Ƿ�������˻��ߵǼ���</p>
	 * @param userId �û�Id
	 * @param type 1:�Ǽ��� 2����� 3�Ǽ��˻������
	 * @return �Ƿ���true�����򷵻�false
	 * @author heaton.cai
	 * <p>Create Time:2008-7-31</p>
	 */
	public boolean isDisposerOrBooker(String userId,int type);

	/**
	 * <p>Decription:���û��Ƿ��й鵵Ȩ��</p>
	 * @param userid �û�Id
	 * @return �з���true������false
	 * @author heaton.cai
	 * <p>Create Time:2008-7-31</p>
	 */
	public boolean canArchive(String userid);

	/**
	 * <p>Decription:��ȡ������б�</p>
	 * @return List-TbUser �����
	 * @author heaton.cai
	 * <p>Create Time:2008-7-31</p>
	 */
	public List getDisposerList();

	/**
	 * <p>Decription:��ȡĳ���ŵĸ�����</p>
	 * @param deptId TODO
	 * @return TbUser ���ŵĸ����ˣ��Ҳ�������nulll
	 * @author heaton.cai
	 * <p>Create Time:2008-7-31</p>
	 */
	public TbUser getDeptDisposer(String deptId);

	/**
	 * <p>Decription:findUserByRoleList</p>
	 * @param roleId
	 * @param user �����null�򲻻��жϲ���
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public List findUserByRoleList(String roleId,TbUser user);

	/**
	 * <p>Decription:ȡ���й鵵���</p>
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-26</p>
	 */
	public List findAllArchiveType();

	/**
	 * <p>Decription:�����������ݵ�����</p>
	 * @param recId ���ĵ�id
	 * @param user ��ǰ�û�
	 * @return ��������ݵ�controlId
	 * @author heaton.cai
	 * <p>Create Time:2008-11-3</p>
	 */
	public String copyRec2Send(String recId,TbUser user);

	/**
	 * <p>Decription:�鵵</p>
	 * @param item
	 * @author heaton.cai
	 * <p>Create Time:2008-11-3</p>
	 */
	public void save2Archives(TbDocRec item,TbUser user);

	/**
	 * <p>Decription:���͵���Ϣ��������</p>
	 * @param send ������Ϣ
	 * @author heaton.cai
	 * <p>Create Time:2008-11-24</p>
	 */
	public void sendToInfoRec(TbDocSend send);

	public static final String DEPT_TYPE_JUOA="b205f4e34f4f4d2da5bd89e2e10af37a";//��OA
	public static final String DEPT_TYPE_INFO="ae5532af92f8488994fb632c62423759";//��Ϣ����
	public static final String DEPT_TYPE_SLZX="f410b42455464f8487ee4f86da49b571";//��������
}
