package com.baosight.tools;

/**
 * ��˵�� �������ӿ�
 */
public interface EncryptMachine {
	/*
	 * ��ü��ܺ������
	 */
	public String getEncryptData(String data, String item);

	/*
	 * ��ý��ܺ������
	 */
	public String getDncodeData(String data);

	/*
	 * �����㷨
	 */
	public byte[] encode(byte[] input, byte[] key) throws Exception;

	/*
	 * �����㷨
	 */
	public byte[] decode(byte[] input, byte[] key) throws Exception;
}