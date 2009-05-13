package com.baosight.base.struts.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.baosight.base.service.IDocSendDealMgr;
import com.baosight.mode.TbDocSend;
import com.baosight.mode.TbDocUrgent;
import com.baosight.mode.TbUser;

public class DocSendRelatedAction extends DocSendHelper {
	
	private static final String NEW_GETING = "1";//1���յ��ķ���
	private static final String DOING = "2";     //2���ڴ���ķ���
	private static final long AREA_TYPE = 0;     //�������
	private static final long LEI_TYPE = 1;    	 //����
	private static final long LEISHU_CI = 2;     //������
	private static final long GONGWEN_TYPE = 9;     //��������
	//�����б�
	public ActionForward docSendList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		String type = (String)request.getParameter("type");
		
		List list = new ArrayList();
		long count=0;
		if ("newAndDoing".equals(type)) {
			List list1 = this.docSendDealMgr.findDocSendList(user,NEW_GETING);//1���յ��ķ���
			List list2 = this.docSendDealMgr.findDocSendList(user,DOING);//2���ڴ���ķ���
			
			if (list1!=null)
				list.addAll(list1);
			if (list2!=null)
				list.addAll(list2);
			count=list.size();
			request.setAttribute("size1", list1!=null?list1.size():0);
			request.setAttribute("size2", list2!=null?list2.size():0);
		}
		else {	
			list = this.docSendDealMgr.findDocSendList(user,type);
			count=list.size();
		}
		//request.setAttribute("list", list);
		request.setAttribute("type", type);
		startPagingCount(null, request,count);
		startPaging(list, null, request);
		return mapping.findForward("docSendList");
	}

	/*����ݵķ���ɾ��*/
	public ActionForward delSendDoc (ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");
		
		this.docSendDealMgr.deleteSendDoc(docId);
		
		return new ActionForward("/docSendRelatedAction.do?method=docSendList&type=3");
	}
	/* �߰�֪ͨ */
	public ActionForward argueNoticeInput(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");	
		//String docTitle = request.getParameter("docTitle");
		
		List userList = this.docSendDealMgr.findPersonByDocId(docId);//�ұ��߰�������
		
		request.setAttribute("userList", userList);
		
		return mapping.findForward("argueNoticeS");
	}
	public ActionForward argueNoticeDo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ParseException {
		HttpSession session = request.getSession();
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		String docId = request.getParameter("docId");	
		String content = request.getParameter("content");
		String person = request.getParameter("person");
		String[] tellTime = request.getParameterValues("tellTime");
		String selectTime = request.getParameter("selectTime");
		String[] tellwayTmp = request.getParameterValues("tellway");
		
		Date urgentTime = getSetTime (tellTime,selectTime);
		Date selTime =new Date();
		DateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String urgentWay = urgentWay (tellwayTmp);
		if (!"".equals(selectTime) && selectTime!=null)
			selTime = dateFormat.parse(selectTime);
		
		TbDocUrgent  docUrgent = new TbDocUrgent(content, person, urgentTime,
				urgentWay, selTime, user.getId(), docId);
		this.docRecListMgr.saveDocUrgentObj(docUrgent);
		request.setAttribute("closed", "true");
		return mapping.findForward("argueNoticeS");
		//return mapping.getInputForward();
	}
//	��ʱʱ��
	public Date getSetTime (String[] tellTime,String selectTime) throws ParseException {
		
		int way = 0;
		if (tellTime!=null && tellTime.length>0) {
			for (int i=0;i<tellTime.length;i++) {
				way += Integer.parseInt(tellTime[i]);
			}
		}
		
		DateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Calendar Cal=java.util.Calendar.getInstance(); 
		
		if ((way & 1) ==1) {return new Date();}//��ʱ����
		else if ((way & 8) ==8) {
			Cal.setTime(dateFormat.parse(selectTime)); 
			if ((way & 2) ==2)
				Cal.add(java.util.Calendar.HOUR_OF_DAY,-1); //��ǰһСʱ
			else
				Cal.add(java.util.Calendar.DAY_OF_MONTH,-1);//��ǰһ��
		}
		return Cal.getTime();
	}
	//�ߴٷ�ʽ
	public String urgentWay (String[] tellwayTmp) {
		int way = 0;
		if (tellwayTmp!=null && tellwayTmp.length>0) {
			for (int i=0;i<tellwayTmp.length;i++) {
				way += Integer.parseInt(tellwayTmp[i]);
			}
		}
		return way+"";
	}
	/* ȡ�� */
	public ActionForward rollBack(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String docId = request.getParameter("docId");
		String closetime = request.getParameter("closetime");
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		
		boolean iscanback = this.docSendDealMgr.isCanRollBack(docId,closetime);
		if (iscanback)
			this.docSendDealMgr.docSendRollBack(docId,user);
			
		return new ActionForward("/docSendRelatedAction.do?method=docSendList&type=2");
	}

	/**
	 * <p>Decription:ѡ�����쵼</p>
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public ActionForward toDeptLeader(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TbUser user = getCurrentUser(request);
		//ѡ���û��б�
		List userList = this.docSendDealMgr.findUserByRoleList(IDocSendDealMgr.DEPTLEADER,user);
		request.setAttribute("userList", userList);
		return mapping.findForward("chargerLeader");
	}

	/**
	 * <p>Decription:�鿴ֻ��ҳ��</p>
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-8-18</p>
	 */
	public ActionForward docSendView(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String docId = request.getParameter("docId");
		TbDocSend item = docSendMgr.findById(docId);
		setBaseInfo((DynaActionForm) form,null,item);
		putCommonInfo(request,item);
		return mapping.findForward("docSendView");
	}
	/*���Ļ��ء����͡�����*/
	public ActionForward deptSel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		List deptList = this.docSendDealMgr.findDeptList(type);
		request.setAttribute("deptList", deptList);
		return mapping.findForward("deptSel");
	}
	/*�����*/
	public ActionForward mainTitle(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List areatypelist = this.docSendDealMgr.findTypeList(AREA_TYPE);
		List leibieciList = this.docSendDealMgr.findTypeList(LEI_TYPE);
		List leishuciList = this.docSendDealMgr.findTypeList(LEISHU_CI);
		List gongwenTypeList = this.docSendDealMgr.findGongWenTypeList(GONGWEN_TYPE);
		
		request.setAttribute("areatypelist", areatypelist);
		request.setAttribute("leibieciList", leibieciList);
		request.setAttribute("leishuciList", leishuciList);
		request.setAttribute("gongwenTypeList", gongwenTypeList);
		
		return mapping.findForward("mainTitle");
	}

	/*����*/
	public ActionForward turnback(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String docId = request.getParameter("docId");
		request.setAttribute("fileTitle", docSendMgr.findById(docId).getFileTitle());
		request.setAttribute("sclzdList", docSendMgr.findClosedControl(docId));
		return mapping.findForward("turnback");
	}
}