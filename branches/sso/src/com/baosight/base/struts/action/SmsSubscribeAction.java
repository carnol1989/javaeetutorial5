/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.baosight.base.struts.action;
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

import com.baosight.mode.TbSmsSubscribe;
import com.baosight.struts.action.BaseDispatchAction;

/**
 * MyEclipse Struts Creation date: 10-08-2008
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/smsSubscribe" name="smsSubscribeForm"
 *                input="/WEB-INF/web/jsp/smsSubscribe.jsp" scope="request"
 *                validate="true"
 */
public class SmsSubscribeAction extends BaseDispatchAction {
	
	public ActionForward executeSave(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TbSmsSubscribe scribe = new TbSmsSubscribe();
		// �û�ID
		String userId = request.getParameter("usernameId");
		String oneUserId[] = userId.split(",");

		// ��ĿID(SMS_SUBJECT.id)
		String subjectId = request.getParameter("subjectnameId");
		
		//String subjectnameOptionalId = request
				//.getParameter("subjectnameOptionalId");// ���Ŀ�ѡ��Ŀid
		String oneSubjectId[] = (subjectId).split(",");
		// �ֻ���
		String userPhone = request.getParameter("userPhone");
		String[] oneUserPhone = userPhone.split(",");

		// �û�����
		String username = request.getParameter("username");
		String[] oneUserName = username.split(",");

		// ������Ŀ
		String subjectname = request.getParameter("subjectname");
		
		//String subjectnameOptional = request
			//	.getParameter("subjectnameOptional");// ���Ŀ�ѡ��Ŀ
//		StringBuilder builder = new StringBuilder().append(subjectname);
//		if(subjectnameOptional!=null && !"".equals(subjectnameOptional)){
//			builder.append(","+subjectnameOptional+",");
//		}
		String[] oneSubjectName = subjectname.split(",");
				
		
		//��Ŀ����
		String subjectnameType = request.getParameter("subjectnameType");
//		String subjectnameOptionalType = request.getParameter("subjectnameOptionalType");
		String[] oneSubjectNameType1 =(subjectnameType).split(",");
		//����2
		String subjectFeeTypeId = request.getParameter("subjectFeeTypeId");
		//String subjectOptionalFeeTypeId = request.getParameter("subjectOptionalFeeTypeId");
		//System.out.println("========="+subjectFeeTypeId+subjectOptionalFeeTypeId);
		
		String[] oneFeeTypeId =(subjectFeeTypeId).split(",");
		//����Id
		String departId = request.getParameter("departId");
		String[] oneDepartId = departId.split(",");
		
		String infoType = request.getParameter("infoType");
		String[] oneInfoType = infoType.split(",");
		Date daTime = new Date();
		int hours = daTime.getHours();
		int minutes = daTime.getMinutes();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String subTime = sdf.parse(daTime.toLocaleString());
		for (int i = 0; i < oneUserId.length; i++) {
			for (int j = 0; j < oneSubjectId.length; j++) {
				scribe.setUserid(oneUserId[i]);
				scribe.setSubjectid(oneSubjectId[j]);
				if(!"".equals(oneUserPhone[i])){
				scribe.setMobileNum(Long.parseLong(oneUserPhone[i]));
				}
				scribe.setUsername(oneUserName[i]);
				scribe.setSubjectname(oneSubjectName[j]);
				scribe.setInfofeeType(oneInfoType[j]);
				scribe.setSubstime(hours+"-"+minutes);
				scribe.setSubjecttype1(oneSubjectNameType1[j]);
				if(oneFeeTypeId.length>1){
				 scribe.setSubjecttype2(oneFeeTypeId[j]);
				}
				scribe.setDepartid(oneDepartId[i]);
				this.smsSubscribeMgr.save(scribe);
			}
		}
		return  executeInput(mapping,form,request,response);
	}

	public ActionForward executeInput(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm dy = (DynaActionForm) form;
		/*HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("SYSTEM_USER_SESSION");
		List commList = this.commonalityCommMgr.findByCommType(user
		.getUserdept(), "comm");*/
		String stateType = request.getParameter("stateType");
		/*List commList  = commonalityCommMgr.findAll();
		Collection<LabelValueBean> collCommList = new LinkedList<LabelValueBean>();
		for (int i = 0; i < commList.size(); i++) {
			TbCommonalityComm tbcc = (TbCommonalityComm) commList.get(i);
			collCommList.add(new LabelValueBean(tbcc.getName(),tbcc.getId()));
		}
		dy.set("collCommList", collCommList);
		dy.set("commDepartList", dy.getString("commDepartList"));*/
		// ��ʼ����ѯ����
		TbSmsSubscribe scribe = new TbSmsSubscribe();
		scribe.setDepartid(dy.getString("commDepartList"));
		scribe.setUsername(request.getParameter("userNameLike"));
		scribe.setSubjectname(request.getParameter("content"));
		List list = this.smsSubscribeMgr.findJoinDepart(scribe);
		long count=list.size();
		startPagingCount(null, request,count);
		startPaging(list, null, request);
		/*request.setAttribute("commDepartListName", request.getParameter("commDepartListName"));
		request.setAttribute("userNameLike", request.getParameter("userNameLike"));
		request.setAttribute("content", request.getParameter("content"));*/
		if("delete".equals(stateType)){
			return mapping.findForward("deleteSmsSubscribe");
		}else{
			return mapping.findForward("inputSmsSubscribe");
		}
		
	}
	/**
	 * ��̬����
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward executeLinkA(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String subjectState = request.getParameter("subjectState");
		String remark = request.getParameter("remark");
		List sujectList = this.smsSubjectMgr.findAllSuject(subjectState);
		request.setAttribute("sujectList", sujectList);
		request.setAttribute("remark", remark);
		request.setAttribute("subjectState", subjectState);
		return mapping.findForward("inputSmsSubject");
	}
	public ActionForward selectSubjectName(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String subjectFlag = request.getParameter("subjectFlag");
		List sujectList = this.smsSubjectMgr.findAllSuject(subjectFlag);
		request.setAttribute("sujectList", sujectList);
		request.setAttribute("subjectFlag", subjectFlag);
		return mapping.findForward("inputSubjectName");
	}
	public ActionForward executeDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String[] deleteId = request.getParameterValues("deleteId");
		TbSmsSubscribe tb = new TbSmsSubscribe();
		if(deleteId!=null){
		for(String itemId : deleteId){
			tb.setId(itemId);
			smsSubscribeMgr.delete(tb);
		}
		}
		return executeInput(mapping,form,request,response);
	}
	
	public ActionForward movePageCur(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm dy = (DynaActionForm) form;
		/*List commList  = commonalityCommMgr.findAll();
		Collection<LabelValueBean> collCommList = new LinkedList<LabelValueBean>();
		for (int i = 0; i < commList.size(); i++) {
			TbCommonalityComm tbcc = (TbCommonalityComm) commList.get(i);
			collCommList.add(new LabelValueBean(tbcc.getName(),tbcc.getId()));
		}
		dy.set("collCommList", collCommList);*/
		// ���Ȼ��SESSIONID
		String sessionID = request.getParameter("sessionID");
		if (sessionID == null || sessionID.trim().length() < 5)
			sessionID = "Page_" + System.currentTimeMillis();

		HttpSession session = request.getSession();

		// ת��
		try {
			setMoveTo(Integer.parseInt(request.getParameter("moveTo")));
		} catch (NumberFormatException ex) {

		}

		List res = (List) session.getAttribute(sessionID);

		try {
			setCurPage((Integer) session.getAttribute(sessionID + "No"));
		} catch (NumberFormatException ex) {

		}

		try {
			setMaxPage((Integer) session.getAttribute(sessionID + "MaxNo"));
		} catch (NumberFormatException ex) {

		}

		try {
			setPageSize((Integer) session.getAttribute(sessionID + "Size"));
		} catch (NumberFormatException ex) {

		}

		if (getMoveTo() < 0 || getMoveTo() >= getMaxPage())
			setMoveTo(0);
		long count=0;
		try{
			count=(Long)session.getAttribute(sessionID+"Count");
		}catch(NumberFormatException ex){
			
		}
		setCurPage(getMoveTo());
		startPagingCount(null, request,count);
		startPaging(res, sessionID, request);
		String stateType = request.getParameter("stateType");
		if("delete".equals(stateType)){
			return new ActionForward("/WEB-INF/web/jsp/subscription/subscribeDelete.jsp");
		}else{
			return mapping.findForward("trunToPage");
		}
		
	}
	public ActionForward resetPageSizeCur(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm dy = (DynaActionForm) form;
		/*List commList  = commonalityCommMgr.findAll();
		Collection<LabelValueBean> collCommList = new LinkedList<LabelValueBean>();
		for (int i = 0; i < commList.size(); i++) {
			TbCommonalityComm tbcc = (TbCommonalityComm) commList.get(i);
			collCommList.add(new LabelValueBean(tbcc.getName(),tbcc.getId()));
		}
		dy.set("collCommList", collCommList);*/
		// ���Ȼ��SESSIONID
		String sessionID = request.getParameter("sessionID");

		HttpSession session = request.getSession();

		// ת��
		setMoveTo(0);

		List res = (List) session.getAttribute(sessionID);

		setCurPage(0);

		try {
			setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		} catch (NumberFormatException ex) {

		}
		long count=0;
		try{
			count=(Long)session.getAttribute(sessionID+"Count");
		}catch(NumberFormatException ex){
			
		}
		startPagingCount(null, request,count);
		startPaging(res, sessionID, request);
		String stateType = request.getParameter("stateType");
		if("delete".equals(stateType)){
			return new ActionForward("/WEB-INF/web/jsp/subscription/subscribeDelete.jsp");
		}else{
			return mapping.findForward("trunToPage");
		}
		
	}
}