package com.baosight.layout.table;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.baosight.layout.DbManager;
import com.baosight.layout.Util;

public class LayoutEO {	

	protected int id;//�������ݿ���layout_id��
	protected String userId;//�������ݿ���user_id��
	protected String colNarrowLeft;//�������ݿ���col_narrow_left��
	protected String colNarrowRight;//�������ݿ���col_narrow_right��
	protected String colWide;//�������ݿ���col_wide��
	protected String activeStatus = "Y";//�������ݿ���active_status��
	protected String []idList;
	public LayoutEO() {//�޲εĹ��췽�� 
		
		this.id = -1;
	}
	public LayoutEO(int id) {//�вεĹ��췽��������Ϊportlet_id
		this.id = id;
		if (!FromDb())//������ҵ���id��layout
			this.id = -1;
	}
	public static  DbManager dbManager;

//	public DbManager getInstance(){
//		if(dbManager==null){
//			dbManager=new DbManager();
//		}
//		return dbManager;
//	}
	public boolean FromDb() {//�����ݿ��ж�����������bean
		dbManager=new DbManager();
		int row = -1;
        //����¼��sql���
		String sql = "select * from tb_ajax_layout where layout_id=" + this.id
				+ " and active_status='Y'";
		ResultSet rs = dbManager.getResultSet(sql);//ִ��sql��䲢����ResultSet
		try {
			if (rs.next()) {//���ֻ��ѯ��һ����¼�������ü�¼���ڲ����¸��������
				this.userId = rs.getString("USER_ID");
				this.colNarrowLeft = rs.getString("COL_NARROW_LEFT");
				this.colNarrowRight = rs.getString("COL_NARROW_RIGHT");
				this.colWide = rs.getString("COL_WIDE");
				this.activeStatus = rs.getString("ACTIVE_STATUS");
				return true;
			} else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally{
			dbManager.releaseConnection();
		}
	}
	public boolean ToDb() {//�������ݿ⣬����������bean
		dbManager=new DbManager();
		if (getId() == -1)//�����ʱidΪ-1
		{
			return false;
		} else {
            //���¸ü�¼��sql���
			String left = getColNarrowLeft();
			String right = getColNarrowRight();
			String wide = getColWide();
			if(left==null){
				left = "";
			}
			if(right==null){
				right = "";
			}
			if(wide==null){
				wide = "";
			}			
			String sql = "update tb_ajax_layout set user_id='" + getUserId()
					+ "',col_narrow_left='" + left
					+ "',col_narrow_right='" + right
					+ "',col_wide='" + wide + "',active_status='"
					+ getActiveStatus() + "' where layout_id=" + getId();
			System.out.println(sql);
			dbManager.excute(sql);//ִ��sql���
			dbManager.releaseConnection();
			return FromDb();//���¶���bean������
		}
	}
	public boolean ToAddDb(String s1) {//�������ݿ⣬����������bean
		dbManager=new DbManager();
		if (getId() == -1)//�����ʱidΪ-1
		{
			String id [] = this.idList;
			String idL = "";
			for(int i=0;i<id.length;i++){
				idL = idL + id[i] + ",";
			}
			if(idL.length()!=0){
				idL = idL.substring(0, idL.length()-1);
			}
			System.out.println(idL);
			String sql = "insert into tb_ajax_layout values(layoutseq.nextval,'"+s1+"','','"+idL+"','','Y')";
			dbManager.excute(sql);//ִ��sql���
			dbManager.releaseConnection();
			return FromDb();
		} else {
			String COL_NARROW_RIGHT = "";
			String COL_NARROW_LEFT = "";
			String COL_WIDE = "";
			String newCOL_NARROW_RIGHT = "";
			String newCOL_NARROW_LEFT = "";
			String newCOL_WIDE = "";
			String selectSql = "select * from tb_ajax_layout where layout_id='" + getId()+"'";
			ResultSet rs = dbManager.getResultSet(selectSql);
			try {
				if(rs.next()){
					COL_NARROW_RIGHT = rs.getString("COL_NARROW_RIGHT");
					COL_NARROW_LEFT = rs.getString("COL_NARROW_LEFT");
					COL_WIDE = rs.getString("COL_WIDE");
				}
				if(COL_NARROW_RIGHT==null){
					COL_NARROW_RIGHT = "";
				}
				if(COL_NARROW_LEFT==null){
					COL_NARROW_LEFT = "";
				}
				if(COL_WIDE==null){
					COL_WIDE = "";
				}				
				String [] rightList = COL_NARROW_RIGHT.split(",");
				String [] leftList = COL_NARROW_LEFT.split(",");
				String [] wideList = COL_WIDE.split(",");
				Map map = new HashMap();
				List inList = new ArrayList();
				List outList = new ArrayList();
				for(int i=0;i<this.idList.length;i++){
					map.put(idList[i], idList[i]);
				}
				for(int i=0;i<rightList.length;i++){
					if(map.containsKey(rightList[i])){
						newCOL_NARROW_RIGHT = newCOL_NARROW_RIGHT + rightList[i] +",";
						inList.add(rightList[i]);
					}
				}
				for(int i=0;i<leftList.length;i++){
					if(map.containsKey(leftList[i])){
						newCOL_NARROW_LEFT = newCOL_NARROW_LEFT + leftList[i] +",";
						inList.add(leftList[i]);
					}
				}
				if(!newCOL_NARROW_LEFT.equals("")){
					newCOL_NARROW_LEFT = newCOL_NARROW_LEFT.substring(0, newCOL_NARROW_LEFT.length()-1);
				}
				for(int i=0;i<wideList.length;i++){
					if(map.containsKey(wideList[i])){
						newCOL_WIDE = newCOL_WIDE + wideList[i] +",";
						inList.add(wideList[i]);
					}
				}
				if(!newCOL_WIDE.equals("")){
					newCOL_WIDE = newCOL_WIDE.substring(0, newCOL_WIDE.length()-1);
				}				

				for(Iterator it = map.keySet().iterator();it.hasNext();){
					boolean isE = false;
					String key = (String)it.next();
					for(Iterator itIn = inList.iterator();itIn.hasNext();){
						String k = (String)itIn.next();
						if(k.equals(key)){
							isE = true;
							break;
						}
					}
					if(!isE){
						newCOL_NARROW_RIGHT = newCOL_NARROW_RIGHT + key + ",";
					}
				}
				if(!newCOL_NARROW_RIGHT.equals("")){
					newCOL_NARROW_RIGHT = newCOL_NARROW_RIGHT.substring(0, newCOL_NARROW_RIGHT.length()-1);
				}				
	            //���¸ü�¼��sql���
	            //���¸ü�¼��sql���
				if(newCOL_NARROW_LEFT==null){
					newCOL_NARROW_LEFT = "";
				}
				if(newCOL_NARROW_RIGHT==null){
					newCOL_NARROW_RIGHT = "";
				}
				if(newCOL_WIDE==null){
					newCOL_WIDE = "";
				}	
				String sql = "update tb_ajax_layout set user_id='" + getUserId()
						+ "',col_narrow_left='" + newCOL_NARROW_LEFT
						+ "',col_narrow_right='" + newCOL_NARROW_RIGHT
						+ "',col_wide='" + newCOL_WIDE + "',active_status='"
						+ getActiveStatus() + "' where layout_id=" + getId();
				System.out.println(sql);
				dbManager.excute(sql);//ִ��sql���
				return FromDb();//���¶���bean������				
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}finally{
				dbManager.releaseConnection();
			}
		}
	}	
	public String getActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	public String getColNarrowLeft() {
		return colNarrowLeft;
	}
	public void setColNarrowLeft(String colNarrowLeft) {
		this.colNarrowLeft = colNarrowLeft;
	}
	public String getColNarrowRight() {
		return colNarrowRight;
	}
	public void setColNarrowright(String colNarrowRight) {
		this.colNarrowRight = colNarrowRight;
	}
	public String getColWide() {
		return colWide;
	}
	public void setColWide(String colWide) {
		this.colWide = colWide;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String[] getIdList() {
		return idList;
	}
	public void setIdList(String[] idList) {
		this.idList = idList;
	}
	public static LayoutEO getInstance ( UserEO user )//��ø��û�layout�ķ���
	{
		dbManager=new DbManager();
		LayoutEO layout = new LayoutEO();//����LayoutEO����
		//��ѯ���û���ʹ��layout��sql���
		String sql = "select layout_id from tb_ajax_layout where user_id='"+user.getId()+"'";
		ResultSet rs=null;
		try {
			rs = dbManager.getResultSet(sql);//��ü�¼��
			if (rs.next())//���ֻ��ѯ��һ����¼�����ʼ����layout,�����ظ�layout
			{
			  int layoutId = rs.getInt("LAYOUT_ID");
			  dbManager.releaseConnection();

			  return new LayoutEO(layoutId);
			}else{
				sql = "select t2.attr1 from tb_user t1,tb_userdept t2 where t1.id='"+user.getId()+"' and t1.userdept=t2.id";
				rs = dbManager.getResultSet(sql);//��ü�¼��
				if(rs.next()){
					String userdept = rs.getString("ATTR1");
					String layoutInfo = "";
					if(userdept!=null && !userdept.equals("")){
						if(userdept.equals("1")){//��
							layoutInfo = "'10,27,8','4,2,1','28,31,84','Y'";
						}else if(userdept.equals("2")){//��������
							layoutInfo = "'44,10','4,2,1','43,45,46','Y'";
						}else if(userdept.equals("3")){//��Ϣ����
							layoutInfo = "'86,7,87','4,2,1','11,24,85','Y'";
						} 
					}
					
					//dbManager.releaseConnection();

					sql = "insert into tb_ajax_layout values(LAYOUTSEQ.Nextval,'"+user.getId()+"',"+layoutInfo+")";
					dbManager.excute(sql);//ִ��sql���
					sql = "select layout_id from tb_ajax_layout where user_id='"+user.getId()+"'";		
					rs = dbManager.getResultSet(sql);//��ü�¼��
					if (rs.next())//���ֻ��ѯ��һ����¼�����ʼ����layout,�����ظ�layout
					{
					  int layoutId = rs.getInt("LAYOUT_ID");
					  dbManager.releaseConnection();
					  return new LayoutEO(layoutId);
					}
				}				
				/*sql = "insert into tb_ajax_layout values(LAYOUTSEQ.Nextval,'"+user.getId()+"','2','4','1','Y')";
				DbManager.excute(sql);//ִ��sql���
				sql = "select layout_id from tb_ajax_layout where user_id='"+user.getId()+"'";		
				rs = DbManager.getResultSet(sql);//��ü�¼��
				if (rs.next())//���ֻ��ѯ��һ����¼�����ʼ����layout,�����ظ�layout
				{
				  int layoutId = rs.getInt("LAYOUT_ID");
				  return new LayoutEO(layoutId);
				}*/
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return layout;
	}
	public Vector getWide()//�����ŷָ���ָ������ת��ΪVector
	{
		if ( getColWide()==null||getColWide().equals("") )  
			return new Vector();
		return Util.parseCSV(getColWide());
	}
	public Vector getNarrowRight()//�����ŷָ���ָ������ת��ΪVector
	{
		if ( getColNarrowRight()==null||getColNarrowRight().equals("") )  
			return new Vector();
		return Util.parseCSV(getColNarrowRight());
	}
	public Vector getNarrowLeft()//�����ŷָ���ָ������ת��ΪVector
	{
		if ( getColNarrowLeft()==null||getColNarrowLeft().equals("") )  
			return new Vector();
		return Util.parseCSV(getColNarrowLeft());
	}
}
