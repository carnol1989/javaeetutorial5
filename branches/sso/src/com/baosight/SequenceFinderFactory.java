package com.baosight;

public class SequenceFinderFactory {
	
	public static SequenceFind getSequenceFinder() {
		//TODO:�����SequenceFind�����Ʒʵ�����͸�Ϊ�������ļ��õ�
		return new SequenceFindImpl();
	}

}
