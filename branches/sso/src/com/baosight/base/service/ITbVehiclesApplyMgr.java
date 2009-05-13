package com.baosight.base.service;

import java.util.List;

import com.baosight.mode.TbVehiclesApply;;

public interface ITbVehiclesApplyMgr 
{
	//����
	public void update(TbVehiclesApply model);

	//ɾ��
	public void delete(String id);

	//����
	public void save(TbVehiclesApply model);

	//ȫ��ѯ
	public List findAll();
	
	public List findByProperty(String propertyName, Object value);
	//����ID��ѯ
	public TbVehiclesApply findById(String id);
	
	public List findByLicense(String License);
}
