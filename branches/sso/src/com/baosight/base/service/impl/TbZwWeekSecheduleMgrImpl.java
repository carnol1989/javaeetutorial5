/**
 * 
 */
package com.baosight.base.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import com.baosight.base.dao.ITbDeptDAO;
import com.baosight.base.dao.ITbMeetingDAO;
import com.baosight.base.dao.ITbUserDAO;
import com.baosight.base.dao.ITbUserdeptDAO;
import com.baosight.base.dao.ITbZwWeekSecheduleDAO;
import com.baosight.base.service.ITbZwWeekSecheduleMgr;
import com.baosight.mode.TbDept;
import com.baosight.mode.TbMeeting;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserdept;
import com.baosight.mode.TbZwWeekSechedule;
import com.baosight.tools.WeekManager;

/**
 * @author imp860124
 * 
 */
public class TbZwWeekSecheduleMgrImpl implements ITbZwWeekSecheduleMgr {

	private ITbZwWeekSecheduleDAO tbZwWeekSecheduleDAO;

	private ITbUserDAO tbUserDAO;

	private ITbDeptDAO tbDeptDAO;

	private ITbUserdeptDAO tbUserdeptDAO;

	private ITbMeetingDAO tbMeetingDAO;

	public ITbMeetingDAO getTbMeetingDAO() {
		return tbMeetingDAO;
	}

	public void setTbMeetingDAO(ITbMeetingDAO tbMeetingDAO) {
		this.tbMeetingDAO = tbMeetingDAO;
	}

	/**
	 * @return the tbDeptDAO
	 */
	public ITbDeptDAO getTbDeptDAO() {
		return tbDeptDAO;
	}

	/**
	 * @param tbDeptDAO
	 *            the tbDeptDAO to set
	 */
	public void setTbDeptDAO(ITbDeptDAO tbDeptDAO) {
		this.tbDeptDAO = tbDeptDAO;
	}

	/**
	 * @return the tbUserDAO
	 */
	public ITbUserDAO getTbUserDAO() {
		return tbUserDAO;
	}

	/**
	 * @param tbUserDAO
	 *            the tbUserDAO to set
	 */
	public void setTbUserDAO(ITbUserDAO tbUserDAO) {
		this.tbUserDAO = tbUserDAO;
	}

	/**
	 * @return the tbZwWeekSecheduleDAO
	 */
	public ITbZwWeekSecheduleDAO getTbZwWeekSecheduleDAO() {
		return tbZwWeekSecheduleDAO;
	}

	/**
	 * @param tbZwWeekSecheduleDAO
	 *            the tbZwWeekSecheduleDAO to set
	 */
	public void setTbZwWeekSecheduleDAO(
			ITbZwWeekSecheduleDAO tbZwWeekSecheduleDAO) {
		this.tbZwWeekSecheduleDAO = tbZwWeekSecheduleDAO;
	}

	/**
	 * 
	 */
	public TbZwWeekSecheduleMgrImpl() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.baosight.base.service.ITbZwWeekSecheduleMgr#delete(java.lang.String)
	 */
	public void delete(String id) {
		// TODO Auto-generated method stub
		this.tbZwWeekSecheduleDAO
				.delete(this.tbZwWeekSecheduleDAO.findById(id));
		// ���ݴ��ճ�id����ɾ���伶�����ӵ��ճ�
		this.deletechild(id);
	}

	private void deletechild(String pid) {
		// ���ݴ��ճ�id����ɾ���伶�����ӵ��ճ�
		List dlist = this.tbZwWeekSecheduleDAO.findByPId(pid);
		if (dlist != null && dlist.size() > 0) {
			for (int i = 0; i < dlist.size(); i++) {
				TbZwWeekSechedule zw = (TbZwWeekSechedule) dlist.get(i);
				this.tbZwWeekSecheduleDAO.delete(zw);
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.baosight.base.service.ITbZwWeekSecheduleMgr#find(java.lang.String)
	 */
	public TbZwWeekSechedule find(String id) {
		// TODO Auto-generated method stub
		return this.tbZwWeekSecheduleDAO.findById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.baosight.base.service.ITbZwWeekSecheduleMgr#findAll()
	 */
	public List findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.baosight.base.service.ITbZwWeekSecheduleMgr#findByWeekOfYear(java.lang.String)
	 */
	public List findByWeekOfYear(String weekofyear) {
		// TODO Auto-generated method stub
		List list = this.tbZwWeekSecheduleDAO.findByWeekofyear(weekofyear);

		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.baosight.base.service.ITbZwWeekSecheduleMgr#save(com.baosight.mode.TbZwWeekSechedule)
	 */
	public void save(TbZwWeekSechedule item) {
		// TODO Auto-generated method stub

		// List userList = new ArrayList();
		// String users = "";
		//
		// String ids = item.getUserId();
		// String id[] = ids.split(",");
		// int len = id.length;
		// if (len > 0) {
		// for (int i = 0; i < len; i++) {
		// TbUser user = this.tbUserDAO.findById(id[i]);
		// userList.add(user);
		// }
		// }
		// int ulen = userList.size();
		// if (ulen > 0) {
		// for (int j = 0; j < ulen; j++) {
		// TbUser tuser = (TbUser) userList.get(j);
		// if (j == 0) {
		// users = users + tuser.getName();
		// } else {
		// users = users + "," + tuser.getName();
		// }
		// }
		// }
		// item.setAttendance(users);

		this.tbZwWeekSecheduleDAO.save(item);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.baosight.base.service.ITbZwWeekSecheduleMgr#updte(com.baosight.mode.TbZwWeekSechedule)
	 */
	public void updte(TbZwWeekSechedule item) {
		// TODO Auto-generated method stub
		this.tbZwWeekSecheduleDAO.save(item);
	}

	public List findByGroupByWeekOfYear() {
		// TODO Auto-generated method stub

		List list = new ArrayList();

		String str = "select model.attr3 from tb_zw_week_sechedule model group by model.attr3";

		list = this.tbZwWeekSecheduleDAO.findByNativeSql(str);

		// String hql = "from TbZwWeekSechedule model ";
		// list = this.tbZwWeekSecheduleDAO.findByHQL(hql, true, -1, -1);

		return list;
	}

	public List findByExample(TbZwWeekSechedule instance) {
		// TODO Auto-generated method stub
		// ��ѯ�б��ʱ�򣬸���x��x�ܡ����ڼ���dept���û�private_userid����������ѯ
		// ĳ���û��ĸ����ճ̡����ڲ��ŵĲ����ճ̵�dept������ͬ��
		// privateUserIdΪ��ʱ��ʾΪ�����ճ�
		// ����Ϊ��Ӧ���û������ճ�
		String hql = "from TbZwWeekSechedule model where model.weekofyear='"
				+ instance.getWeekofyear()
				+ "' and model.dept='"
				+ instance.getDept()
				+ "' and ((model.privateUserId is null)or(model.privateUserId='"
				+ instance.getPrivateUserId() + "')) and model.attr2='"
				+ instance.getAttr2() + "'  order by model.startTime";
		return this.tbZwWeekSecheduleDAO.findByHQL(hql, true, -1, -1);
		// return this.tbZwWeekSecheduleDAO.findByExample(instance);
	}
	
	public List findPersonByExample(TbZwWeekSechedule instance) {
		// TODO Auto-generated method stub
		// �û������ճ�
		String hql = "from TbZwWeekSechedule model where model.weekofyear='"
				+ instance.getWeekofyear()
				+ "' and ((model.privateUserId='"
				+ instance.getPrivateUserId() + "')) and model.attr2='"
				+ instance.getAttr2() + "'  order by model.startTime";
		return this.tbZwWeekSecheduleDAO.findByHQL(hql, true, -1, -1);
		// return this.tbZwWeekSecheduleDAO.findByExample(instance);
	}

	public List findByQuerySQL(Hashtable hashtable) {
		// TODO Auto-generated method stub

		List list = new ArrayList();

		String starttime = (String) hashtable.get("starttime");
		String endtime = (String) hashtable.get("endtime");
		String publicflag = (String) hashtable.get("publicflag");

		String str = "select model.attr3 from tb_zw_week_sechedule model where 1=1";

		if (starttime != null & !starttime.equals("")) {
			str = str + " and model.start_time>=to_date('" + starttime
					+ "','yyyy-MM-dd')";
		}
		if (endtime != null & !endtime.equals("")) {
			str = str + " and  model.start_time<=to_date('" + endtime
					+ "','yyyy-MM-dd')";
		}
		Date date = new Date();
		String snow = new java.text.SimpleDateFormat("yyyy-MM-dd").format(date);
		int now = Integer.parseInt(WeekManager.getSeqWeek(snow));
		if (publicflag != null & !publicflag.equals("0")) {
			if (publicflag.equals("1")) {
				str = str + " and  model.weekofyear<=" + now;
			}
			if (publicflag.equals("2")) {
				str = str + " and  model.weekofyear>" + now;
			}
		}

		str = str + " group by model.attr3";

		System.out.println(str);

		list = this.tbZwWeekSecheduleDAO.findByNativeSql(str);

		return list;
	}

	public List findByStartEndTime(String startTime, String endTime) {

		List list = new ArrayList();

		String str = "select * from tb_zw_week_sechedule model where 1=1";

		if (startTime != null & !startTime.equals("")) {
			str = str + " and model.start_time>=to_date('" + startTime
					+ "','yyyy-MM-dd')";
		}
		if (endTime != null & !endTime.equals("")) {
			str = str + " and  model.start_time<=to_date('" + endTime
					+ "','yyyy-MM-dd')";
		}
		list = this.tbZwWeekSecheduleDAO.findByNativeSql1(str);
		return list;
	}

	public void savaDept(TbZwWeekSechedule item, TbUser user) {
		// TODO Auto-generated method stub
		this.tbZwWeekSecheduleDAO.save(item);
		// TbZwWeekSechedule pzw = (TbZwWeekSechedule) this.tbZwWeekSecheduleDAO
		// .findByExample(item).get(0);
		// �õ���ӵĸ��ճ̵�Id
		// ������ӵ��ճ̵�pid��Ϊ�ø��ճ̵�id

		// �õ���ǰ�û�����ϵͳ
		String strdept = user.getUserdept();
		TbUserdept loginusedept = this.tbUserdeptDAO.findById(strdept);

		String pid = item.getId();
		// ������ѡ�����Ա��Ϊÿ��ѡ�����Ա���һ�������ճ�
		if (item.getUserId() != null && !"".equals(item.getUserId())) {
			String userids = item.getUserId();
			String[] ids = userids.split(",");
			int len = ids.length;
			if (len > 0) {
				for (int i = 0; i < len; i++) {
					TbUser objUser = this.tbUserDAO.findById(ids[i]);
					// ѡ�����Ա�б����ŵģ����ٸ�����Ա������Ӹ��˲����ճ�
					if (objUser.getUserdept() != null
							&& user.getUserdept() != null
							&& !objUser.getUserdept()
									.equals(user.getUserdept())) {

						TbZwWeekSechedule objzw = new TbZwWeekSechedule();

						objzw.setAttendance(item.getAttendance());
						objzw.setAttr2(item.getAttr2());
						objzw.setAttr3(item.getAttr3());
						// ��ɫ��ʾ
						// �жϵ�ǰ�û�����ϵͳ����Ӧ��������ӵ��ճ������ճ���Դ
						// 1 ��ʾΪ��OA
						// 2 ��ʾΪ��������OA
						// 3 ��ʾΪ��Ϣ����OA
						// 4 ��ʾΪ�հ�
						// 5 ��ʾΪ����
						if (loginusedept.getAttr1().equals("1")) {
							objzw.setColorflag("2");
						} else if (loginusedept.getAttr1().equals("2")) {
							objzw.setColorflag("3");
						} else if (loginusedept.getAttr1().equals("3")) {
							objzw.setColorflag("4");
						} else if (loginusedept.getAttr1().equals("4")) {
							objzw.setColorflag("5");
						} else if (loginusedept.getAttr1().equals("5")) {
							objzw.setColorflag("6");
						} else {
							objzw.setColorflag("1");
						}

						objzw.setContent(item.getContent());
						objzw.setCreateTime(item.getCreateTime());
						// ѡ����û�����������
						objzw.setDept(objUser.getUserdept());
						objzw.setDeptId(item.getDeptId());
						objzw.setEndTime(item.getEndTime());
						// id
						objzw.setId(UUID.randomUUID().toString().replaceAll(
								"-", ""));
						objzw.setItemTitle(item.getItemTitle());
						// �����ճ�
						objzw.setItemType("person");
						objzw.setOrigin(item.getOrigin());
						objzw.setPromulgator(item.getPromulgator());
						objzw.setRem(item.getRem());
						objzw.setStartTime(item.getStartTime());
						// Ϊ�μ���Ա��ӵ��ճ̣�deptΪ��ѡ����û���userdept,userid Ϊ��ѡ���û���userid
						objzw.setUserId(objUser.getId());
						objzw.setWeekofyear(item.getWeekofyear());
						objzw.setPrivateUserId(objUser.getId());
						// ischild Ϊ1 ��ʾΪ���ճ�
						objzw.setIschild("1");
						objzw.setPid(pid);

						this.save(objzw);

					}

				}
			}
		}
		// ������ѡ��Ĳ��ţ�Ϊÿ����ѡ��Ĳ������һ�������ճ�
		if (item.getDeptId() != null && !"".equals(item.getDeptId())) {
			String olddeptids = item.getDeptId();
			String[] oldids = olddeptids.split(",");
			int oldlen = oldids.length;

			List newids = new ArrayList();

			// �����õ��Ĳ���id
			// ��ѯ��Щ���ţ�����userdept��ֻͬ���һ�������ճ̣����е�dept Ϊ���е�userdept
			// userdeptΪ�յĲ��ţ�����ҵ��λ������ˮ��ֵȣ�������Ӳ����ճ�
			if (oldlen > 0) {
				for (int i = 0; i < oldlen; i++) {
					TbDept objDept = this.tbDeptDAO.findById(oldids[i]);
					boolean flag = true;
					if (objDept.getUserDept() == null
							|| "".equals(objDept.getUserDept())) {
						flag = false;
					}
					for (int j = 0; j < newids.size(); j++) {

						if (objDept.getUserDept() != null) {
							if (objDept.getUserDept().equals(newids.get(j))) {
								flag = false;
							}
						} else {
							flag = false;
						}
					}
					if (flag == true) {
						newids.add(objDept.getUserDept().toString());
					}
				}
			}

			/*
			 * String deptids = item.getDeptId(); String[] ids =
			 * deptids.split(","); int len = ids.length;
			 */

			int len = newids.size();

			// ��ʱ��newids�Ѿ�ȥ������ͬuserdept
			if (len > 0) {
				for (int i = 0; i < len; i++) {
					// TbDept objDept = this.tbDeptDAO.findById(ids[i]);
					// String strid = (String) newids.get(i);
					// TbDept objDept = this.tbDeptDAO.findById(strid);
					String strUserdept = (String) newids.get(i);
					// �����Ų���Ĳ��ٸ�����������µĲ����ճ�
					// ѡ��Ĳ��ŵ�userdeptͬ��ǰ�����û���userdept��ͬ���ٸ��ò���������ճ�
					if (!strUserdept.equals(user.getUserdept())) {
						TbZwWeekSechedule objzw = new TbZwWeekSechedule();

						objzw.setAttendance(item.getAttendance());
						objzw.setAttr2(item.getAttr2());
						objzw.setAttr3(item.getAttr3());
						// ��ɫ��ʾ
						// �жϵ�ǰ�û�����ϵͳ����Ӧ��������ӵ��ճ������ճ���Դ
						// 1 ��ʾΪ��OA
						// 2 ��ʾΪ��������OA
						// 3 ��ʾΪ��Ϣ����OA
						// 4 ��ʾΪ�հ�
						// 5 ��ʾΪ����
						if (loginusedept.getAttr1().equals("1")) {
							objzw.setColorflag("2");
						} else if (loginusedept.getAttr1().equals("2")) {
							objzw.setColorflag("3");
						} else if (loginusedept.getAttr1().equals("3")) {
							objzw.setColorflag("4");
						} else if (loginusedept.getAttr1().equals("4")) {
							objzw.setColorflag("5");
						} else if (loginusedept.getAttr1().equals("5")) {
							objzw.setColorflag("6");
						} else {
							objzw.setColorflag("1");
						}
						objzw.setContent(item.getContent());
						objzw.setCreateTime(item.getCreateTime());
						// ѡ��Ĳ��ŵ�userdept
						objzw.setDept(strUserdept);
						objzw.setDeptId(item.getDeptId());
						objzw.setEndTime(item.getEndTime());
						// id
						objzw.setId(UUID.randomUUID().toString().replaceAll(
								"-", ""));
						objzw.setItemTitle(item.getItemTitle());
						objzw.setItemType("dept");
						// objzw.setItemType(item.getItemType());
						objzw.setOrigin(item.getOrigin());
						objzw.setPromulgator(item.getPromulgator());
						objzw.setRem(item.getRem());
						objzw.setStartTime(item.getStartTime());
						// Ϊѡ��Ĳ���������ճ̣�deptΪ��ѡ���ŵ�userdept,userid����Ϊ��
						objzw.setUserId(item.getUserId());
						// objzw.setUserId("");
						objzw.setWeekofyear(item.getWeekofyear());
						objzw.setPrivateUserId("");

						// ischild Ϊ1 ��ʾΪ���ճ�
						objzw.setIschild("1");
						objzw.setPid(pid);

						this.save(objzw);
					}
				}
			}
		}
	}

	// ���鰲�Ź�������˷���
	public void savaDept(TbZwWeekSechedule item, TbUser user, TbMeeting model) {
		// TODO Auto-generated method stub
		this.tbZwWeekSecheduleDAO.save(item);


		model.setPid(item.getId());

		this.tbMeetingDAO.save(model);
		// TbZwWeekSechedule pzw = (TbZwWeekSechedule) this.tbZwWeekSecheduleDAO
		// .findByExample(item).get(0);
		// �õ���ӵĸ��ճ̵�Id
		// ������ӵ��ճ̵�pid��Ϊ�ø��ճ̵�id

		// �õ���ǰ�û�����ϵͳ
		String strdept = user.getUserdept();
		TbUserdept loginusedept = this.tbUserdeptDAO.findById(strdept);

		String pid = item.getId();
		// ������ѡ�����Ա��Ϊÿ��ѡ�����Ա���һ�������ճ�
		if (item.getUserId() != null && !"".equals(item.getUserId())) {
			String userids = item.getUserId();
			String[] ids = userids.split(",");
			int len = ids.length;
			if (len > 0) {
				for (int i = 0; i < len; i++) {
					TbUser objUser = this.tbUserDAO.findById(ids[i]);
					// ѡ�����Ա�б����ŵģ����ٸ�����Ա������Ӹ��˲����ճ�
					if (objUser.getUserdept() != null
							&& user.getUserdept() != null
							&& !objUser.getUserdept()
									.equals(user.getUserdept())) {

						TbZwWeekSechedule objzw = new TbZwWeekSechedule();

						objzw.setAttendance(item.getAttendance());
						objzw.setAttr2(item.getAttr2());
						objzw.setAttr3(item.getAttr3());
						// ��ɫ��ʾ
						// �жϵ�ǰ�û�����ϵͳ����Ӧ��������ӵ��ճ������ճ���Դ
						// 1 ��ʾΪ��OA
						// 2 ��ʾΪ��������OA
						// 3 ��ʾΪ��Ϣ����OA
						// 4 ��ʾΪ�հ�
						// 5 ��ʾΪ����
						if (loginusedept.getAttr1().equals("1")) {
							objzw.setColorflag("2");
						} else if (loginusedept.getAttr1().equals("2")) {
							objzw.setColorflag("3");
						} else if (loginusedept.getAttr1().equals("3")) {
							objzw.setColorflag("4");
						} else if (loginusedept.getAttr1().equals("4")) {
							objzw.setColorflag("5");
						} else if (loginusedept.getAttr1().equals("5")) {
							objzw.setColorflag("6");
						} else {
							objzw.setColorflag("1");
						}

						objzw.setContent(item.getContent());
						objzw.setCreateTime(item.getCreateTime());
						// ѡ����û�����������
						objzw.setDept(objUser.getUserdept());
						objzw.setDeptId(item.getDeptId());
						objzw.setEndTime(item.getEndTime());
						// id
						objzw.setId(UUID.randomUUID().toString().replaceAll(
								"-", ""));
						objzw.setItemTitle(item.getItemTitle());
						// �����ճ�
						objzw.setItemType("person");
						objzw.setOrigin(item.getOrigin());
						objzw.setPromulgator(item.getPromulgator());
						objzw.setRem(item.getRem());
						objzw.setStartTime(item.getStartTime());
						// Ϊ�μ���Ա��ӵ��ճ̣�deptΪ��ѡ����û���userdept,userid Ϊ��ѡ���û���userid
						objzw.setUserId(objUser.getId());
						objzw.setWeekofyear(item.getWeekofyear());
						objzw.setPrivateUserId(objUser.getId());
						// ischild Ϊ1 ��ʾΪ���ճ�
						objzw.setIschild("1");
						objzw.setPid(pid);

						this.save(objzw);

					}

				}
			}
		}
		// ������ѡ��Ĳ��ţ�Ϊÿ����ѡ��Ĳ������һ�������ճ�
		if (item.getDeptId() != null && !"".equals(item.getDeptId())) {
			String olddeptids = item.getDeptId();
			String[] oldids = olddeptids.split(",");
			int oldlen = oldids.length;

			List newids = new ArrayList();

			// �����õ��Ĳ���id
			// ��ѯ��Щ���ţ�����userdept��ֻͬ���һ�������ճ̣����е�dept Ϊ���е�userdept
			// userdeptΪ�յĲ��ţ�����ҵ��λ������ˮ��ֵȣ�������Ӳ����ճ�
			if (oldlen > 0) {
				for (int i = 0; i < oldlen; i++) {
					TbDept objDept = this.tbDeptDAO.findById(oldids[i]);
					boolean flag = true;
					if (objDept.getUserDept() == null
							|| "".equals(objDept.getUserDept())) {
						flag = false;
					}
					for (int j = 0; j < newids.size(); j++) {

						if (objDept.getUserDept() != null) {
							if (objDept.getUserDept().equals(newids.get(j))) {
								flag = false;
							}
						} else {
							flag = false;
						}
					}
					if (flag == true) {
						newids.add(objDept.getUserDept().toString());
					}
				}
			}

			/*
			 * String deptids = item.getDeptId(); String[] ids =
			 * deptids.split(","); int len = ids.length;
			 */

			int len = newids.size();

			// ��ʱ��newids�Ѿ�ȥ������ͬuserdept
			if (len > 0) {
				for (int i = 0; i < len; i++) {
					// TbDept objDept = this.tbDeptDAO.findById(ids[i]);
					// String strid = (String) newids.get(i);
					// TbDept objDept = this.tbDeptDAO.findById(strid);
					String strUserdept = (String) newids.get(i);
					// �����Ų���Ĳ��ٸ�����������µĲ����ճ�
					// ѡ��Ĳ��ŵ�userdeptͬ��ǰ�����û���userdept��ͬ���ٸ��ò���������ճ�
					if (!strUserdept.equals(user.getUserdept())) {
						TbZwWeekSechedule objzw = new TbZwWeekSechedule();

						objzw.setAttendance(item.getAttendance());
						objzw.setAttr2(item.getAttr2());
						objzw.setAttr3(item.getAttr3());
						// ��ɫ��ʾ
						// �жϵ�ǰ�û�����ϵͳ����Ӧ��������ӵ��ճ������ճ���Դ
						// 1 ��ʾΪ��OA
						// 2 ��ʾΪ��������OA
						// 3 ��ʾΪ��Ϣ����OA
						// 4 ��ʾΪ�հ�
						// 5 ��ʾΪ����
						if (loginusedept.getAttr1().equals("1")) {
							objzw.setColorflag("2");
						} else if (loginusedept.getAttr1().equals("2")) {
							objzw.setColorflag("3");
						} else if (loginusedept.getAttr1().equals("3")) {
							objzw.setColorflag("4");
						} else if (loginusedept.getAttr1().equals("4")) {
							objzw.setColorflag("5");
						} else if (loginusedept.getAttr1().equals("5")) {
							objzw.setColorflag("6");
						} else {
							objzw.setColorflag("1");
						}
						objzw.setContent(item.getContent());
						objzw.setCreateTime(item.getCreateTime());
						// ѡ��Ĳ��ŵ�userdept
						objzw.setDept(strUserdept);
						objzw.setDeptId(item.getDeptId());
						objzw.setEndTime(item.getEndTime());
						// id
						objzw.setId(UUID.randomUUID().toString().replaceAll(
								"-", ""));
						objzw.setItemTitle(item.getItemTitle());
						objzw.setItemType("dept");
						// objzw.setItemType(item.getItemType());
						objzw.setOrigin(item.getOrigin());
						objzw.setPromulgator(item.getPromulgator());
						objzw.setRem(item.getRem());
						objzw.setStartTime(item.getStartTime());
						// Ϊѡ��Ĳ���������ճ̣�deptΪ��ѡ���ŵ�userdept,userid����Ϊ��
						objzw.setUserId(item.getUserId());
						// objzw.setUserId("");
						objzw.setWeekofyear(item.getWeekofyear());
						objzw.setPrivateUserId("");

						// ischild Ϊ1 ��ʾΪ���ճ�
						objzw.setIschild("1");
						objzw.setPid(pid);

						this.save(objzw);
					}
				}
			}
		}
	}

	public void savePerson(TbZwWeekSechedule item, TbUser user) {
		// TODO Auto-generated method stub
		this.tbZwWeekSecheduleDAO.save(item);
	}

	public void updateDept(TbZwWeekSechedule item, TbUser user) {
		// TODO Auto-generated method stub
		// �ȼ���ɾ�����ճ̺͸��ճ̹������������ճ�
		String id = item.getId();
		this.delete(id);

		// �ٱ�����ճ̣�����������µ����ճ�
		this.savaDept(item, user);

	}
	//���鰲�Ź�������˸��·���
	public void updateDept(TbZwWeekSechedule item, TbUser user,TbMeeting model) {
		// TODO Auto-generated method stub
		// �ȼ���ɾ�����ճ̺͸��ճ̹������������ճ�
		String id = item.getId();
		this.delete(id);

		// �ٱ�����ճ̣�����������µ����ճ�
		this.savaDept(item, user,model);

	}

	public void updatePerson(TbZwWeekSechedule item, TbUser user) {
		// TODO Auto-generated method stub
		this.tbZwWeekSecheduleDAO.update(item);
	}

	/**
	 * @return the tbUserdeptDAO
	 */
	public ITbUserdeptDAO getTbUserdeptDAO() {
		return tbUserdeptDAO;
	}

	/**
	 * @param tbUserdeptDAO
	 *            the tbUserdeptDAO to set
	 */
	public void setTbUserdeptDAO(ITbUserdeptDAO tbUserdeptDAO) {
		this.tbUserdeptDAO = tbUserdeptDAO;
	}

	public List findPersonLast(TbUser user, Hashtable dateList) {
		// TODO Auto-generated method stub
		String sql="select * from tb_zw_week_sechedule t where" +
				" (t.user_id like '%"+user.getId()+"%' or t.private_userid like '%"+user.getId()+"%') " +
				" and t.start_time >=to_date('"+ dateList.get("nowDate") + "','yyyy-MM-dd')" +
				" and t.start_time <=to_date('"+ dateList.get("nextDate") + "','yyyy-MM-dd')" +
				" order by t.start_time";
		System.out.println(sql);
		return this.tbZwWeekSecheduleDAO.findByNativeSql(sql, TbZwWeekSechedule.class);
	}
}
