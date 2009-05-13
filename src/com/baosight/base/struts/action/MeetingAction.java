package com.baosight.base.struts.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.mode.TbMeeting;
import com.baosight.mode.TbMeetingroom;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbZwWeekSechedule;
import com.baosight.struts.action.BaseDispatchAction;
import com.baosight.tools.WeekManager;
import com.baosight.tools.YearList;

public class MeetingAction extends BaseDispatchAction{

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaValidatorForm dvf= (DynaValidatorForm) form;
		String strSelField = dvf.getString("selField");
		String year = null;
		String month = null;
		String yearMonth = null;
		
		String action = request.getParameter("action");
		//�õ���ǰ��¼�û�
		TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
		if (action!=null&&!action.equals("")) 
		{
			//��һ�ν����ѯ��ǰ��
			if (action.equals("thismonth")) 
			{
				Calendar calendar = Calendar.getInstance(Locale.CHINA);
				year = String.valueOf(calendar.get(Calendar.YEAR));
				month=String.valueOf(calendar.get(Calendar.MONTH)+1);	
			}
			//ȡ��������,��
			else
			{
				year=request.getParameter("year");
				month=request.getParameter("month");
			}
		}
		//1-9��תΪ01-09
		if(month.length()!=2)
		{
			month="0"+month;
		}
		//�� 2008-11-20 �޸�
		Map map = new HashMap();
		if("query".equals(action)){
			String selField =dvf.getString("selField");//ѡ���ֶ�
			System.out.println("selField:"+selField);
			String selConditions =dvf.getString("selConditions");//ѡ��
			String selParameter =dvf.getString("selParameter");
			String selParameterDateTime =dvf.getString("selParameterDateTime");
			map.put("selField", selField);
			map.put("selConditions", selConditions);
			map.put("selParameter", selParameter);
			map.put("selParameterDateTime",selParameterDateTime);
		}
		yearMonth=year+month;
		//�������º͵�ǰ�û����ڲ��Ų�ѯ
		
	
		
		List meeting=this.meetingMgr.findByYearMonth(yearMonth,user.getUserdept(),map);
		
		//�õ���ǰ���ǰ���ͺ��������
		List yearList = YearList.getYearList(-2, 5);
		//�õ��·�
		List monthList = YearList.getMonthList(12);
		
		request.setAttribute("year",year);
		request.setAttribute("month",month);
		request.setAttribute("meeting", meeting);
		request.setAttribute("yearList",yearList);
		request.setAttribute("monthList",monthList);
		//�� 2008-11-19 ���
		getOption(strSelField,dvf);
		
		return mapping.findForward("list");
	}
	public void getOption(String strSelField,DynaValidatorForm dvf){
		Collection<LabelValueBean> selFieldColl = new LinkedList<LabelValueBean>();
		selFieldColl.add(new LabelValueBean("",""));
		selFieldColl.add(new LabelValueBean("������","f1"));
		selFieldColl.add(new LabelValueBean("�������","f2"));
		selFieldColl.add(new LabelValueBean("��ʼʱ��","f3"));
		selFieldColl.add(new LabelValueBean("����ʱ��","f4"));
		selFieldColl.add(new LabelValueBean("������","f5"));
		selFieldColl.add(new LabelValueBean("������","f6"));
		selFieldColl.add(new LabelValueBean("��Ҫ����","f7"));
		dvf.set("selFieldColl", selFieldColl);
		//dvf.set("selField", dvf.getString("selField"));
		Collection<LabelValueBean> selConditionsColl = new LinkedList<LabelValueBean>();
		selConditionsColl.add(new LabelValueBean("����","="));
		selConditionsColl.add(new LabelValueBean("������","!="));
		selConditionsColl.add(new LabelValueBean("����",">"));
		selConditionsColl.add(new LabelValueBean("С��","<"));
		selConditionsColl.add(new LabelValueBean("���ڻ����",">="));
		selConditionsColl.add(new LabelValueBean("С�ڻ����","<="));
		selConditionsColl.add(new LabelValueBean("����","in"));
		selConditionsColl.add(new LabelValueBean("������","not in"));
		dvf.set("selConditionsColl", selConditionsColl);
		//dvf.set("selConditions", dvf.getString("selConditions"));
		Collection<LabelValueBean> parameterColl = new LinkedList<LabelValueBean>();
		if(strSelField!=null && !"".equals(strSelField)){
			if("f1".equals(strSelField) || "f2".equals(strSelField)){
				dvf.set("selParameter", "");
				dvf.set("strStute", "0");
			}else if("f3".equals(strSelField) || "f4".equals(strSelField)){
				Date date = new Date();
				if(dvf.getString("selParameterDateTime")==null || "".equals(dvf.getString("selParameterDateTime"))){
				 dvf.set("selParameterDateTime", date.toLocaleString());
				}
				dvf.set("strStute", "2");
			}else if("f5".equals(strSelField)){
				List allmeetingroom = this.meetingRoomMgr.findAll();
			    for(int i =0;i<allmeetingroom.size();i++){
			    	TbMeetingroom tmRomm = (TbMeetingroom) allmeetingroom.get(i);
			    	parameterColl.add(new LabelValueBean(tmRomm.getRoomName(),tmRomm.getRoomName()));
			    }
			    dvf.set("strStute", "1");
			}else if("f6".equals(strSelField)){
			    dvf.set("strStute", "0");
			}else if("f7".equals(strSelField)){
			    for(int i =1;i<6 ;i++){
			    	parameterColl.add(new LabelValueBean(i+"",i+""));
			    }
			    dvf.set("strStute", "1");
			}
		}
		dvf.set("selParameterColl", parameterColl);
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaValidatorForm dvf= (DynaValidatorForm) form;
		String strSelField = dvf.getString("selField");
		String id = request.getParameter("id");
		if (!"".equals(id)) {
			Integer schedule=this.meetingMgr.findById(id).getSchedule();
			//������������ѹ������ճ̹���,��ɾ���ճ�
			if(schedule==1)
			{
				this.tbZwWeekSecheduleMgr.delete(this.meetingMgr.findById(id).getPid());
			}	
			this.meetingMgr.delete(id);
			getOption(strSelField,dvf);
			return mapping.findForward("success");
		}
		getOption(strSelField,dvf);
		return mapping.findForward("success");
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaValidatorForm dvf= (DynaValidatorForm) form;
		String strSelField = dvf.getString("selField");
		TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
		String action = request.getParameter("action");
		if (!"".equals(action)) {
			if (action.equals("add")) {
				String year = DateFormat.getDateTimeInstance()
					.format(new java.util.Date()).substring(0,4);
				List countYear = this.meetingMgr.findByYear(year);
				//�õ����õĻ�����
				List meetingRoom=this.meetingMgr.findMeetingRoom();

				request.setAttribute("year", year);
				request.setAttribute("countYear", countYear);
				request.setAttribute("meetingRoom", meetingRoom);
				System.out.println("----------aaddddd=");
				return mapping.findForward("add");
			}
			if (action.equals("submit")) {
				
				String meetingSn = (String) ((DynaValidatorForm) form).get("meetingSn");
				String title = (String) ((DynaValidatorForm) form).get("title");
				
				String tempStartTime = (String) ((DynaValidatorForm) form).get("startTime");
				String tempEndTime = (String) ((DynaValidatorForm) form).get("endTime");
				
				DateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");         
				Date startTime=null;
				Date endTime=null;
				try {
					startTime = format.parse(tempStartTime);
					endTime = format.parse(tempEndTime);
				} catch (ParseException e) {
					e.printStackTrace();
				}

				String meetingroom = (String) ((DynaValidatorForm) form).get("meetingroom");
				Float fee =Float.parseFloat("0");
				String feeStr =  ((DynaValidatorForm) form).getString("fee");
			    if(feeStr!=null && !"".equals(feeStr)){
			    	fee=Float.valueOf(feeStr);
			    }
				String presider = (String) ((DynaValidatorForm) form).get("presider");
				String participant = (String) ((DynaValidatorForm) form).get("participant");
				
				String presidername = (String) ((DynaValidatorForm) form).get("presidername");
				String participantname = (String) ((DynaValidatorForm) form).get("participantname");
				
				Integer lvl=Integer.valueOf(((DynaValidatorForm) form).get("lvl").toString());
				String topic = (String) ((DynaValidatorForm) form).get("topic");
				
				String rem = (String) ((DynaValidatorForm) form).get("rem");
				String sch=(String)((DynaValidatorForm) form).get("schedule");
				Integer schedule=0;
				
				//ѡ��������ճ̹���ʱ,����ת��
				if(sch!=null&&!sch.equals(""))
				{
					schedule=Integer.valueOf(((DynaValidatorForm) form).get("schedule").toString());
				}
				String presideDept = (String) ((DynaValidatorForm) form).get("presideDept");
				
				String participantDept = (String) ((DynaValidatorForm) form).get("participantDept");
				String yearMonth = tempStartTime.substring(0,4)+tempStartTime.substring(5,7);
				
				//Ŀǰ����״̬Ϊδ֪ͨ
				int status=0;
				
				TbMeetingroom room=this.meetingRoomMgr.findById(meetingroom);
				
				TbMeeting model = new TbMeeting(meetingSn, title, startTime,
						endTime, meetingroom, fee, presider, participant, lvl,
						topic, rem, user.getUserdept(), yearMonth, room.getRoomName(), status, presidername,
						participantname,presideDept,participantDept,schedule);
//				this.meetingMgr.save(model);
				//�������ճ̹���
				if(schedule==1)
				{
					try{					
					//�õ��û����ڲ���
					String dept = user.getUserdept();
					//��������ʱΪ��ǰ�û�		
					//String promulgator = user.getName();
					//�ټ���
					String promulgator = presidername;
					//����û�ID
					String userId=null;
					//��Ų���ID
					String deptId=null;
					
					//�����˺Ͳ����˶���Ϊ��ʱ,��','����
					if(!presider.equals("")&&!participant.equals(""))
					{
						userId=presider+","+participant;
					}
					else
					{
						userId=presider+participant;
					}
					//���ֲ��źͲ��벿�Ŷ���Ϊ��ʱ,��','����
					if(!presideDept.equals("")&&!participantDept.equals(""))
					{
						deptId=presideDept+","+participantDept;
					}
					else
					{
						deptId=presideDept+participantDept;
					}
					
					// �μ���Ա����λ
					//String attendance = "<������>"+presidername+"<������>"+participantname;
					String attendance = participantname;
					//�õ���,��
					String weekofyear = WeekManager.getSeqWeek(tempStartTime);
					
					SimpleDateFormat spf = new SimpleDateFormat("yyyy-MM-dd");
					//��Ÿ����ճ�Ϊ���ڼ�
					String day = WeekManager.getDayOfWeek(spf
							.parse(tempStartTime));
					//��ŵ����ճ������ܵ���ʼ����
					String start = WeekManager.getSunday(spf
							.parse(tempStartTime));
					//��������
					String end = WeekManager.getSaturday(spf
							.parse(tempStartTime));
		
					TbZwWeekSechedule zw = new TbZwWeekSechedule();
					
					zw.setItemTitle(title);
		
					zw.setStartTime(startTime);
		
					zw.setPromulgator(promulgator);
		
					zw.setCreateTime(new java.text.SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss").format(new Date()));
					zw.setRem(room.getRoomName());
					zw.setAttr2(day);
					zw.setAttr3(start + "," + end);
					zw.setWeekofyear(weekofyear);
					zw.setContent(topic);
					zw.setEndTime(startTime);
					zw.setOrigin("");
					zw.setDept(dept);
					
					zw.setAttendance(attendance);
					zw.setItemType("dept");
					zw.setOrigin(dept);
					// 1Ϊ�������ճ�
					zw.setColorflag("1");
					// ѡ�����Աids
					zw.setUserId(userId);
					// ѡ��Ĳ���ids
					zw.setDeptId(deptId);
					// ��ӵ�Ϊ�����ճ̣�����useridΪ�գ����б������û����ɼ�
					zw.setPrivateUserId("");
		
					// ischild Ϊ0��ʾΪ���ճ�
					zw.setIschild("1");
					// pid Ϊ�ձ�ʾΪ���ճ�
					zw.setPid("");
					//���������¼�����淽���б���
					this.tbZwWeekSecheduleMgr.savaDept(zw, user,model);
					}
					catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				//����������ճ̹���,ֱ����Ӹ�������
				else
				{
					this.meetingMgr.save(model);
				}
				getOption(strSelField, dvf);
				return mapping.findForward("success");
			}
		}
		getOption(strSelField,dvf);
		return mapping.findForward("list");
	}
	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaValidatorForm dvf= (DynaValidatorForm) form;
		String strSelField = dvf.getString("selField");
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
		if (action != null && action.equals("submit")) {
			
			String meetingSn = (String) ((DynaValidatorForm) form).get("meetingSn");
			String title = (String) ((DynaValidatorForm) form).get("title");
			
			String tempStartTime = (String) ((DynaValidatorForm) form).get("startTime");
			String tempEndTime = (String) ((DynaValidatorForm) form).get("endTime");
			
			DateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");         
			Date startTime=null;
			Date endTime=null;
			try {
				startTime = format.parse(tempStartTime);
				endTime = format.parse(tempEndTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String meetingroom = (String) ((DynaValidatorForm) form).get("meetingroom");
			Float fee =Float.parseFloat("0");
			String feeStr = ((DynaValidatorForm) form).getString("fee");
			if(feeStr!=null && !"".equals(feeStr)){
				fee=Float.valueOf(feeStr);
			}
			String presider = (String) ((DynaValidatorForm) form).get("presider");
			String participant = (String) ((DynaValidatorForm) form).get("participant");
			
			String presidername = (String) ((DynaValidatorForm) form).get("presidername");
			String participantname = (String) ((DynaValidatorForm) form).get("participantname");
			
			Integer lvl=Integer.valueOf(((DynaValidatorForm) form).get("lvl").toString());
			String topic = (String) ((DynaValidatorForm) form).get("topic");
			
			String rem = (String) ((DynaValidatorForm) form).get("rem");
			String sch=(String)((DynaValidatorForm) form).get("schedule");
			Integer schedule=0;
			
			//ѡ��������ճ̹���ʱ,����ת��
			if(sch!=null&&!sch.equals(""))
			{
				schedule=Integer.valueOf(((DynaValidatorForm) form).get("schedule").toString());
			}
			
			String presideDept = (String) ((DynaValidatorForm) form).get("presideDept");
			
			String participantDept = (String) ((DynaValidatorForm) form).get("participantDept");
			
			
			String yearMonth = tempStartTime.substring(0,4)+tempStartTime.substring(5,7);
			TbMeeting item = this.meetingMgr.findById(id);
			//������༭������¼�Ѿ��������ճ̹���,��ɾ���������ճ̹���
			if(item.getSchedule().toString().equals("1"))
			{
				this.tbZwWeekSecheduleMgr.delete(item.getPid());
			}
			item.setMeetingSn(meetingSn);
			item.setTitle(title);
			item.setStartTime(startTime);
			item.setEndTime(endTime);
			item.setMeetingroom(meetingroom);
			item.setFee(fee);
			item.setPresider(presider);
			item.setParticipant(participant);
			item.setLvl(lvl);
			item.setTopic(topic);
			item.setRem(rem);
			item.setDept(user.getUserdept());
			item.setYearMonth(yearMonth);
			item.setAttr2(this.meetingRoomMgr.findById(meetingroom).getRoomName());
			item.setPresidername(presidername);
			item.setParticipantname(participantname);
			item.setSchedule(schedule);
			item.setPresideDept(presideDept);
			item.setParticipantDept(participantDept);
			
//			this.meetingMgr.updte(item);
			
			if(((DynaValidatorForm) form).get("schedule").toString().equals("1"))
			{
				try{
					
					String dept = user.getUserdept();
//					�ټ���
					String promulgator = presidername;
					//String promulgator = user.getName();
					
					String userId=null;
					String deptId=null;
					
					
					//�����˺Ͳ����˶���Ϊ��ʱ,��','����
					if(!presider.equals("")&&!participant.equals(""))
					{
						userId=presider+","+participant;
					}
					else
					{
						userId=presider+participant;
					}
					//���ֲ��źͲ��벿�Ŷ���Ϊ��ʱ,��','����
					if(!presideDept.equals("")&&!participantDept.equals(""))
					{
						deptId=presideDept+","+participantDept;
					}
					else
					{
						deptId=presideDept+participantDept;
					}
					
					// �μ���Ա����λ
					String attendance =participantname;
					//String attendance = "<������>"+presidername+"<������>"+participantname;
		
					String weekofyear = WeekManager.getSeqWeek(tempStartTime);
		
					SimpleDateFormat spf = new SimpleDateFormat("yyyy-MM-dd");
					// String date = (String) request.getParameter("date");
					String day = WeekManager.getDayOfWeek(spf
							.parse(tempStartTime));
					String start = WeekManager.getSunday(spf
							.parse(tempStartTime));
					String end = WeekManager.getSaturday(spf
							.parse(tempStartTime));
		
					TbZwWeekSechedule zw = new TbZwWeekSechedule();
					// zw.setId(id);
					zw.setItemTitle(title);
		
					zw.setStartTime(startTime);
		
					zw.setPromulgator(promulgator);
		
					zw.setCreateTime(new java.text.SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss").format(new Date()));
					zw.setRem(this.meetingRoomMgr.findById(meetingroom).getRoomName());
					zw.setAttr2(day);
					zw.setAttr3(start + "," + end);
					zw.setWeekofyear(weekofyear);
					zw.setContent(topic);
					zw.setEndTime(startTime);
					zw.setOrigin("");
					zw.setDept(dept);

					zw.setAttendance(attendance);
					zw.setItemType("dept");
					zw.setOrigin(dept);
					// 1Ϊ�������ճ�
					zw.setColorflag("1");
					// ѡ�����Աids
					zw.setUserId(userId);
					// ѡ��Ĳ���ids
					zw.setDeptId(deptId);
					// ��ӵ�Ϊ�����ճ̣�����useridΪ�գ����б������û����ɼ�
					zw.setPrivateUserId("");
		
					// ischild Ϊ0��ʾΪ���ճ�
					zw.setIschild("1");
					// pid Ϊ�ձ�ʾΪ���ճ�
					zw.setPid("");

					this.tbZwWeekSecheduleMgr.savaDept(zw, user,item);
					}
					catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			else
			{
				this.meetingMgr.updte(item);
			}
			getOption(strSelField,dvf);
			return mapping.findForward("success");
		} else {
			if (id != null && !id.equals("")) {
				TbMeeting item = this.meetingMgr.findById(id);
				List meetingRoom=this.meetingMgr.findMeetingRoom();				
				
				((DynaValidatorForm) form).set("meetingSn", item.getMeetingSn());
				((DynaValidatorForm) form).set("title", item.getTitle());
				
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				((DynaValidatorForm) form).set("startTime", sf.format(item.getStartTime()));
				((DynaValidatorForm) form).set("endTime", sf.format(item.getEndTime()));
				((DynaValidatorForm) form).set("meetingroom", item.getMeetingroom());
				((DynaValidatorForm) form).set("fee", ""+item.getFee());
				((DynaValidatorForm) form).set("presider", item.getPresider());
				((DynaValidatorForm) form).set("participant", item.getParticipant());
				((DynaValidatorForm) form).set("lvl", item.getLvl().toString());
				((DynaValidatorForm) form).set("topic", item.getTopic() );
				((DynaValidatorForm) form).set("rem", item.getRem());
				((DynaValidatorForm) form).set("presidername", item.getPresidername());
				((DynaValidatorForm) form).set("participantname", item.getParticipantname());
				((DynaValidatorForm) form).set("schedule", item.getSchedule().toString());
				((DynaValidatorForm) form).set("presideDept", item.getPresideDept());
				((DynaValidatorForm) form).set("participantDept", item.getParticipantDept());
				
				request.setAttribute("meetingRoom", meetingRoom);
				return mapping.findForward("add");
			}
		}
		getOption(strSelField,dvf);
		return mapping.findForward("success");
	}
}
