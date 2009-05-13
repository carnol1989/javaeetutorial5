package com.baosight.base.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.mode.TbDeptlvl;
import com.baosight.struts.action.BaseDispatchAction;

public class DeptlvlAction extends BaseDispatchAction {
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List alldeptlvl = this.deptlvlMgr.findAll();
		request.setAttribute("alldeptlvl", alldeptlvl);
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
			String rem = (String) ((DynaValidatorForm) form).get("rem");
			TbDeptlvl item = this.deptlvlMgr.find(id);
			// ����ԭ��������
			//String oldname = item.getName();
			
			item.setCode(code);
			item.setName(name);
			item.setEname(ename);
			item.setRem(rem);
			deptlvlMgr.updte(item);
			// ���ż���(tb_deptlvl)�޸�ʱ,������ԭname,��tb_dept���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼��������Щ��¼��lvl�ֶ�ֵ����Ϊ��name
			//this.deptlvlMgr.updteMore(item, oldname);
			return mapping.findForward("success");
		} else {
			if (id != null && !id.equals("")) {
				TbDeptlvl item = this.deptlvlMgr.find(id);
				((DynaValidatorForm) form).set("name", item.getName());
				((DynaValidatorForm) form).set("code", item.getCode());
				((DynaValidatorForm) form).set("id", item.getId());
				((DynaValidatorForm) form).set("ename", item.getEname());
				((DynaValidatorForm) form).set("rem", item.getRem());
				return mapping.findForward("add");
			}
		}
		return mapping.findForward("success");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id != null && !id.equals("")) {
			// ����ԭ����д����
			//TbDeptlvl item = this.deptlvlMgr.find(id);
			//String oldname = item.getName();
			deptlvlMgr.delete(id);
			
			// ���ż���(tb_deptlvl)ɾ��ʱ��������ԭname,��tb_dept���в�ѯ����lvl�ֶ�Ϊԭname�ļ�¼,������Щ��¼��lvl�ֶ�ֵ���
			//deptlvlMgr.deleteMore(id, oldname);
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
				String rem = (String) ((DynaValidatorForm) form).get("rem");
				TbDeptlvl item = new TbDeptlvl(name, ename, code, rem);
				this.deptlvlMgr.save(item);
				return mapping.findForward("success");
			}
		}
		return mapping.findForward("list");
	}
}
