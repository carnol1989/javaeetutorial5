package com.baosight.tools;

import java.util.StringTokenizer;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;


/**
 * �����ݼ������࣬ʵ�ּ������ӿ�
 */
public class SimpleEncryptMachine implements EncryptMachine {
	/**
	 * ���� �����㷨,���� DES,DESede,Blowfish
	 */
	private static String Algorithm = "DES";

	/**
	 * ��Ҫ���ܵ���
	 */
	private static String encryptItem = null;

	/**
	 * ��Կ
	 */
	private byte[] key = "�������".getBytes();

	/**
	 * ���ݷ����Ҫ�� �õ����ܺ������
	 */
	public String getEncryptData(String info, String item) {
		// ������ܣ����ؼ��ܺ������
		if (isEncrypt(item)) {
			try {
				return byte2hex(encode(info.getBytes(), key));
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		// ��������ܣ�����ԭ����
		else {
			return info;
		}
	}

	/*
	 * ���ݷ����Ҫ�� �õ������ܺ������ @param info ��Ҫ���ܵ����� @return String ���ܺ������
	 */
	public String getDncodeData(String info) {
		try {
			// ȥ�� ":"
			StringTokenizer st = new StringTokenizer(info, ":");
			byte[] bytes = new byte[st.countTokens()];
			int i = 0;
			while (st.hasMoreElements()) {
				String sValue = st.nextToken();
				byte ch = Integer.decode("0x" + sValue).byteValue();
				bytes[i++] = ch;
			}
			// ���ؽ��ܺ������
			return new String(decode(bytes, key));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * ��Ӧ���Ƿ���Ҫ
	 */
	private static boolean isEncrypt(String item) {
		// ���������Ϊ��
		if (encryptItem == null) {
			try {
				// �������ļ��ж�ȡ������
				encryptItem = "userpassword";//PropertiesService.getProperty("Encrypt", "item");
			} catch (Exception e) {
				return false;
			}
		}
		// ��������ļ��ļ������а���ָ����
		if (encryptItem.indexOf(item) != -1) {
			// ָ����������������
			return true;
		} else {
			// ָ����������������
			return false;
		}
	}

	/**
	 * ������ת�ַ���
	 */
	private String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
			if (n < b.length - 1) {
				hs = hs + ":";
			}
		}
		return hs.toUpperCase();
	}

	/**
	 * ������Կ, ע��˲���ʱ��Ƚϳ�
	 */
	public static byte[] getKey() throws Exception {
		/**
		 * ��Կ����
		 */
		KeyGenerator keygen = KeyGenerator.getInstance(Algorithm);
		// ��Կ
		SecretKey deskey = keygen.generateKey();
		// ��Կ������
		return deskey.getEncoded();
	}

	/**
	 * ����
	 */
	public byte[] encode(byte[] input, byte[] key) throws Exception {
		// ��Կ
		SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, Algorithm);
		// �㷨��
		Cipher c1 = Cipher.getInstance(Algorithm);
		// �㷨����ʼ��
		c1.init(Cipher.ENCRYPT_MODE, deskey);
		// ����
		byte[] cipherByte = c1.doFinal(input);
		return cipherByte;
	}

	/**
	 * ����
	 */
	public byte[] decode(byte[] input, byte[] key) throws Exception {
		// ��Կ
		SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, Algorithm);
		// �㷨��
		Cipher c1 = Cipher.getInstance(Algorithm);
		// �㷨����ʼ��
		c1.init(Cipher.DECRYPT_MODE, deskey);
		// ����
		byte[] clearByte = c1.doFinal(input);
		return clearByte;
	}

	// // ���ַ���תΪ��������
	// private byte[] toBytes(String content) {
	// byte[] bytes = new byte[content.length() / 2];
	// for (int i = 0; i < bytes.length; i++) {
	// int high = toByte(content.charAt(2 * i));
	// int low = toByte(content.charAt(2 * i + 1));
	// bytes[i] = (byte) (high * 16 + low);
	// }
	// return bytes;
	// }

	/**
	 * �ѵ����ַ�ת���ɶ�����
	 */
	// private byte toByte(char ch) {
	// if (ch >= '0' && ch <= '9') {
	// return (byte) (ch - '0');
	// } else if (ch >= 'a' && ch <= 'f') {
	// return (byte) (ch - 'a' + 10);
	// } else if (ch >= 'A' && ch <= 'F') {
	// return (byte) (ch - 'A' + 10);
	// } else {
	// throw new IllegalArgumentException("�ַ�������0-9����a-f");
	// }
	// }
}
