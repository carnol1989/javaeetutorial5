package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbGovInfoPubContent;
import com.baosight.mode.TbInfoPubCla;
import com.baosight.mode.TbInfoPubContent;
import com.baosight.mode.TbUser;

public interface IInfoPubContentMgr {
	public List findAll();

	public  TbInfoPubContent findById(String id);

	public void updte(TbInfoPubContent model);

	public void delete(String id);

	public void save(TbInfoPubContent model);
	
	public void saveGovInfoPub(TbGovInfoPubContent model);
	
	public  TbGovInfoPubContent findGovInfoPubById(String id);
	
	public void deleteGovInfoPub(String id);
	
	public void updteGovInfoPub(TbGovInfoPubContent model);

	public List findByTitle(String title); 
	
	public abstract List findByInfoId(Object infoId);
	
	public abstract List findByInfoSubject(Object infoSubject,String code);
	
	public abstract long findCountByInfoSubject(Object infoSubject);

	public abstract List findByInfoSubjectList(Object infoSubject);
	/*����Ϣ��ģ����ѯ*/
	public abstract List findByPIdInfoName(TbUser user,String parentid,String claname,String type);
	/*����Ϣ��ģ����ѯ*/
	public abstract List findByPIdInfoNameGov(TbUser user,String parentid,String claname,String type);
	/**
	 * same name checked
	 * @param id
	 * @param value
	 * @param flag
	 * @return
	 */
	public String checkInfoCommName(String parentid,String id, String value,  String flag);
	/**
	 * same name checked
	 * @param id
	 * @param value
	 * @param flag
	 * @return
	 */
	public String checkInfoClaCommName(String parentid,String id, String value,  String flag);
	/**
	 * ��lsh_type������ˮ��������������ˮ��
	 * @param lsh_type
	 * @return
	 */
	public String findMaxLiuShHByPId(String lsh_type);
	/**
	 * ��ҳ�ۺ���Ϣ��ѯ
	 * @param infoSubject
	 * @return
	 */
	public abstract List findByInfoSubjectlist(Object infoSubject);
	/**
	 * �ж��û��Ƿ�Ϊĳ����ɫ�µ���Ա
	 */
	public boolean isForRoleUser(TbUser user,String roleId);
	/**
	 * ����������Ϣ�鿴�б�
	 * @param parentid
	 * @param infoname
	 * @return
	 */
	public List findSlzxInfoList(String parentid, String infoname);
	/**
	 * ���ҳ�����������Ϣ
	 * @return
	 */
	public List findAllGovInfo();
}
