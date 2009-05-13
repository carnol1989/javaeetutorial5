package com.baosight.base.struts.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.base.dao.impl.TbUserDAOImpl;
import com.baosight.base.service.ITbConsultationOnlineMgr;
import com.baosight.base.service.ITbPublicAffairTransactMgr;
import com.baosight.mode.TbConsultationOnline;
import com.baosight.mode.TbPublicAffairTransact;
import com.baosight.mode.TbUser;
import com.baosight.struts.action.BaseDispatchAction;
public class ConsultationViewAction extends BaseDispatchAction {
	
	//������������(10 ������ѯ)
	final Long affairType= new Long(10);
	private ITbConsultationOnlineMgr tbConsultationOnlineMgr;
	private ITbPublicAffairTransactMgr tbPublicAffairTransactMgr;
	
	//ר��(���쵼����)ҳ��
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
			String id = request.getParameter("id");
			request.setAttribute("type",  request.getParameter("type"));
			//��ת�༭ҳ�����úý�Ҫ�޸ĵ��ֶ�
			String tbConsultationOnlineID=this.tbPublicAffairTransactMgr.findById(id).getAffairId();
			TbConsultationOnline tbConsultationOnline=this.tbConsultationOnlineMgr.findById(tbConsultationOnlineID);
			((DynaValidatorForm) form).set("id", id);
			((DynaValidatorForm) form).set("asker",tbConsultationOnline.getAsker());
			((DynaValidatorForm) form).set("askerEmail",tbConsultationOnline.getAskerEmail());
			((DynaValidatorForm) form).set("askerPhone",tbConsultationOnline.getAskerPhone());
			((DynaValidatorForm) form).set("Subject",tbConsultationOnline.getSubject());
			((DynaValidatorForm) form).set("content",tbConsultationOnline.getContent());
			((DynaValidatorForm) form).set("response",tbConsultationOnline.getResponse());
			
			List tbPublicAffairTransacts = tbPublicAffairTransactMgr.getPublicAffairTransactById(tbConsultationOnlineID, affairType,new Long(request.getParameter("type")));
			System.out.println("tbPublicAffairTransacts.size"+tbPublicAffairTransacts.size());
			request.setAttribute("publicAffairTransacts",tbPublicAffairTransacts);
			return mapping.findForward("view");
	}
	
	//��������ҳ��
	public ActionForward viewCenter(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
			String id = request.getParameter("id");
			
			//��ת�༭ҳ�����úý�Ҫ�޸ĵ��ֶ�
			TbConsultationOnline tbConsultationOnline=this.tbConsultationOnlineMgr.findById(id);
			((DynaValidatorForm) form).set("id", id);
			((DynaValidatorForm) form).set("asker",tbConsultationOnline.getAsker());
			((DynaValidatorForm) form).set("askerEmail",tbConsultationOnline.getAskerEmail());
			((DynaValidatorForm) form).set("askerPhone",tbConsultationOnline.getAskerPhone());
			((DynaValidatorForm) form).set("Subject",tbConsultationOnline.getSubject());
			((DynaValidatorForm) form).set("content",tbConsultationOnline.getContent());
			((DynaValidatorForm) form).set("response",tbConsultationOnline.getResponse());

			List tbPublicAffairTransacts = tbPublicAffairTransactMgr.getPublicAffairTransactById(id, affairType,new Long(0));
			request.setAttribute("publicAffairTransacts",tbPublicAffairTransacts);
			return mapping.findForward("view");
	}
	/*
	 * ������ѯ �ύ
	 */
 	public ActionForward submitviewCenter(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
 		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("SYSTEM_USER_SESSION");
		String userId = user.getId();
		String userName =user.getName();
		
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		if (StringUtils.isNotBlank(action)) {
			String responseText = "";
			if(null!=((DynaValidatorForm) form).get("response")){
				responseText = (String) ((DynaValidatorForm) form).get("response");
			} 
			String transactor = "";
			if(action.equals("zb"))
				transactor = (String) ((DynaValidatorForm) form).get("ZB");
			else if(action.equals("idea"))
				transactor = (String) ((DynaValidatorForm) form).get("IDEA");
			//ר��
			if(action.equals("zb")){
				TbConsultationOnline  tbConsultationOnline = tbConsultationOnlineMgr.findById(id);
				tbConsultationOnline.setResponse(responseText);
				tbConsultationOnline.setStatus(new Long(200));
				tbConsultationOnlineMgr.update(tbConsultationOnline);
				
				TbPublicAffairTransact tbPublicAffairTransact=new TbPublicAffairTransact();
				tbPublicAffairTransact.setAffairId(tbConsultationOnline.getId());
				tbPublicAffairTransact.setTransactor(transactor);
				tbPublicAffairTransact.setBeforeTransactor(userId);
				tbPublicAffairTransact.setReceiveTime(new Date());
				tbPublicAffairTransact.setStatus(new Long(0));
				tbPublicAffairTransact.setType(new Long(20));
				tbPublicAffairTransact.setCommenta(" ");
				tbPublicAffairTransact.setAffairType(affairType);
				tbPublicAffairTransactMgr.save(tbPublicAffairTransact);
				
				super.tbUserOpeationMgr.SaveOrUpdate("","10","minus");
				super.tbUserOpeationMgr.SaveOrUpdate(transactor,"100","add");//ת�������ˣ�������ר����Ҫ��1				
			}
			//����
			else if(action.equals("save")){
				TbConsultationOnline  tbConsultationOnline = tbConsultationOnlineMgr.findById(id);
				tbConsultationOnline.setResponse(responseText);
				tbConsultationOnlineMgr.update(tbConsultationOnline);
			}
			//��
			else if(action.equals("reply")){
				TbConsultationOnline  tbConsultationOnline = tbConsultationOnlineMgr.findById(id);
				tbConsultationOnline.setResponse(responseText);
				tbConsultationOnline.setResponseTime(new Date());
				tbConsultationOnline.setStatus(new Long(300));
				tbConsultationOnline.setResponseor(userName);
				tbConsultationOnlineMgr.update(tbConsultationOnline);
				
				super.tbUserOpeationMgr.SaveOrUpdate("","10","minus");
			}
			//��ѯ���
			else if(action.equals("idea")){
				TbConsultationOnline  tbConsultationOnline = tbConsultationOnlineMgr.findById(id);
				tbConsultationOnline.setResponse(responseText);
				tbConsultationOnline.setStatus(new Long(200));
				tbConsultationOnlineMgr.update(tbConsultationOnline);
				
				TbPublicAffairTransact tbPublicAffairTransact=new TbPublicAffairTransact();
				tbPublicAffairTransact.setAffairId(tbConsultationOnline.getId());
				tbPublicAffairTransact.setTransactor(transactor);
				tbPublicAffairTransact.setBeforeTransactor(userId);
				tbPublicAffairTransact.setReceiveTime(new Date());
				tbPublicAffairTransact.setStatus(new Long(0));
				tbPublicAffairTransact.setType(new Long(10));
				tbPublicAffairTransact.setAffairType(affairType);
				tbPublicAffairTransact.setCommenta(" ");
				tbPublicAffairTransactMgr.save(tbPublicAffairTransact);
				
				super.tbUserOpeationMgr.SaveOrUpdate("","10","minus");
				super.tbUserOpeationMgr.SaveOrUpdate(transactor,"101","add");//ת�������ˣ������˴��쵼������Ҫ��1
			}
		}
		
		return mapping.findForward(action); 
	}
 	/*
	 * ������ѯ��ר�졢�����ѯ�� �ύ
	 */
	public ActionForward submitview(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
 		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("SYSTEM_USER_SESSION");
		String userId = user.getId();
		String userName =user.getName();
		
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String action = request.getParameter("action");
		
		String actionForwardOther="/consultationWaitListAction.do?method=list&type="+type;
		String actionForwardReply="/consultationOverListAction.do?method=list&type="+type;
		if (StringUtils.isNotBlank(action)) {
			String responseText = "";
			if(null!=((DynaValidatorForm) form).get("response")){
				responseText = (String) ((DynaValidatorForm) form).get("response");
			} 
			String transactor = "";
			if(action.equals("zb"))
				transactor = (String) ((DynaValidatorForm) form).get("ZB");
			else if(action.equals("idea"))
				transactor = (String) ((DynaValidatorForm) form).get("IDEA");
			//ר��
			if(action.equals("zb")){
				TbPublicAffairTransact  tbPublicAffairTransactUpdate = this.tbPublicAffairTransactMgr.findById(id);
				tbPublicAffairTransactUpdate.setCommenta(responseText);
				tbPublicAffairTransactUpdate.setFinisheTime(new Date());
				tbPublicAffairTransactUpdate.setStatus(new Long(100));
				tbPublicAffairTransactMgr.update(tbPublicAffairTransactUpdate);
			
				TbPublicAffairTransact tbPublicAffairTransactNew=new TbPublicAffairTransact();
				tbPublicAffairTransactNew.setAffairId(tbPublicAffairTransactUpdate.getAffairId());
				tbPublicAffairTransactNew.setTransactor(transactor);
				tbPublicAffairTransactNew.setReceiveTime(new Date());
				tbPublicAffairTransactNew.setStatus(new Long(0));
				tbPublicAffairTransactNew.setType(new Long(20));
				tbPublicAffairTransactNew.setAffairType(affairType);
				tbPublicAffairTransactNew.setCommenta(" ");
				tbPublicAffairTransactMgr.save(tbPublicAffairTransactNew);
				
				if(type.equals("10")){ //��ר��תΪר��
					super.tbUserOpeationMgr.SaveOrUpdate(userId,"101","minus");
				}else if(type.equals("20")){//�ɴ��쵼����תΪר��
					super.tbUserOpeationMgr.SaveOrUpdate(userId,"100","minus");
				}
				super.tbUserOpeationMgr.SaveOrUpdate(transactor,"100","add");//ת�������ˣ�������ר����Ҫ��1		
				
				return new ActionForward(actionForwardOther);						
			}
			//����
			else if(action.equals("save")){
				TbPublicAffairTransact  tbPublicAffairTransact = this.tbPublicAffairTransactMgr.findById(id);
				tbPublicAffairTransact.setCommenta(responseText);
				tbPublicAffairTransactMgr.update(tbPublicAffairTransact);
				return new ActionForward(actionForwardOther);
			}
			//��
			else if(action.equals("reply")){
				TbPublicAffairTransact  tbPublicAffairTransact = this.tbPublicAffairTransactMgr.findById(id);
				tbPublicAffairTransact.setCommenta(responseText);
				tbPublicAffairTransact.setFinisheTime(new Date());
				tbPublicAffairTransact.setStatus(new Long(100));
				tbPublicAffairTransactMgr.update(tbPublicAffairTransact);
				
				if(type.equals("10")){ //��ר��״̬��
					super.tbUserOpeationMgr.SaveOrUpdate(userId,"101","minus");
				}else if(type.equals("20")){//�ɴ��쵼����״̬��
					super.tbUserOpeationMgr.SaveOrUpdate(userId,"100","minus");
				}
				return new ActionForward(actionForwardReply);
			}
			//��ѯ���
			else if(action.equals("idea")){
				TbPublicAffairTransact  tbPublicAffairTransactUpdate = this.tbPublicAffairTransactMgr.findById(id);
				tbPublicAffairTransactUpdate.setCommenta(responseText);
				tbPublicAffairTransactUpdate.setFinisheTime(new Date());
				tbPublicAffairTransactUpdate.setStatus(new Long(100));
				tbPublicAffairTransactMgr.update(tbPublicAffairTransactUpdate);
			
				TbPublicAffairTransact tbPublicAffairTransactNew=new TbPublicAffairTransact();
				tbPublicAffairTransactNew.setAffairId(tbPublicAffairTransactUpdate.getAffairId());
				tbPublicAffairTransactNew.setTransactor(transactor);
				tbPublicAffairTransactNew.setReceiveTime(new Date());
				tbPublicAffairTransactNew.setStatus(new Long(0));
				tbPublicAffairTransactNew.setType(new Long(10));
				tbPublicAffairTransactNew.setAffairType(affairType);
				tbPublicAffairTransactNew.setCommenta(" ");
				tbPublicAffairTransactMgr.save(tbPublicAffairTransactNew);
				
				if(type.equals("10")){ //��ԭ��ר��״̬ת
					super.tbUserOpeationMgr.SaveOrUpdate(userId,"101","minus");
				}else if(type.equals("20")){//��ԭ�����쵼����״̬ת
					super.tbUserOpeationMgr.SaveOrUpdate(userId,"100","minus");
				}
				super.tbUserOpeationMgr.SaveOrUpdate(transactor,"101","add");//ת�������ˣ������˴��쵼������Ҫ��1
				return new ActionForward(actionForwardOther);	
			}
		}
		return null; 
	
	}
	
	public void setTbConsultationOnlineMgr(
			ITbConsultationOnlineMgr tbConsultationOnlineMgr) {
		this.tbConsultationOnlineMgr = tbConsultationOnlineMgr;
	}

	public void setTbPublicAffairTransactMgr(
			ITbPublicAffairTransactMgr tbPublicAffairTransactMgr) {
		this.tbPublicAffairTransactMgr = tbPublicAffairTransactMgr;
	}




	
}
