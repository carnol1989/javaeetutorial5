package com.baosight.dao;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;

import com.baosight.SequenceFind;
import com.baosight.SequenceFindImpl;
import com.baosight.SequenceFinderFactory;

/**
 * ����POJO��������ͨ��SequenceFind�ӿ��ṩ����id���ɷ���
 * @author ytr
 *
 */
public class BasePOJO {
	
	private SequenceFind sequenceFind;
	
	protected String id;
	
	public BasePOJO() {
		init();
		this.id = sequenceFind.getId();
	}
	
	protected void init() {
		this.sequenceFind = SequenceFinderFactory.getSequenceFinder();
	}
}
