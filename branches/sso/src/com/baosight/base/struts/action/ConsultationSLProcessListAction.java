package com.baosight.base.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.baosight.base.service.ITbConsultationOnlineMgr;
import com.baosight.struts.action.BaseDispatchAction;

public class ConsultationSLProcessListAction extends BaseDispatchAction {
	public ITbConsultationOnlineMgr tbConsultationOnlineMgr;

	public void setTbConsultationOnlineMgr(
			ITbConsultationOnlineMgr tbConsultationOnlineMgr) {
		this.tbConsultationOnlineMgr = tbConsultationOnlineMgr;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List consultationSLProcessList = null;
		String subject = request.getParameter("subject");
		if (subject == null) {
			subject = "";
		}
		long count=0;
		consultationSLProcessList = this.tbConsultationOnlineMgr
				.findConsultationSLProcessList(subject);
		count=consultationSLProcessList.size();
		startPagingCount(null, request,count);
		startPaging(consultationSLProcessList, null, request);
		return mapping.findForward("consultationslprocesslist");
	}
}
