package com.baosight.tools;


//import com.browsesoft.PropertiesService;

/**
 * ��ü������Ĺ�����
 */
public class GetEncryptMachineTool {
	/**
	 * ȡ�������ļ������õļ�����
	 * 
	 * @return EncryptMachine
	 */
	public static EncryptMachine getEncryptMachine() {
		String userPassEncrypt = null;
		EncryptMachine em = null;
		String falseEncryptMachine = "com.baosight.tools.FlaseSimpleEncryptMachine";//"com.browsesoft.oa.FlaseSimpleEncryptMachine";
		try {
			// ȡ���û�������
			// ȡ�ü����������� ��Դ:�����ļ�
			userPassEncrypt = "com.baosight.tools.SimpleEncryptMachine";//PropertiesService.getProperty("Encrypt","encryptmachine");
			em = (EncryptMachine) Class.forName(userPassEncrypt).newInstance();
		} catch (Exception ex) {
			// �����ټ���������FlaseEncryptMachine��ʵ����EncryptMachine�ӿ�
			try {
				em = (EncryptMachine) Class.forName(falseEncryptMachine)
						.newInstance();
			} catch (Exception ex1) {
				ex1.printStackTrace();
			}
		}
		return em;
	}
}
