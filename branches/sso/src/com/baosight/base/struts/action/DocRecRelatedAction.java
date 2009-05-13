package com.baosight.base.struts.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.baosight.base.service.IDocServiceMgr;
import com.baosight.base.service.ITbDocRecMgr;
import com.baosight.mode.TbDocControl;
import com.baosight.mode.TbDocRec;
import com.baosight.mode.TbDocUrgent;
import com.baosight.mode.TbUser;

public class DocRecRelatedAction extends DocActionHelper {
	
	/* �Ϻ���ˮ����Ϣ���Ĺ��Ĵ������鿴�� */
/*	public ActionForward receiveDocView(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");	
		
		TbDocRec docRec = this.docRecListMgr.findReceiveDocById(docId);
		
		request.setAttribute("docRec", docRec);
		
		return mapping.findForward("receiveDocView");
	}
*/

	/* �Ϻ���ˮ����Ϣ���Ĺ��Ĵ������鿴�� */
	public ActionForward receiveDocView(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String docId = request.getParameter("docId");
		TbDocRec item = null;
		item = tbDocRecMgr.findById(docId);
		setBaseInfo((DynaActionForm) form, item, null);
		request.setAttribute("archiveTypeList", docServiceMgr.findAllArchiveType());
		request.setAttribute("infoLevelList", tbDocRecMgr.findAllInfoLevel());
		request.setAttribute("files", docAttachMgr.findByIdAndType(item.getId(), IDocServiceMgr.UPLOAD_TYPE_DOC));
		request.setAttribute("isUrgent", String.valueOf(item.getUrgentFlag()));
		request.setAttribute("sclzdList", docRecListMgr.findSCLZDById(docId));
		return mapping.findForward("receiveDocView");
	}

	/* �����ת�� */
	public ActionForward lcljdRollBack(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");	
		
		List sclzdList = this.docRecListMgr.findSCLZDById(docId);
		
		request.setAttribute("sclzdList", sclzdList);
		
		return mapping.findForward("lcljd");
	}
	
	/* �߰�֪ͨ */
	public ActionForward argueNoticeInput(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");	
		
		List userList = this.docRecListMgr.findPersonByDocId(docId);//�ұ��߰�������
		
		request.setAttribute("userList", userList);
		
		return mapping.findForward("argueNotice");
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
		return mapping.findForward("argueSuccess");
	}
	//��ʱʱ��
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

	
	/**
	 * <p>Decription:���ı��쵼ѡ��</p>
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public ActionForward selDealUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String docId = request.getParameter("docId"); 
		TbDocControl bookControl = tbDocRecMgr.findBookControl(docId);
		TbUser user = userMgr.find(bookControl.getUserId());
		//ѡ���û��б�
		List userList = docServiceMgr.findUserByRoleList(IDocServiceMgr.ROLE_ID_LEADER,user);
		request.setAttribute("userList", userList);
		return mapping.findForward("chargerLeader");
	}

	/* ȡ�� */
	public ActionForward giveback(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String docId = request.getParameter("docId");
		TbUser user = getCurrentUser(request);
		List controls = tbDocRecMgr.findNotClosedControl(docId,ITbDocRecMgr.STATE_TYPE_OTHER);
		//�����δ���������¼������ȡ��
		if(controls!=null && !controls.isEmpty()){
			request.setAttribute("messageString", "���δ��ɻ򱻲��أ�ȡ��ʧ�ܣ�");
		}else{
			List nexts = tbDocRecMgr.findDisposeNext(docId);
			boolean canBack = true;
			for(Object obj : nexts){
				TbDocControl control = (TbDocControl) obj;
				if(ITbDocRecMgr.STATE_CLOSED.equals(control.getState())
						|| ITbDocRecMgr.STATE_DISPOSING.equals(control.getState())){
					canBack = false;
					request.setAttribute("messageString", "��������������ȡ��ʧ�ܣ�");
					break;
				}
			}
			if(canBack){
				for(Object obj : nexts){
					tbDocRecMgr.deleteControl((TbDocControl) obj);
					tbUserOpeationMgr.SaveOrUpdate(((TbDocControl)obj).getUserId(),"300","minus");
				}
				//�½�һ���������
				java.sql.Date nowTime = new java.sql.Date(System.currentTimeMillis());
				TbDocRec item = tbDocRecMgr.findById(docId);
				TbDocControl control = new TbDocControl();
				control.setCreateTime(nowTime);
				control.setInputTime(nowTime);
				control.setState(ITbDocRecMgr.STATE_DISPOSING);
				control.setStateName(ITbDocRecMgr.STATE_NAME_DISPOSE);
				control.setStateType(ITbDocRecMgr.STATE_TYPE_OTHER);
				control.setTbDocRec(item);
				control.setUserId(user.getId());
				control.setUserName(user.getName());
				tbDocRecMgr.saveControl(control);
				tbUserOpeationMgr.SaveOrUpdate(control.getUserId(),"301","add");
				item.setDocState(ITbDocRecMgr.STATE_NAME_DISPOSE);
				tbDocRecMgr.save(item);
				request.setAttribute("messageString", "ȡ�سɹ���");
			}
		}
		return mapping.findForward("disposingList");
	}
}