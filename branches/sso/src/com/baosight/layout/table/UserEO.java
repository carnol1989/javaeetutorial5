package com.baosight.layout.table;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.baosight.layout.*;

public class UserEO {
	protected String id;//�������ݿ���id��
	protected String name;//�������ݿ���name��
	protected String password;//�������ݿ���pwd��
	protected String userAcc;//�������ݿ���user_acc��
	public UserEO() {//�޲εĹ��췽�� 
		this.id = "";
	}
	public UserEO(String id) {//�вεĹ��췽��������Ϊuser_id
		this.id = id;
		if (!FromDb())//���û���ҵ���id��user
			this.id = "";
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
		//System.out.println("UserEO FromDb() dbManager.DbManager()");
        //����¼��sql���
		String sql = "select * from tb_user where id='" +this.id+ "'";
		ResultSet rs = dbManager.getResultSet(sql);//ִ��sql��䲢����ResultSet
		try {
			if (rs.next()) {//���ֻ��ѯ��һ����¼�������ü�¼���ڲ����¸��������
				this.name = rs.getString("NAME");
				this.password = rs.getString("PWD");
				this.userAcc = rs.getString("USER_ACC");
				return true;
			} else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			//System.out.println("UserEO FromDb() dbManager.releaseConnection");
			dbManager.releaseConnection();
		}
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserAcc() {
		return userAcc;
	}
	public void setUserAcc(String userAcc) {
		this.userAcc = userAcc;
	}


}
