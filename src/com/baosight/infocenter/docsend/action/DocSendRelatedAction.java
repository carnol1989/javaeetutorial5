package com.baosight.infocenter.docsend.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.baosight.infocenter.docsend.mode.TbDocSendXxzx;
import com.baosight.infocenter.docsend.service.IDocSendDealMgr;
import com.baosight.mode.TbUser;

public class DocSendRelatedAction extends DocSendHelper {
	
	private static final String NEW_GETING = "1";//1���յ��ķ���
	private static final String DOING = "2";     //2���ڴ���ķ���

	//�����б�
	public ActionForward docSendList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		String type = (String)request.getParameter("type");
		
		List list = new ArrayList();
		if ("newAndDoing".equals(type)) {
			List list1 = this.docSendDealXxzxMgr.findDocSendList(user,NEW_GETING);//1���յ��ķ���
			List list2 = this.docSendDealXxzxMgr.findDocSendList(user,DOING);//2���ڴ���ķ���
			
			if (list1!=null)
				list.addAll(list1);
			if (list2!=null)
				list.addAll(list2);
			request.setAttribute("size1", list1!=null?list1.size():0);
			request.setAttribute("size2", list2!=null?list2.size():0);
		}
		else {	
			list = this.docSendDealXxzxMgr.findDocSendList(user,type);
		}
		//request.setAttribute("list", list);
		request.setAttribute("type", type);
		startPaging(list, null, request);
		return mapping.findForward("docSendList");
	}

	/*����ݵķ���ɾ��*/
	public ActionForward delSendDoc (ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");
		
		this.docSendDealXxzxMgr.deleteSendDoc(docId);
		
		return new ActionForward("/xdocSendRelatedAction.do?method=docSendList&type=3");
	}
	/* �߰�֪ͨ */
	public ActionForward argueNoticeInput(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String docId = request.getParameter("docId");	
		//String docTitle = request.getParameter("docTitle");
		
		List userList = this.docSendDealXxzxMgr.findPersonByDocId(docId);//�ұ��߰�������
		
		request.setAttribute("userList", userList);
		
		return mapping.findForward("argueNoticeS");
	}

	/* ȡ�� */
	public ActionForward rollBack(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String docId = request.getParameter("docId");
		String closetime = request.getParameter("closetime");
		TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
		
		boolean iscanback = this.docSendDealXxzxMgr.isCanRollBack(docId,closetime);
		if (iscanback)
			this.docSendDealXxzxMgr.docSendRollBack(docId,user);
			
		return new ActionForward("/xdocSendRelatedAction.do?method=docSendList&type=2");
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
		List userList = this.docSendDealXxzxMgr.findUserByRoleList(IDocSendDealMgr.DEPTLEADER,user);
		request.setAttribute("userList", userList);
		return mapping.findForward("chargerLeader");
	}

	/**
	 * <p>Decription:ѡ���쵼</p>
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @author heaton.cai
	 * <p>Create Time:2008-9-25</p>
	 */
	public ActionForward toLeader(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//ѡ���û��б�
		List userList = this.docSendDealXxzxMgr.findUserByRoleList(IDocSendDealMgr.LEADER,null);
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
		TbDocSendXxzx item = docSendMgr.findById(docId);
		setBaseInfo((DynaActionForm) form,null,item);
		putCommonInfo(request,item);
		return mapping.findForward("docSendView");
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