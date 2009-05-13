package com.baosight.base.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.criterion.Projection;

import com.baosight.mode.TbFunction;
import com.baosight.mode.TbUser;

public interface ITbFunctionDAO {

	public abstract void save(TbFunction transientInstance);

	public abstract void delete(TbFunction persistentInstance);

	public abstract TbFunction findById(java.lang.String id);

	public abstract List findByExample(TbFunction instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByName(Object name);

	public abstract List findByFunKey(Object funKey);

	public abstract List findBySysId(Object sysId);

	public abstract List findByParId(Object parId);

	public abstract List findByInuse(Object inuse);

	public abstract List findByDeforder(Object deforder);

	public abstract List findByNodetype(Object nodetype);
	
	public abstract List findByRighttypeid(Object righttypeid);

	public abstract List findByUrl(Object url);

	public abstract List findByDefor(Object defor);

	public abstract List findAll();

	public abstract TbFunction merge(TbFunction detachedInstance);

	public abstract void attachDirty(TbFunction instance);

	public abstract void attachClean(TbFunction instance);

	public List findByHQL(String hql, boolean cacheable, int startIndex,
			int maxResultCount);

	public List find(HashMap hmcriteria, List condition,
			Projection[] projection, String order, String ranking, int start,
			int maxRs, boolean isShowAll, Class object);

	public List findByNativeSql(String sql);
	
	public List checkName(Object id,Object value,Object fid,String field);
	
	/*cheng begin*/
	/*���������õ�˳λ���ı���������Դ˳λ*/
	public void setOthersDefordByNewdeford(TbFunction tbFunction,String newDeforder,String parid,String type);
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
	/*cheng end*/
}