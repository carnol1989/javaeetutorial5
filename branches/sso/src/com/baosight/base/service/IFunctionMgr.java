package com.baosight.base.service;

import java.util.List;
import java.util.Map;

import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.mode.DBSY;
import com.baosight.mode.TbFunction;
import com.baosight.mode.TbUser;

public interface IFunctionMgr {
	/**
	 * ����������Ϣ������ԴKEY
	 */
	public static final String DBSYAUDIT_XXGK="GovInfoPub";//��Ϣ����
	public static final String DBSY_VEHICLE="Vehicle Management";//����
	public static final String DBSY_ADMINISTRAT="dbsx";//�������
	public static final String DBSY_MYMAIL="EMAIL";//�ҵ��ʼ�
	public static final String DBSY_FILETRANSMISSION="File transfer";//�ļ�����
	public static final String DBSY_ARCHIVES="Document Management";//��������
	public static final String DBSY_MYMESSAGE="";//�ҵĶ���
	public static final String DBSY_COUNSULT="Internet Advisory";//������ѯ
	public static final String DBSY_COUNSULTZB="Internet Advisory Office";//������ѯר��
	public static final String DBSY_COUNSULTLEADAPPROVE="Online advice sought";//������ѯ���쵼����
	public static final String DBSY_APPEAL="Online complaints";//����Ͷ��
	public static final String DBSY_APPEALZB="Online complaints Office";//����Ͷ��ר��
	public static final String DBSY_APPEALLEADAPPROVE="Online complaints consultation";//����Ͷ�ߴ��쵼����
	public static final String DBSY_DIRECTORWAIT="director_mailBox";//�ֳ���Ϣ����
	public static final String DBSY_DIRECTORZB="director_mailBox_transfer";//�ֳ���Ϣת��
	public static final String DBSY_DIRECTORLEADAPPROVE="director_mailBox_consult";//�ֳ���Ϣ���쵼����
	public static final String DBSY_XZXK_CC="CC";//������ɳ���
	public static final String DBSY_XZXK_Urger="MyUrger";//������ɴ߰�
	public static final String DBSY_XZXK_Commission="commission";//ί�й���ί��
	
	public void save(TbFunction tbfunction);

	public void delete(TbFunction tbfunction);

	public void update(TbFunction tbfunction);

	public TbFunction findById(String id);

	public List findAll();

	public void save(DynaValidatorForm form);

	public void delete(String id);

	public void update(DynaValidatorForm form, String insure);

	public List findAllForTree(String fid);

	public void save(DynaValidatorForm form, String root);

	public List findAllRightType();

	public List findRightTypeByFunction(TbFunction tbfunction);
	
	public List findAllRole();
	
	public Map findFunByRid(String rid);
	
	public List findFunForRole();
	
	public void toAuth(String rid,String [] funList,String [] isDefList);
	
	public boolean isChecked(TbFunction tbFunction,String rid);
	
	public List findAllAppSys();
	
	public List findFunBySysId(String sysId);
	
	public List findRightTypeByRidAndFid(String fid,String rid);
	
	public List findAllForTreeInsure(String fid);
	
	public String checkName(String id,String name,String fid,String field);
	/*cheng begin*/
	/*���ݸ�IDȡ�¼���Դ˳λ��Ĭ��ֵ*/
	public int getDeforderByParId(String parid);
	/*��ͳһ�Ż���һ����Դ*/
	public List findFirstLevelRes(TbUser user);
	/*��ͳһ�Ż��ڶ�����Դ*/
	public List findSecondLevelRes(TbUser user,TbFunction tbFunction);
	/*���Ի����ã�ȡ�Ѿ����õ���Դ*/
	public List findAllSetByUser(TbUser user);
	/*���Ի����ã�ȡ���е���Դ*/
	public List findAllRes(TbUser user);
	/*������Դ����*/
	public List saveResSet(TbUser user,String[] resIds,String sysId);
	/*ȡ��ǰ��½�û���ӵ�еĶ���Ϣ��Ŀ�����Ľ�ɫ*/
	public List findInfoRolesUserList(TbUser user);
	/*cheng end*/
	
	/**
	 * ��ȡ��������Ȩ��
	 * @param userId
	 * @param funKey
	 * @return DBSY
	 * @author lqs 2008-09-26
	 */
	public DBSY getDBSYAuthInfo(String userId, String funKey);
	/**
	 * ��ǰ�û����Ի�������Ϣ
	 * @param user
	 * @return
	 */
	public String getPersonalInfo(TbUser user);
	
}
