package com.baosight.layout;

import java.sql.*;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;

public class DbManager {
	//���ԱConnection
	public Connection conn=null;
    //mysql�������࣬����Ϊ����
	public static final String CLASS_NAME = "oracle.jdbc.driver.OracleDriver";
    //���ݿ�����ӵ�ַ������Ϊ����
	//public static final String CONNET_STR = "jdbc:oracle:thin:@127.0.0.1:1521:ODB";
	public static final String CONNET_STR = "jdbc:oracle:thin:@31.16.1.134:1521:GGXXPT";
	//public static final String CONNET_STR = "jdbc:oracle:oci:@GGXXPT_31.16.1.134";
    //���Connetion
	public  Connection getConnection() {
		/*Connection con=null;
		DataSource ds=null;	*/	

		try {
			
			
//			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			/*Properties  pro=new  Properties();  
			pro.put(Context.INITIAL_CONTEXT_FACTORY  ,"weblogic.jndi.WLInitialContextFactory");    
		    pro.put(Context.PROVIDER_URL,"t3://31.16.3.161:7001");  */
			/*Context ctx=new InitialContext();
			
			javax.sql.DataSource ds=(javax.sql.DataSource)ctx.lookup("ORADBSOURCE");
			conn=ds.getConnection();*/
			//System.out.println("bbb"+conn.toString());
	        /*Context initCtx=new InitialContext();
	        ds=(DataSource)initCtx.lookup("jdbc/oracle");*/
			//Class.forName(CLASS_NAME);//ʹ���෴����ظ�������
			//���һ��Connection
			conn = DriverManager.getConnection(CONNET_STR, "ssoadmin", "ssoadmin");
			System.out.println("bbb"+conn.toString());
			return conn;//���ظ�Connection
			 
	        /*conn = ds.getConnection();
	        return conn;*/
	    } catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	//�����ѯ���ݿ��sql��䣬����ResultSet
	public  ResultSet getResultSet(String sql) {
		boolean bSuccess = true;
		Statement stmt = null;//����Statement stmt
		ResultSet rs = null;//����ResultSet rs
		if(conn==null){
			conn=getConnection();
		}
		//Connection con= getConnection();//����getConnetion()�������һ��Connetion
		if (conn == null)//���Connection Ϊnull�򷵻ؼ�
			bSuccess = false;
		if (bSuccess) {
			try {		
				stmt = conn.createStatement();//ͨ��Connection����һ��Statemet
				rs = stmt.executeQuery(sql);//ִ�в�ѯ��䣬
			} catch (SQLException e) {
				e.printStackTrace();
				bSuccess = false;
			}
		}
		if (bSuccess)//���ִ�гɹ����򷵻�rs
			return rs;
		else
			return null;
		
		
	}
   //����ִ�����ݸ��µ���䣬���ظ��½������Ϊ�ɹ�ִ��
	public  boolean excute(String sql) {
		boolean bSuccess = true;
		Statement stmt = null;//����Statement stmt
		if(conn==null){
			conn=getConnection();
		}
		//Connection con = getConnection();//����getConnetion()�������һ��Connetion
		if (conn == null)//���Connection Ϊnull�򷵻ؼ�
			bSuccess = false;
		if (bSuccess) {
			try {
				stmt = conn.createStatement();//ͨ��Connection����һ��Statemet
				bSuccess = stmt.execute(sql);//ִ�и������ݲ���
			} catch (SQLException e) {
				e.printStackTrace();
				bSuccess = false;
			}
		}
		return bSuccess;
	}
    //�ͷ�Connection
	public  void releaseConnection() {
		try {
			if(this.conn!=null){
				if (!this.conn.isClosed()){//  ���Connetion ��Ϊnull��ر�Connection
					System.out.println("aaa"+conn.toString());
					this.conn.close();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
