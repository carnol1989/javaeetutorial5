package com.baosight;

import java.util.UUID;


/**
 * �õ�ϵͳ����Ҫ����ţ�����Ԥװ��һ���������
 */
public class SequenceFindImpl implements SequenceFind {
	/**
	 * ���λ����������
	 */
	private static int maxID = 0;

	/**
	 * ��ǰȡ�õ����
	 */
	private static int id = 0;

	/**
	 * �õ���ǰ���
	 * 
	 * @return ��ǰ���
	 * @throws java.sql.SQLException
	 */
	public synchronized String getId() {
//		// ����Ҫ���ص�id��
//		int cur = id;
//		// id�ź���
//		id++;
//		// �����������
//		if (id >= maxID) {
//			// װ�ػ���
//			loadID();
//		}
//		return cur;
		UUID uuid = UUID.randomUUID();
		String result = uuid.toString();
		result = result.replaceAll("-", "");
		return result;
	}


	/**
	 * �õ���ǰ���
	 * 
	 * @return ��ǰ���
	 * @throws java.sql.SQLException
	 */
//	public static void loadID() throws Exception {
//		// ����ű��еõ���ǰ���
//		String sql = "select bssequence from bsdual";
//		String result[][] = DBTools.executeQueryWithTableHead(sql);
//		int cur = Integer.parseInt(result[1][0]);
//		// �õ�����ĸ���
//		int count = 1;
//		try {
//			count = Integer.parseInt(PropertiesService.getProperty("sequence",
//					"count"));
//		} catch (Exception e) {
//		}
//		// ������Ϊ��ǰ���+�������
//		maxID = cur + count;
//		id = cur;
//		// ������ű�
//		DBTools.excuteUpdate("update bsdual set bssequence = "
//				+ Integer.toString(maxID));
//	}
}