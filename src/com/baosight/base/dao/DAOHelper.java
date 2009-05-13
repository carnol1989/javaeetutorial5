package com.baosight.base.dao;

import java.util.List;

/**
 * <p>Decription:���÷������Է�������</p>
 * @author heaton.cai
 * <p>Create Time:2008-10-15</p>
 */
public interface DAOHelper {

	public abstract int exeSql(String sql);

	public abstract List findBySql(String sql);

	public abstract List findByHQL(final String hql, final boolean cacheable,
			final int startIndex, final int maxResultCount);

}
