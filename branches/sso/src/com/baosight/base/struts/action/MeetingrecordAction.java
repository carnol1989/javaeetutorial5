package com.baosight.base.struts.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;
import org.hibernate.Hibernate;

import com.baosight.base.service.IMessagesMgr;
import com.baosight.base.service.ITbUserOpeationMgr;
import com.baosight.mode.TbIndividual;
import com.baosight.mode.TbMeeting;
import com.baosight.mode.TbMeetingrecord;
import com.baosight.mode.TbMeetingroom;
import com.baosight.mode.TbMessages;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserinfo;
import com.baosight.mode.TbZwWeekSechedule;
import com.baosight.struts.action.BaseDispatchAction;
import com.baosight.tools.WeekManager;
import com.baosight.tools.YearList;

public class MeetingrecordAction extends BaseDispatchAction{
	protected IMessagesMgr messagesMgr;
	
	public void setMessagesMgr(IMessagesMgr messagesMgr) {
		this.messagesMgr = messagesMgr;
	}
	public void setTbUserOpeationMgr(ITbUserOpeationMgr tbUserOpeationMgr) {
		this.tbUserOpeationMgr = tbUserOpeationMgr;
	}
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String ftime = request.getParameter("ftime");
		String ttime = request.getParameter("ttime");
		
		List allMeetingrecord = this.meetingrecordMgr.findAll();
		
		request.setAttribute("title", title);
		request.setAttribute("ftime", ftime);
		request.setAttribute("ttime", ttime);
		long count=allMeetingrecord.size();
		startPagingCount(null, request,count);
		startPaging(allMeetingrecord, null, request);
		return mapping.findForward("list");
	}
	
	public ActionForward listSelect(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		String title = request.getParameter("title");
		String ftime = request.getParameter("ftime");
		String ttime = request.getParameter("ttime");
		//��ҳ��ѡ����ʼʱ��ͽ���ʱ�䶼��Ϊ��ʱ
		if(!"".equals(ftime) && !"".equals(ttime)){
			List meetingrecordF_T = this.meetingrecordMgr.findSelectF_T(title, ftime, ttime);
			long count=meetingrecordF_T.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordF_T, null, request);
		}
        //��ҳ��ѡ����ʼʱ�䲻Ϊ�գ�����ʱ��Ϊ��ʱ
		if(!"".equals(ftime) && "".equals(ttime)){
			List meetingrecordF = this.meetingrecordMgr.findSelectTitle_From(title, ftime);
			long count=meetingrecordF.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordF, null, request);
		}
        //��ҳ��ѡ����ʼʱ��Ϊ�գ�����ʱ�䲻Ϊ��ʱ
		if("".equals(ftime) && !"".equals(ttime)){
			List meetingrecordT = this.meetingrecordMgr.findSelectTitle_To(title, ttime);
			long count=meetingrecordT.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordT, null, request);
		}
		 //��ҳ��ѡ����ʼʱ��ͽ���ʱ�䶼Ϊ��ʱ
		if("".equals(ftime) && "".equals(ttime)){
			List meetingrecordNOFT = this.meetingrecordMgr.findSelectNo_FT(title);
			long count=meetingrecordNOFT.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordNOFT, null, request);
		}


		request.setAttribute("title", title);
		request.setAttribute("ftime", ftime);
		request.setAttribute("ttime", ttime);
		return mapping.findForward("list");
	}
	
	public ActionForward delSelect(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		String title = (String) request.getAttribute("title");
		String ftime = (String) request.getAttribute("ftime");
		String ttime = (String) request.getAttribute("ttime");
		//��ҳ��ѡ����ʼʱ��ͽ���ʱ�䶼��Ϊ��ʱ
		if(!"".equals(ftime) && !"".equals(ttime)){
			List meetingrecordF_T = this.meetingrecordMgr.findSelectF_T(title, ftime, ttime);
			long count=meetingrecordF_T.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordF_T, null, request);
		}
        //��ҳ��ѡ����ʼʱ�䲻Ϊ�գ�����ʱ��Ϊ��ʱ
		if(!"".equals(ftime) && "".equals(ttime)){
			List meetingrecordF = this.meetingrecordMgr.findSelectTitle_From(title, ftime);
			long count=meetingrecordF.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordF, null, request);
		}
        //��ҳ��ѡ����ʼʱ��Ϊ�գ�����ʱ�䲻Ϊ��ʱ
		if("".equals(ftime) && !"".equals(ttime)){
			List meetingrecordT = this.meetingrecordMgr.findSelectTitle_To(title, ttime);
			long count=meetingrecordT.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordT, null, request);
		}
		 //��ҳ��ѡ����ʼʱ��ͽ���ʱ�䶼Ϊ��ʱ
		if("".equals(ftime) && "".equals(ttime)){
			List meetingrecordNOFT = this.meetingrecordMgr.findSelectNo_FT(title);
			long count=meetingrecordNOFT.size();
			startPagingCount(null, request,count);
			startPaging(meetingrecordNOFT, null, request);
		}


		request.setAttribute("title", title);
		request.setAttribute("ftime", ftime);
		request.setAttribute("ttime", ttime);
		return mapping.findForward("list");
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String ftime = request.getParameter("ftime");
		String ttime = request.getParameter("ttime");
		if (!"".equals(id)) {
			this.meetingrecordMgr.delete(id);
			request.setAttribute("title", title);
			request.setAttribute("ftime", ftime);
			request.setAttribute("ttime", ttime);
			return mapping.findForward("su");
		}
		return mapping.findForward("su");
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
		String action = request.getParameter("action");
		if (!"".equals(action)) {
			if (action.equals("add")) {
				String title = request.getParameter("title");
				String ftime = request.getParameter("ftime");
				String ttime = request.getParameter("ttime");
				
				
				request.setAttribute("title", title);
				request.setAttribute("ftime", ftime);
				request.setAttribute("ttime", ttime);
				
				return mapping.findForward("add");
			}
			if (action.equals("submit")) {
				String meetingrecordTitle = (String) ((DynaValidatorForm) form).get("meetingrecordTitle");
				String meetingrecordTime = (String) ((DynaValidatorForm) form).get("meetingrecordTime");
				String meetingrecordName = (String) ((DynaValidatorForm) form).get("meetingrecordName");
				String meetingrecordAdv = (String) ((DynaValidatorForm) form).get("meetingrecordAdv");
				String meetingrecordRem = (String) ((DynaValidatorForm) form).get("meetingrecordRem");
				//�μ���Ա
				String joiner = (String) ((DynaValidatorForm) form).get("joiner");
				//֪ͨ��Ա
				String attr1 = (String) ((DynaValidatorForm) form).get("attr1S");
				
				DateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");         
				Date time=null;
				try {
					time = format.parse(meetingrecordTime);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				
				TbMeetingrecord model = new TbMeetingrecord(meetingrecordTitle, time, meetingrecordName,
						meetingrecordAdv, meetingrecordRem, joiner, "0", attr1, "",
						"");
				this.meetingrecordMgr.save(model);

				return new ActionForward(
						"/meetingrecordaction.do?method=list&title=&ftime=&ttime=");
				
			}
		}
		return mapping.findForward("list");
	}
	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		if (action != null && action.equals("submit")) {
			String title = request.getParameter("title");
			String ftime = request.getParameter("ftime");
			String ttime = request.getParameter("ttime");
			
			String meetingrecordTitle = (String) ((DynaValidatorForm) form).get("meetingrecordTitle");
			String meetingrecordTime = (String) ((DynaValidatorForm) form).get("meetingrecordTime");
			String meetingrecordName = (String) ((DynaValidatorForm) form).get("meetingrecordName");
			String meetingrecordRem = (String) ((DynaValidatorForm) form).get("meetingrecordRem");
			String meetingrecordAdv = (String) ((DynaValidatorForm) form).get("meetingrecordAdv");
			String meetingrecordJoiner = (String) ((DynaValidatorForm) form).get("joiner");
			String attr1 = (String) ((DynaValidatorForm) form).get("attr1S");
			TbMeetingrecord meetingrecord = this.meetingrecordMgr.findById(id);
			
			meetingrecord.setMeetingrecordTitle(meetingrecordTitle);
			DateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");         
			Date time=null;
			try {
				time = format.parse(meetingrecordTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			meetingrecord.setMeetingrecordTime(time);
			meetingrecord.setMeetingrecordName(meetingrecordName);
			meetingrecord.setMeetingrecordRem(meetingrecordRem);
			meetingrecord.setMeetingrecordAdv(meetingrecordAdv);
			meetingrecord.setMeetingrecordJoiner(meetingrecordJoiner);
			meetingrecord.setAttr1(attr1);
			this.meetingrecordMgr.updte(meetingrecord);
			
			request.setAttribute("title", title);
			request.setAttribute("ftime", ftime);
			request.setAttribute("ttime", ttime);
			return new ActionForward(
			"/meetingrecordaction.do?method=list&title=&ftime=&ttime=");
		} else {
			if (id != null && !id.equals("")) {
				String title = request.getParameter("title");
				String ftime = request.getParameter("ftime");
				String ttime = request.getParameter("ttime");
				
				TbMeetingrecord meetingrecord = this.meetingrecordMgr.findById(id);
				
				 SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");   
		         String str = formatDate.format(meetingrecord.getMeetingrecordTime());
		         
				((DynaValidatorForm) form).set("meetingrecordTitle",meetingrecord.getMeetingrecordTitle());
				((DynaValidatorForm) form).set("meetingrecordTime",str);
				((DynaValidatorForm) form).set("meetingrecordName",meetingrecord.getMeetingrecordName());
				((DynaValidatorForm) form).set("meetingrecordAdv",meetingrecord.getMeetingrecordAdv());
				((DynaValidatorForm) form).set("meetingrecordRem",meetingrecord.getMeetingrecordRem());
				
				//���μ���ԱID�ָ���ѭ��ȡ�òμ���Ա��������ID����������JSP
				String namelist = "";
				String[] jons = meetingrecord.getMeetingrecordJoiner().split(",");
				for (int i = 0; i < jons.length; i++) {
					String jon = jons[i];
					TbUser user = this.userMgr.find(jon);
					String username = user.getName();
					namelist = namelist+username+",";	
				}
				String nlist = namelist.substring(0, namelist.length()-1);
				((DynaValidatorForm) form).set("meetingrecordJoiner",nlist);
				((DynaValidatorForm) form).set("joiner",meetingrecord.getMeetingrecordJoiner());
				
                //��֪ͨ��ԱID�ָ���ѭ��ȡ��֪ͨ��Ա��������ID����������JSP
				String attrlist = "";
				String[] attr1s = meetingrecord.getAttr1().split(",");
				for (int i = 0; i < attr1s.length; i++) {
					String attr1 = attr1s[i];
					TbUser user = this.userMgr.find(attr1);
					String username = user.getName();
					attrlist = attrlist+username+",";
					
					
				}
				String alist = attrlist.substring(0, attrlist.length()-1);
				((DynaValidatorForm) form).set("attr1",alist);
				((DynaValidatorForm) form).set("attr1S",meetingrecord.getAttr1());
				
				request.setAttribute("title", title);
				request.setAttribute("ftime", ftime);
				request.setAttribute("ttime", ttime);

				return mapping.findForward("add");
			}
		}
		return mapping.findForward("success");
	}
	
	public ActionForward record(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String title = request.getParameter("title");
		String ftime = request.getParameter("ftime");
		String ttime = request.getParameter("ttime");
		
		String id = request.getParameter("id");
		
		TbUser loginname = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
		TbMeetingrecord meetingrecord = this.meetingrecordMgr.findById(id);
		
        //��֪ͨ��ԱID�ָ���ѭ��ȡ��֪ͨ��Ա����
		String[] attr1s = meetingrecord.getAttr1().split(",");
		for (int i = 0; i < attr1s.length; i++) {
			//ͨ���ֶν�ȡ�õ��û�ID,ͨ���û�ID���ҵ���Ӧ�û���Ϣ������
			String attr1 = attr1s[i];
			TbUser user = this.userMgr.find(attr1);
			TbUserinfo userinfo = (TbUserinfo) this.userInfoMgr.findUserID(user.getId()).get(0);
			//���������ݱ�������MESSAGE��
			String senderID = loginname.getId();//������ID
			String senderName = loginname.getName();//������NAME
			String receiver_ID = user.getId();//������ID
			String receiver_name = user.getName();//������NAME
			String receiver_email = userinfo.getEmail();//������EMAIL
			String receiver_handset = userinfo.getHandset();//�������ֻ�
			String message_title = meetingrecord.getMeetingrecordTitle();//����
			String message_content = meetingrecord.getMeetingrecordName();//����
			Date send_time = new Date();//����ʱ��
			String send_way = "1";//���ͷ�ʽ(1վ�ڶ��ţ�2�ֻ����ţ�4�ʼ�)
			String status = "2";//��Ϣ״̬(1�ݸ壬2δ�鿴��3�Ѳ鿴)
			String attr2 = meetingrecord.getId();//�����ͼ�¼����Ϣ��¼���й���
			
			TbMessages item = new TbMessages(senderID, senderName, receiver_ID,
					receiver_name, receiver_email, receiver_handset,message_title,
					Hibernate.createClob(message_content),send_time, new Long(1), new Long(2),"",attr2,"");
			this.messagesMgr.save(item);
			
		}
		
		//�������״̬����Ϊ�ѷ��ͣ�״̬��Ϊ1
		meetingrecord.setMeetingrecordStatus("1");
		this.meetingrecordMgr.updte(meetingrecord);

		
				return new ActionForward(
						"/meetingrecordaction.do?method=listSelect&title="+title+"&ftime="+ftime+"&ttime="+ttime);

	}
	
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
		String id = request.getParameter("id");
		
			
				String title = request.getParameter("title");
				String ftime = request.getParameter("ftime");
				String ttime = request.getParameter("ttime");
				
				TbMeetingrecord meetingrecord = this.meetingrecordMgr.findById(id);
				
				 SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");   
		         String str = formatDate.format(meetingrecord.getMeetingrecordTime());
		         
				((DynaValidatorForm) form).set("meetingrecordTitle",meetingrecord.getMeetingrecordTitle());
				((DynaValidatorForm) form).set("meetingrecordTime",str);
				((DynaValidatorForm) form).set("meetingrecordName",meetingrecord.getMeetingrecordName());
				((DynaValidatorForm) form).set("meetingrecordAdv",meetingrecord.getMeetingrecordAdv());
				((DynaValidatorForm) form).set("meetingrecordRem",meetingrecord.getMeetingrecordRem());
				
				//���μ���ԱID�ָ���ѭ��ȡ�òμ���Ա��������ID����������JSP
				String namelist = "";
				String[] jons = meetingrecord.getMeetingrecordJoiner().split(",");
				for (int i = 0; i < jons.length; i++) {
					String jon = jons[i];
					TbUser user = this.userMgr.find(jon);
					String username = user.getName();
					namelist = namelist+username+",";	
				}
				String nlist = namelist.substring(0, namelist.length()-1);
				((DynaValidatorForm) form).set("meetingrecordJoiner",nlist);
	
				
                //ͨ�������ҪID����Ϣ���в��ҳ�֪ͨ����Ա
				List message = this.messagesMgr.findMessage_recordId(id);
				
				request.setAttribute("message", message);
				request.setAttribute("title", title);
				request.setAttribute("ftime", ftime);
				request.setAttribute("ttime", ttime);

				return mapping.findForward("view");
		

	}
}
