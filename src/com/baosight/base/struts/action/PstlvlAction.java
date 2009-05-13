package com.baosight.base.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.mode.TbPstlvl;
import com.baosight.struts.action.BaseDispatchAction;

/**
 * ְ��ȼ�����Action �ṩ��ְ��ȼ�ʵ�����ɾ�Ĳ�
 * 
 * @author ytr
 * 
 */
public class PstlvlAction extends BaseDispatchAction {

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List allPstlvl = this.pstlvlMgr.findAll();
		request.setAttribute("allpstlvl", allPstlvl);
		return mapping.findForward("list");
	}

	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		if (action != null && action.equals("submit")) {

			// ��ְ���޸ĺ������
			String name = (String) ((DynaValidatorForm) form).get("name");
			String code = (String) ((DynaValidatorForm) form).get("code");

			TbPstlvl item = this.pstlvlMgr.find(id);
			// ��ְ��ԭ����ְ������
			String oldname = item.getName();

			item.setCode(code);
			// ��ְ���޸ĺ������
			item.setName(name);

			// this.pstlvlMgr.update(item);

			// ְ��(tb_pstlvl)�ȼ��޸�ʱ��������ԭname,��tb_pst���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼,������Щ��¼��lvl�ֶ�ֵ����Ϊ��name
			this.pstlvlMgr.updateMore(item, oldname);

			return mapping.findForward("success");
		} else {
			if (id != null && !id.equals("")) {
				TbPstlvl item = this.pstlvlMgr.find(id);
				((DynaValidatorForm) form).set("name", item.getName());
				((DynaValidatorForm) form).set("code", item.getCode());
				((DynaValidatorForm) form).set("id", item.getId());
				return mapping.findForward("add");
			}
		}
		return mapping.findForward("success");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id != null && !id.equals("")) {
			TbPstlvl item = this.pstlvlMgr.find(id);
			// ��ְ��ԭ����ְ������
			String oldname = item.getName();

			// pstlvlMgr.delete(id);
			// ְ��(tb_pstlvl)�ȼ�ɾ��ʱ��������ԭname,��tb_pst���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼,������Щ��¼��lvl�ֶ�ֵ���
			pstlvlMgr.deleteMore(id,oldname);
			return mapping.findForward("success");
		}
		return mapping.findForward("success");
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		if (action != null && !action.equals("")) {
			if (action.equals("add")) {
				return mapping.findForward("add");
			}
			if (action.equals("submit")) {
				String name = (String) ((DynaValidatorForm) form).get("name");
				String code = (String) ((DynaValidatorForm) form).get("code");
				TbPstlvl item = new TbPstlvl(name, code);
				this.pstlvlMgr.save(item);
				return mapping.findForward("success");
			}
		}
		return mapping.findForward("list");
	}
}
