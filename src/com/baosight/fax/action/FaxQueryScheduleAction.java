package com.baosight.fax.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.baosight.base.struts.action.DocAttachAction;
import com.baosight.fax.bean.ListSearchBean;
import com.baosight.fax.mode.TbFaxSchedule;
import com.baosight.fax.service.QueryScheduleMgr;
import com.baosight.fax.service.ScheduleMgr;
import com.baosight.struts.action.BaseDispatchAction;

public class FaxQueryScheduleAction extends BaseDispatchAction{
	private QueryScheduleMgr queryScheduleMgr;
	private ScheduleMgr scheduleMgr;
	protected DocAttachAction attachAction;
	
	public void setQueryScheduleMgr(QueryScheduleMgr queryScheduleMgr) {
		this.queryScheduleMgr = queryScheduleMgr;
	}
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String state = request.getParameter("state");
		
		//��ѯ����
		ListSearchBean searchBean = new ListSearchBean();
		searchBean.setState(state.toString());
		searchBean.setStartTime(request.getParameter("startTime"));
		searchBean.setEndTime(request.getParameter("endTime"));
		searchBean.setFaxNum(request.getParameter("faxNum"));
		searchBean.setSendDeptId(request.getParameter("sendDeptId"));
		searchBean.setSender(request.getParameter("sender"));
		
		List alllist = queryScheduleMgr.findListByCondition("all",searchBean);//����������ѯ����ľ�������
		List deptNamelist = queryScheduleMgr.findListByCondition("deptNamelist",new ListSearchBean());//��÷��Ͳ�������
		List senderlist = queryScheduleMgr.findListByCondition("senderlist",new ListSearchBean());//��÷����˲�������
		
		request.setAttribute("deptNamelist", deptNamelist);
		request.setAttribute("senderlist", senderlist);
		
		request.setAttribute("sendDeptId", request.getParameter("sendDeptId"));
		request.setAttribute("sender", request.getParameter("sender"));
		
		//��ҳ
		long count=alllist.size();	
		startPaging(alllist, null, request);
		startPagingCount(null, request,count);
		
		return mapping.findForward("list");
	}
	
	/*
	 * �ط�����
	 */
	public ActionForward insert(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String state=request.getParameter("state");
		TbFaxSchedule instance = queryScheduleMgr.findById(id);
		TbFaxSchedule item = new TbFaxSchedule(instance.getContent(),instance.getSenddate(),instance.getSender(),
				instance.getSenderid(), instance.getFax(),instance.getSendtype(),"001",
				instance.getRecman(), instance.getRecgroupid(), instance.getRecgroupid(),
				instance.getSenddeptid(), instance.getFaxflag(), instance.getFileName());
		
		scheduleMgr.save(item);
		
		return new ActionForward("/faxQuerySchedule.do?method=list&state="+state);
	}
	
	public void setScheduleMgr(ScheduleMgr scheduleMgr) {
		this.scheduleMgr = scheduleMgr;
	}
	
	/*
	 * �򿪴�������
	 */
	protected DocAttachAction getAttachAction(){
		if(attachAction==null){
			attachAction = new DocAttachAction();
			attachAction.setDocAttachMgr(docAttachMgr);
			attachAction.setServlet(this.getServlet());
		}
		return attachAction;		
	}
	
	/*
	 * �Է�ҳ���ܵ���д����ҳ��Ҫ���������ݿ���в��list��ֵ��
	 * @see com.baosight.struts.action.BaseDispatchAction#movePage(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward movePage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List deptNamelist = queryScheduleMgr.findListByCondition("deptNamelist",new ListSearchBean());
		List senderlist = queryScheduleMgr.findListByCondition("senderlist",new ListSearchBean());
		
		request.setAttribute("deptNamelist", deptNamelist);
		request.setAttribute("senderlist", senderlist);
		
		request.setAttribute("sendDeptId", request.getParameter("sendDeptId"));
		request.setAttribute("sender", request.getParameter("sender"));
		
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
		startPagingCount(sessionID, request,count);
		startPaging(res, sessionID, request);

		return mapping.findForward("trunToPage");
	}
	public ActionForward resetPageSize(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List deptNamelist = queryScheduleMgr.findListByCondition("deptNamelist",new ListSearchBean());
		List senderlist = queryScheduleMgr.findListByCondition("senderlist",new ListSearchBean());
		
		request.setAttribute("deptNamelist", deptNamelist);
		request.setAttribute("senderlist", senderlist);
		
		request.setAttribute("sendDeptId", request.getParameter("sendDeptId"));
		request.setAttribute("sender", request.getParameter("sender"));
		
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
		startPagingCount(sessionID, request,count);
		startPaging(res, sessionID, request);
		return mapping.findForward("trunToPage");
	}
}
