package com.baosight.base.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.mode.TbDeptlvl;
import com.baosight.mode.TbUserlvl;
import com.baosight.struts.action.BaseDispatchAction;

public class UserlvlAction extends BaseDispatchAction {
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List alluserlvl = this.userlvlMgr.findAll();
		request.setAttribute("alluserlvl", alluserlvl);
		return mapping.findForward("list");
	}

	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		if (action != null && action.equals("submit")) {
			String name = (String) ((DynaValidatorForm) form).get("name");
			String code = (String) ((DynaValidatorForm) form).get("code");
			String ename = (String) ((DynaValidatorForm) form).get("ename");
			String rm = (String) ((DynaValidatorForm) form).get("rm");
			TbUserlvl item = this.userlvlMgr.find(id);
			// �û�ԭ��������
			String oldname = item.getName();

			item.setCode(code);
			item.setName(name);
			item.setEname(ename);
			item.setRm(rm);
			// �û�����(tb_userlvl)�޸�ʱ,������ԭname,��tb_user���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼��������Щ��¼��lvl�ֶ�ֵ����Ϊ��name
			this.userlvlMgr.updteMore(item, oldname);
			// this.userlvlMgr.updte(item);
			return mapping.findForward("success");
		} else {
			if (id != null && !id.equals("")) {
				TbUserlvl item = this.userlvlMgr.find(id);
				((DynaValidatorForm) form).set("name", item.getName());
				((DynaValidatorForm) form).set("code", item.getCode());
				((DynaValidatorForm) form).set("id", item.getId());
				((DynaValidatorForm) form).set("ename", item.getEname());
				((DynaValidatorForm) form).set("rm", item.getRm());
				return mapping.findForward("add");
			}
		}
		return mapping.findForward("success");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id != null && !id.equals("")) {
			// �û�Ȩ��ԭ������
			TbUserlvl item = this.userlvlMgr.find(id);
			String oldname = item.getName();

			// �û�����(tb_userlvl)ɾ��ʱ��������ԭname,��tb_user���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼,������Щ��¼��lvl�ֶ�ֵ���
			userlvlMgr.deleteMore(id, oldname);

			// userlvlMgr.delete(id);
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
				String ename = (String) ((DynaValidatorForm) form).get("ename");
				String rm = (String) ((DynaValidatorForm) form).get("rm");
				TbUserlvl item = new TbUserlvl(name, ename, code, rm);
				this.userlvlMgr.save(item);
				return mapping.findForward("success");
			}
		}
		return mapping.findForward("list");
	}
}
