package com.baosight.services;

public interface UserService {

	/**
	 * ���ݵ�¼�����������Ƿ�ע���û�
	 * @param name
	 * @param password
	 * @return
	 */
	boolean checkUser(String name, String password);

}
