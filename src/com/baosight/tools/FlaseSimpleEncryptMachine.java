package com.baosight.tools;

/**
 * �ټ����� ʵ��EncryptMachine�ӿڣ���ʵ�֣�����֧���������ļ������ü�����
 */

public class FlaseSimpleEncryptMachine implements EncryptMachine {
	/*
	 * ��ü��ܺ������
	 */
	public String getEncryptData(String data, String item) {
		return data;
	}

	/*
	 * ��ý��ܺ������
	 */
	public String getDncodeData(String data) {
		return data;
	}

	/*
	 * �����㷨
	 */
	public byte[] encode(byte[] input, byte[] key) throws Exception {
		return input;
	}

	/*
	 * �����㷨
	 */
	public byte[] decode(byte[] input, byte[] key) throws Exception {
		return input;
	}

}