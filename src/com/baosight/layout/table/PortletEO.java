package com.baosight.layout.table;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.baosight.layout.*;

public class PortletEO {
	protected int id;//�������ݿ���portlet_id��;
	protected String displayName;//�������ݿ���display_name��;
	protected String javaClassName;//�������ݿ���java_class_name��;
	protected String activeStatus="Y";//�������ݿ���active_status��;
	public PortletEO() {//�޲εĹ��췽�� 
		this.id = -1;
	}
	public PortletEO(int id) {//�вεĹ��췽��������Ϊportlet_id
		this.id = id;
		if (!FromDb())//������ҵ���id��porlet
			this.id = -1;
	}
	public static  DbManager dbManager;
//	public static DbManager getInstance(){
//		if(dbManager==null){
//			dbManager=new DbManager();
//		}
//		return dbManager;
//	}
	public boolean FromDb() {//�����ݿ��ж�����������bean
		dbManager=new DbManager();
		//System.out.println("PortletEO FromDb() dbManager.DbManager()");
		int row = -1;
		//����¼��sql���
		String sql = "select * from tb_ajax_portlet where portlet_id=" + this.id
				+ " and active_status='Y'";
		ResultSet rs = dbManager.getResultSet(sql);//ִ��sql��䲢����ResultSet
		try {
			if (rs.next()) {//���ֻ��ѯ��һ����¼�������ü�¼���ڲ����¸��������
				this.displayName = rs.getString("DISPLAY_NAME");
				this.javaClassName = rs.getString("JAVA_CLASS_NAME");
				this.activeStatus = rs.getString("ACTIVE_STATUS");
				return true;
			} else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			//System.out.println("PortletEO FromDb() dbManager.releaseConnection");
			dbManager.releaseConnection();
		}
	}
	public boolean ToDb() {//�������ݿ⣬����������bean
		dbManager=new DbManager();
		//System.out.println("PortletEO ToDb() dbManager.DbManager()");
		if (getId() == -1)//�����ʱidΪ-1
		{
			return false;
		} else {
			//���¸ü�¼��sql���
			String sql = "update tb_ajax_portlet set display_name=" + getDisplayName()
					+ ",java_class_name='" + getJavaClassName()
				    + "',active_status='"
					+ getActiveStatus() + "' where portlet_id=" + getId();
			dbManager.excute(sql);//ִ��sql���
			//System.out.println("PortletEO ToDb() dbManager.releaseConnection");
			dbManager.releaseConnection();
			return FromDb();//���¶���bean������
		}
	}
	public String getActiveStatus() {//
		return activeStatus;
	}
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJavaClassName() {
		return javaClassName;
	}
	public void setJavaClassName(String javaClassName) {
		this.javaClassName = javaClassName;
	}
	
}
