package com.baosight.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *  ���ݿ������
 * @author xiongfeng
 *
 */

public class DbManager1
{
	//����ʽ�ĵ���ģʽ
	private static DbManager1 instance = new DbManager1();
	private DbManager1()
	{
	}
	public static DbManager1 getInstance()
	{
		return instance;
	}
	
	//���ԱConnection
	protected static Connection conn;
	//Oracle����
	public static final String CLASS_NAME = "oracle.jdbc.driver.OracleDriver";
	//���ݿ����ӵ�ַ
	public static final String CONNET_STR = "jdbc:oracle:thin:@31.16.1.134:1521:GGXXPT";
	
	
	//�������
	public static Connection getConnection()
	{
		try
		{
			//ʹ���෴���������
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNET_STR, "ssoadmin", "ssoadmin");
			return conn;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 *  ����Sql���õ������
	 *  @params:Sql���
	 *  @return:ResultSet
	 */
	public static ResultSet getResultSet(String sql)
	{
		boolean bSuccess = true;
		//��伯
		Statement stmt = null;
		//�����
		ResultSet rs = null;
		//���һ������
		Connection con = getConnection();
		if(con == null)
		{
			bSuccess = false;
		}
		if(bSuccess)
		{
			try
			{
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
				bSuccess = false;
				System.out.println("---------���ݿ�����ʧ��---------");
			}
		}
		if(bSuccess)
		{
			return rs;
		}
		else
		{
			return null;
		}
	}
	
	
	/**
	 *  ����Sql��䣬��������
	 *  @params:sql���
	 *  @return:boolean
	 */
	public static boolean execute(String sql)
	{
		boolean bSuccess = true;
		Statement stmt = null;
		Connection con = getConnection();
		if(con == null)
		{
			bSuccess = false;
		}
		if(bSuccess)
		{
			try 
			{
				stmt = con.createStatement();
				bSuccess = stmt.execute(sql);
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				return false;
			}
		}
		return bSuccess;
	}
	
	//�ر�����
	public static void releaseConnection()
	{
		try 
		{
			if(conn != null)
			{
				conn.close();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
}
