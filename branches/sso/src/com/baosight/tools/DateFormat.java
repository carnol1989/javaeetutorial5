package com.baosight.tools;

/**
 *  ����ת��
 */

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class DateFormat {
	// ����һ��˽�е� ���ݿ������
	public static DbManager1 db = DbManager1.getInstance();

	// �����
	public static ResultSet rs = null;

	/**
	 * ���ڸ�ʽ��
	 * 
	 * @return ����yyyy-MM-dd��ʽ�������ַ���
	 */
	static public String dateFormat(java.util.Date date) {
		if (date.getTime() <= 0)
			return "";
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");
		return formatter.format(date);
	}

	/**
	 * �����ַ�����ȡ���ڣ����ظ�ʽΪyyyyy-mm-dd
	 */
	public static Date getDate(String dateStr) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			return dateFormat.parse(dateStr);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * ��ȡָ�����ڵĺ���
	 * 
	 * @param date
	 *            util.Date����
	 * @return long ����
	 */
	public static long getMillisTime(java.util.Date date) {
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.getTimeInMillis();
	}

	/**
	 * ��ȡ ĳ���ľ������ڣ��ڼ��ճ��⣩
	 * 
	 * @param1 stringDate(String ��׼����)
	 * @param2 days(int ������-ǰ+��)
	 * 
	 */
	@SuppressWarnings( { "static-access", "unchecked" })
	static public Date spanDate(String stringDate, int days) {
		Date paramDate = null;
		if (days == 0) {
			paramDate = getDate(stringDate);
			return paramDate;

		} else {
			boolean eq = true;
			// ��¼�����������ж� days = day
			int day = 0;

			String addDate = "";

			Date sdate = getDate(stringDate);
			GregorianCalendar calendar = new GregorianCalendar();
			calendar.setTime(sdate);
			calendar.add(Calendar.DATE, (days * 2));
			String endDate = dateFormat(calendar.getTime());

			// ȡ������ stringDate ���ڵ� ���ڼ������ڡ� �� ���ż������� ������
			String sql = "select holiday as holiday,day as day from ssoadmin.tb_oa_holiday where holiday between to_date('"
					+ stringDate
					+ "','yyyy-mm-dd') and to_date('"
					+ endDate
					+ "','yyyy-mm-dd') order by holiday";
			try {
				rs = db.getResultSet(sql);
				List list = new ArrayList();
				while (rs.next()) {
					list.add(rs.getDate("holiday"));
				}
				// �����б��д�������ڣ�stringDate��
				Date date = getDate(stringDate);
				// ��������
				GregorianCalendar cal = (GregorianCalendar) GregorianCalendar
						.getInstance();
				// �� stringDate ����Ϊ���������Ա����
				cal.setTime(date);
				if (list.size() == 0) {
					cal.add(Calendar.DATE, days);
					addDate = dateFormat(cal.getTime());
					paramDate = getDate(addDate);
				} else {

					for (int i = 0; i < 100; i++) {
						// ���� +1
						cal.add(Calendar.DATE, 1);
						addDate = dateFormat(cal.getTime());
						paramDate = getDate(addDate);
						for (int y = 0; y < list.size(); y++) {
							Date holiday = (Date) list.get(y);
							// �����ȣ�paramDate Ϊ�ڼ��գ��������
							if (holiday.compareTo(paramDate) == 0) {
								eq = true;
								break;
							}
							// ����paramDate ���ǽڼ��գ�������һ��
							else {
								eq = false;
							}

						}
						if (eq == false) {
							day++;
						}
						if (day == days) {
							break;
						}
					}
				}
				// System.out.println("�������ڣ�" + addDate);
				return paramDate;

			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

	}

	/**
	 * ��ȡ��������������ڼ��ճ��⣩
	 * 
	 * @param1 stringDateBegin(String ��ʼ����)
	 * @param2 stringDateEnd(String ��������)
	 * 
	 */
	@SuppressWarnings("static-access")
	static public int spanDateGap(String stringDateBegin, String stringDateEnd) {
		// ��������еĽڼ�������
		int totalCount = 0;
		// ���ڷ���
		int returnDay = 0;
		// ��ʼ����
		Date dateBegin = getDate(stringDateBegin);
		// String beginTime = dateFormat(dateBegin);
		// ��������
		GregorianCalendar cal2 = (GregorianCalendar) GregorianCalendar
				.getInstance();
		// �� stringDate ����Ϊ���������Ա����
		cal2.setTime(dateBegin);
		// ���� +1
		cal2.add(Calendar.DATE, 1);
		String begin = dateFormat(cal2.getTime());

		// ��������
		Date dateEnd = getDate(stringDateEnd);
		String endTime = dateFormat(dateEnd);

		// long dateBeginLong = getMillisTime( dateBegin );
		// long dateEndLong = getMillisTime( dateEnd );
		// ����������û�г�ȥ�ڼ��գ�
		// int gapDays = (int)( ( dateEndLong - dateBeginLong ) / ( 1000 * 60 *
		// 60 * 24 ) );

		long time = Math.abs(dateBegin.getTime() - dateEnd.getTime());
		int gapDays = (int) (time / (24 * 3600 * 1000));

		// System.out.println("����������û�г�ȥ�ڼ��գ���" + gapDays);

		// ȡ�����ݿ��п�ʼ���ںͽ�������֮��Ľڼ�������
		String sql = "select count(*) as totalcount from ssoadmin.tb_oa_holiday where holiday between to_date('"
				+ begin
				+ "','yyyy-mm-dd') and to_date('"
				+ endTime
				+ "','yyyy-mm-dd')";
		try {
			rs = db.getResultSet(sql);
			while (rs.next()) {
				totalCount = rs.getInt("totalcount");
				System.out.println("��������еĽڼ���������" + totalCount);
			}
			returnDay = gapDays - totalCount;
			System.out.println("���ʵ�ʵ����������" + returnDay);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return returnDay;

	}

	// �������
	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		// System.out.println(spanDateGap("2008-8-28","2008-9-4 20:14:50"));
		// System.out.println(spanDate("2010-04-11",5));
		DateFormat obj = new DateFormat();
		// ��ȡĳ�������ڣ��ڼ��ճ��⣩
		System.out.println("============= ��ȡĳ�������ڣ��ڼ��ճ��⣩ ==============");
		@SuppressWarnings("unused")
		Date someDay = obj.spanDate("2008-11-3", 2);

		System.out.println(someDay.toString());

		// ��ȡ����������ڼ��ճ��⣩
		// System.out.println("============= ��ȡ����������ڼ��ճ��⣩ ==============");
		// @SuppressWarnings("unused")
		// int day = obj.spanDateGap("2008-08-31", "2008-09-04");
	}
}
