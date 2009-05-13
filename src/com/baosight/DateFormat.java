package com.baosight;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateFormat {
	
	/**���ڸ�ʽ��
	 * @return	����yyyy-MM-dd��ʽ�������ַ���
		*/
	static public String dateFormat(java.util.Date date)
	{
		if (date.getTime() <= 0)
			return "";
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(date);
	}
	/*
	 * �����ַ�����ȡ���ڣ����ظ�ʽΪyyyyy-mm-dd
	 * */
	public static Date getDate(String dateStr) 
	{
		try
		{
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			return dateFormat.parse(dateStr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}		
	/**   
	* ��ȡָ�����ڵĺ���     
	* @param date util.Date����   
	* @return long   ����       
	*/  
	public static long getMillisTime( java.util.Date date ) {   
	   java.util.Calendar c = java.util.Calendar.getInstance();   
	   c.setTime( date );   
	   return c.getTimeInMillis();   
	} 
	/**��ȡ����
	 @param stringDate:String ��׼����
	 @param days :int ������-ǰ+��
	 */
	static public String spanDate(String stringDate, int days)
	{
		Date date = getDate(stringDate);
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		return dateFormat(cal.getTime());
	}
	/**��ȡ�����������
	 @param stringDateBegin :String ��ʼ����
	 @param stringDateEnd :String ��������
	 */
	static public int spanDateGap(String stringDateBegin, String stringDateEnd)
	{
		Date dateBegin = getDate(stringDateBegin);
		Date dateEnd = getDate(stringDateEnd);
		long dateBeginLong = getMillisTime( dateBegin );   
		long dateEndLong = getMillisTime( dateEnd );   
		int gapDays =  (int)( ( dateEndLong - dateBeginLong ) / ( 1000 * 60 * 60 * 24 ) );   
		return gapDays;
	}
	public static void main(String [] args){
		System.out.println(spanDateGap("2008-08-08","2009-08-09"));
		System.out.println(spanDate("2008-04-08",366));
	}
}
