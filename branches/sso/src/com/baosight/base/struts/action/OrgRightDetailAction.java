package com.baosight.base.struts.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.base.service.IDeptMgr;
import com.baosight.mode.TbDept;
import com.baosight.mode.TbPst;
import com.baosight.mode.TbRole;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserinfo;
import com.baosight.mode.TbUserlvl;
import com.baosight.struts.action.BaseDispatchAction;

public class OrgRightDetailAction extends BaseDispatchAction {

	/**
	 * �����û������ߵ���֯�������ڵ������
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		// ���봫���������ڵ��id�Ų���
		String nodeId = request.getParameter("nodeid");
		// ���봫��Ľڵ����Ͳ���
		String nodeType = request.getParameter("nodetype");

		request.setAttribute("parentid", nodeId);
		// ���������ǲ��Žڵ�
		if (nodeType.equals("deptnode")) {
			List children = getChildren(nodeId);
			request.setAttribute("children", children);
			return mapping.findForward("list");
		}
		// ����������ְ��ڵ�
		else if (nodeType.equals("pstnode")) {
			List children = getChildren(nodeId);
			request.setAttribute("children", children);
			return mapping.findForward("list");
		}
		// ������������Ա�ڵ�
		else /* if (nodeType.equals("usernode")) */{
			TbUser user = this.userMgr.find(nodeId);
			// //�����Ա�Ĭ��Ϊ��
			// ((DynaValidatorForm) form).set("sex", "1");

			request.setAttribute("user", user);

			// List userdeptList=this.userDeptMgr.findAll();
			//			
			// request.setAttribute("userdeptList", userdeptList);

			// ��ʾ������Ա����ϸ��Ϣ
			return mapping.findForward("modifyUser");
		}
	}
	
	public ActionForward upDownMove(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		// ���봫���������ڵ�ĸ�id�Ų���
		String parentId = request.getParameter("parentId");
		// ���봫���������ڵ�ĸ����Ͳ���
		String pNodeType = request.getParameter("pNodeType");
		// ���봫���������ڵ��id�Ų���
		String nodeId = request.getParameter("nodeid");
		// ���봫���������ڵ������
		String nodeType = request.getParameter("nodeType");
		// �ƶ����up����down����
		String type = request.getParameter("type");
		// defOrder
		String defOrder = request.getParameter("defOrder");
		// �ֵܽڵ�����nextNType
		String nextNType = request.getParameter("nextNType");

		if (pNodeType.equals("deptnode")) {
			this.deptMgr.upDownMoveS(parentId, nodeId, nodeType, nextNType,
					defOrder, type);
		} else {
			this.userMgr.upDownMoveS(parentId, nodeId, defOrder, type);
		}
		request.setAttribute("parentid", parentId);

		return new ActionForward(
				"/orgrightdetailaction.do?method=list&nodetype=" + pNodeType
						+ "&nodeid=" + parentId);
	}

	/**
	 * ������ӽڵ�����
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String addType = request.getParameter("addtype");
		String parentId = request.getParameter("parentid");
		String action = request.getParameter("action");
		String parentNodeType = request.getParameter("parentnodetype");
		String parentnodeS = request.getParameter("parentnodeS");
		request.setAttribute("parentnode", parentNodeType);

		// start
		String id = request.getParameter("nodeid");
		// end
		request.setAttribute("parentid", parentId);
		// ��action��ֵΪsubmitʱ˵�����û��ύ����ʱ���ж��󱣴�
		if (action != null && action.equals("submit")) {
			request.setAttribute("action", "addnode");
			// ���Ӳ���
			if (addType.equals("dept")) {
				String parentid = request.getParameter("parentid");
				addDept(request, parentid);
				return new ActionForward(
						"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
								+ parentid);
			}
			// ����ְ��
			else if (addType.equals("pst")) {
				String parentid = request.getParameter("parentid");
				addPst(request, parentid);
				System.out.println("pppppp===" + parentid);
				return new ActionForward(
						"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
								+ parentid);
			}
			// ������Ա
			else {
				// ������Ա��������
				if (parentnodeS.equals("deptnode")) {
					String parentid = request.getParameter("parentid");
					addUserForDept(request, parentid, form);
					return new ActionForward(
							"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
									+ parentid);
				}
				// ������Ա��ְ����
				else {
					String parentid = request.getParameter("parentid");
					addUserForPst(request, parentid, form);
					return new ActionForward(
							"/orgrightdetailaction.do?method=list&nodetype=pstnode&nodeid="
									+ parentid);
				}

			}
		}
		// ����action��ֵΪnull���߲�Ϊsubmitʱ˵�����û�������Ӱ�ť��
		// ������������Ӱ�ť������ʾ��Ӧ�ı�
		else {
			// ������ǡ����Ӳ��š�
			if (addType.equals("dept")) {
				List findAllDeptLvl = this.deptlvlMgr.findAll();

				List userdeptList = this.userDeptMgr.findAll();
				request.setAttribute("userdeptList", userdeptList);
				request.setAttribute("allDeptLvl", findAllDeptLvl);

				return mapping.findForward("deptedit");
			}
			// ������ǡ�����ְ��
			else if (addType.equals("pst")) {
				List findAllPstLvl = this.pstlvlMgr.findAll();
				request.setAttribute("allPstLvl", findAllPstLvl);

				return mapping.findForward("pstedit");
			}
			// ������ǡ�������Ա��
			else {
				// (addType.equals("user"))

				// �����Ա�Ĭ��Ϊ��
				((DynaValidatorForm) form).set("sex", "1");

				List findAllLvl = this.userlvlMgr.findAll();
				List userdeptList = this.userDeptMgr.findAll();

				request.setAttribute("userdeptList", userdeptList);
				request.setAttribute("allLvl", findAllLvl);

				return mapping.findForward("useredit");
			}
		}
	}

	/**
	 * �����û�ɾ������
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String nodeId = request.getParameter("nodeid");

		if (hasChildNode(nodeId)) {
			return mapping.findForward("deletefail");
		} else {
			deleteNodeById(nodeId);
		}
		String parentId = request.getParameter("parentid");
		return new ActionForward(
				"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
						+ parentId);
	}

	/**
	 * �Բ��ź�ְ����б༭
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward deptEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		String parentId = request.getParameter("parentid");
		String deptId = request.getParameter("nodeid");
		request.setAttribute("parentid", parentId);

		if (action != null && action.equals("submit")) {
			String name = (String) ((DynaValidatorForm) form).get("name");
			String code = (String) ((DynaValidatorForm) form).get("code");
			String lvl = (String) ((DynaValidatorForm) form).get("lvl");
			String tel = (String) ((DynaValidatorForm) form).get("tel");
			String ctc = (String) ((DynaValidatorForm) form).get("ctc");
			String rm = (String) ((DynaValidatorForm) form).get("rem");
			String userdept = (String) ((DynaValidatorForm) form)
					.get("userdept");
			TbDept item = deptMgr.find(deptId);
			item.setCode(code);
			item.setName(name);
			item.setLvl(lvl);
			item.setTel(tel);
			item.setCtc(ctc);
			item.setRem(rm);
			item.setUserDept(userdept);
			this.deptMgr.updateDept(item);
			// �������з���name��id���������ԣ����ڵ�ǰʵ����º���javascriptͬ��������ߵ���
			request.setAttribute("name", name);
			request.setAttribute("id", deptId);
		} else {
			if (deptId != null && !deptId.equals("")) {
				TbDept item = deptMgr.find(deptId);
				((DynaValidatorForm) form).set("nodeid", deptId);
				((DynaValidatorForm) form).set("name", item.getName());
				((DynaValidatorForm) form).set("code", item.getCode());
				((DynaValidatorForm) form).set("lvl", item.getLvl());
				((DynaValidatorForm) form).set("tel", item.getTel());
				((DynaValidatorForm) form).set("ctc", item.getCtc());
				((DynaValidatorForm) form).set("rem", item.getRem());
				((DynaValidatorForm) form).set("userdept", item.getUserDept());

				List findAllDeptLvl = this.deptlvlMgr.findAll();
				List userdeptList = this.userDeptMgr.findAll();
				request.setAttribute("allDeptLvl", findAllDeptLvl);
				request.setAttribute("userdeptList", userdeptList);
				return mapping.findForward("deptedit");
			}
		}
		return new ActionForward(
				"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
						+ parentId);
	}

	/**
	 * post edit
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward postEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		String parentId = request.getParameter("parentid");
		String pstId = request.getParameter("nodeid");
		request.setAttribute("parentid", parentId);
		System.out.println("-----deptId=" + pstId);
		List findAllPstLvl = this.pstlvlMgr.findAll();
		request.setAttribute("allPstLvl", findAllPstLvl);

		if (action != null && action.equals("submit")) {
			String name = (String) ((DynaValidatorForm) form).get("name");
			String code = (String) ((DynaValidatorForm) form).get("code");
			String lvl = (String) ((DynaValidatorForm) form).get("lvl");
			TbPst item = pstMgr.find(pstId);
			item.setCode(code);
			item.setName(name);
			item.setLvl(lvl);
			this.pstMgr.updatePst(item);
			// �������з���name��id���������ԣ����ڵ�ǰʵ����º���javascriptͬ��������ߵ���
			request.setAttribute("name", name);
			request.setAttribute("id", pstId);
		} else {
			if (pstId != null && !pstId.equals("")) {
				TbPst item = pstMgr.find(pstId);
				((DynaValidatorForm) form).set("name", item.getName());
				((DynaValidatorForm) form).set("code", item.getCode());
				((DynaValidatorForm) form).set("lvl", item.getLvl());

				return mapping.findForward("pstedit");
			}
		}
		return new ActionForward(
				"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
						+ parentId);
	}

	/**
	 * ���û���Ϣ����չ��Ϣ���б༭
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String nodeId = request.getParameter("nodeid");
		String id = request.getParameter("id");
		String parentId = request.getParameter("parentid");
		String parentNodeType = request.getParameter("type");
		String parentNodeTypeS = request.getParameter("typeS");
		request.setAttribute("parentNodeType", parentNodeType);
		request.setAttribute("parentid", parentId);
		String action = request.getParameter("action");
		if (action != null && action.equals("submit")) {

			String name = (String) ((DynaValidatorForm) form).get("name");
			// String sex = (String) ((DynaValidatorForm)form).get("sex");
			String strsex = (String) ((DynaValidatorForm) form).get("sex");
			String sex = "";
			if ("1".equals(strsex)) {
				sex = "��";
			} else if ("2".equals(strsex)) {
				sex = "Ů";
			} else {
				sex = null;
			}

			String useracc = (String) ((DynaValidatorForm) form).get("userAcc");
			String pwd = (String) ((DynaValidatorForm) form).get("pwd");
			String lvl = (String) ((DynaValidatorForm) form).get("lvl");
			String tel = (String) ((DynaValidatorForm) form).get("tel");
			String userdept = (String) ((DynaValidatorForm) form)
					.get("userdept");

			String birthday = (String) ((DynaValidatorForm) form)
					.get("birthday");
			String email = (String) ((DynaValidatorForm) form).get("email");
			String linkaddress = (String) ((DynaValidatorForm) form)
					.get("linkaddress");
			String handset = (String) ((DynaValidatorForm) form).get("handset");
			String phone = (String) ((DynaValidatorForm) form).get("phone");

			TbUser item = this.userMgr.find(id);
			List itemInfo = this.userInfoMgr.find(item.getId());
			if (itemInfo.size() <= 0) {

				item.setName(name);
				item.setSex(sex);
				item.setUserAcc(useracc);
				item.setPwd(pwd);
				item.setLvl(lvl);
				item.setTel(tel);
				item.setUserdept(userdept);
				this.userMgr.update(item);

				/**
				 * ����Ӧ�û���չ��Ϣ�������ݿ�
				 */
				TbUserinfo itemInfoI = new TbUserinfo();
				itemInfoI.setUserid(item.getId());
				itemInfoI.setBirthday(birthday);
				itemInfoI.setEmail(email);
				itemInfoI.setLinkaddress(linkaddress);
				itemInfoI.setHandset(handset);
				itemInfoI.setPhone(phone);
				userInfoMgr.save(itemInfoI);
				return new ActionForward(
						"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
								+ parentId);
			} else {
				if (parentNodeTypeS.equals("pstnode")) {
					TbUserinfo itemInfoI = (TbUserinfo) this.userInfoMgr.find(
							item.getId()).get(0);
					item.setName(name);
					item.setSex(sex);
					item.setUserAcc(useracc);
					item.setPwd(pwd);
					item.setLvl(lvl);
					item.setTel(tel);
					item.setUserdept(userdept);
					this.userMgr.update(item);

					// String idd = item.getId();
					itemInfoI.setUserid(item.getId());
					itemInfoI.setBirthday(birthday);
					itemInfoI.setEmail(email);
					itemInfoI.setLinkaddress(linkaddress);
					itemInfoI.setHandset(handset);
					itemInfoI.setPhone(phone);
					this.userInfoMgr.update(itemInfoI);
					// �������з���name��id���������ԣ����ڵ�ǰʵ����º���javascriptͬ��������ߵ���
					request.setAttribute("name", name);
					request.setAttribute("id", id);
					return new ActionForward(
							"/orgrightdetailaction.do?method=list&nodetype=pstnode&nodeid="
									+ parentId);
				} else {
					TbUserinfo itemInfoI = (TbUserinfo) this.userInfoMgr.find(
							item.getId()).get(0);
					item.setName(name);
					item.setSex(sex);
					item.setUserAcc(useracc);
					item.setPwd(pwd);
					item.setLvl(lvl);
					item.setTel(tel);
					item.setUserdept(userdept);
					this.userMgr.update(item);

					// String idd = item.getId();
					itemInfoI.setUserid(item.getId());
					itemInfoI.setBirthday(birthday);
					itemInfoI.setEmail(email);
					itemInfoI.setLinkaddress(linkaddress);
					itemInfoI.setHandset(handset);
					itemInfoI.setPhone(phone);
					this.userInfoMgr.update(itemInfoI);
					// �������з���name��id���������ԣ����ڵ�ǰʵ����º���javascriptͬ��������ߵ���
					request.setAttribute("name", name);
					request.setAttribute("id", id);
					return new ActionForward(
							"/orgrightdetailaction.do?method=list&nodetype=deptnode&nodeid="
									+ parentId);
				}
			}

		} else {
			if (nodeId != null && !nodeId.equals("")) {
				TbUser item = this.userMgr.find(nodeId);
				List itemInfo = this.userInfoMgr.find(item.getId());
				if (itemInfo.size() <= 0) {
					((DynaValidatorForm) form).set("id", item.getId());
					((DynaValidatorForm) form).set("name", item.getName());
					String strsex = item.getSex();
					if ("��".equals(strsex)) {
						((DynaValidatorForm) form).set("sex", "1");
					} else if ("Ů".equals(strsex)) {
						((DynaValidatorForm) form).set("sex", "2");
					} else {
						((DynaValidatorForm) form).set("sex", "");
					}

					// ((DynaValidatorForm)form).set("sex", item.getSex());
					((DynaValidatorForm) form)
							.set("userAcc", item.getUserAcc());
					((DynaValidatorForm) form).set("pwd", item.getPwd());
					((DynaValidatorForm) form).set("lvl", item.getLvl());
					((DynaValidatorForm) form).set("tel", item.getTel());
					((DynaValidatorForm) form).set("tel", item.getTel());
					((DynaValidatorForm) form).set("userdept", item
							.getUserdept());
					List findAllLvl = this.userlvlMgr.findAll();
					request.setAttribute("allLvl", findAllLvl);
					List userroleList = this.userRoleMgr.getUserRoleList(item);
					request.setAttribute("userroleList", userroleList);					
					return mapping.findForward("useredit");
				} else {
					TbUserinfo itemInfoI = (TbUserinfo) this.userInfoMgr.find(
							item.getId()).get(0);
					((DynaValidatorForm) form).set("id", item.getId());
					((DynaValidatorForm) form).set("name", item.getName());
					String strsex = item.getSex();
					if ("��".equals(strsex)) {
						((DynaValidatorForm) form).set("sex", "1");
					} else if ("Ů".equals(strsex)) {
						((DynaValidatorForm) form).set("sex", "2");
					} else {
						((DynaValidatorForm) form).set("sex", "");
					}
					// ((DynaValidatorForm)form).set("sex", item.getSex());
					((DynaValidatorForm) form)
							.set("userAcc", item.getUserAcc());
					((DynaValidatorForm) form).set("pwd", item.getPwd());
					((DynaValidatorForm) form).set("lvl", item.getLvl());
					((DynaValidatorForm) form).set("tel", item.getTel());

					((DynaValidatorForm) form).set("birthday", itemInfoI
							.getBirthday());
					((DynaValidatorForm) form).set("email", itemInfoI
							.getEmail());
					((DynaValidatorForm) form).set("linkaddress", itemInfoI
							.getLinkaddress());
					((DynaValidatorForm) form).set("handset", itemInfoI
							.getHandset());
					((DynaValidatorForm) form).set("phone", itemInfoI
							.getPhone());
					((DynaValidatorForm) form).set("userdept", item
							.getUserdept());
					List findAllLvl = this.userlvlMgr.findAll();
					List userdeptList = this.userDeptMgr.findAll();

					request.setAttribute("userdeptList", userdeptList);
					request.setAttribute("allLvl", findAllLvl);

					return mapping.findForward("useredit");
				}
			}
		}

		return mapping.findForward("success");

	}

	// ���û�����û����ʱ���ô˷�������
	public ActionForward modifyUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String nodeId = request.getParameter("nodeid");
		String id = request.getParameter("id");
		String parentId = request.getParameter("parentid");
		request.setAttribute("parentid", parentId);
		String action = request.getParameter("action");
		if (action != null && action.equals("submit")) {

			String name = (String) ((DynaValidatorForm) form).get("name");
			String strsex = (String) ((DynaValidatorForm) form).get("sex");
			String sex = "";
			if ("1".equals(strsex)) {
				sex = "��";
			} else if ("2".equals(strsex)) {
				sex = "Ů";
			} else {
				sex = null;
			}
			// String sex = (String) ((DynaValidatorForm)form).get("sex");
			String useracc = (String) ((DynaValidatorForm) form).get("userAcc");
			String pwd = (String) ((DynaValidatorForm) form).get("pwd");
			String lvl = (String) ((DynaValidatorForm) form).get("lvl");
			String tel = (String) ((DynaValidatorForm) form).get("tel");

			String birthday = (String) ((DynaValidatorForm) form)
					.get("birthday");
			String email = (String) ((DynaValidatorForm) form).get("email");
			String linkaddress = (String) ((DynaValidatorForm) form)
					.get("linkaddress");
			String handset = (String) ((DynaValidatorForm) form).get("handset");
			String phone = (String) ((DynaValidatorForm) form).get("phone");

			TbUser item = this.userMgr.find(id);
			List itemInfo = this.userInfoMgr.find(item.getId());
			if (itemInfo.size() <= 0) {
			//�޸Ĺ�������¼��
				this.userMgr.checkWorkFlowUser(item,useracc);
				item.setName(name);
				item.setSex(sex);
				item.setUserAcc(useracc);
				item.setPwd(pwd);
				item.setLvl(lvl);
				item.setTel(tel);
				this.userMgr.update(item);

				/**
				 * ����Ӧ�û���չ��Ϣ�������ݿ�
				 */
				TbUserinfo itemInfoI = new TbUserinfo();
				itemInfoI.setUserid(item.getId());
				itemInfoI.setBirthday(birthday);
				itemInfoI.setEmail(email);
				itemInfoI.setLinkaddress(linkaddress);
				itemInfoI.setHandset(handset);
				itemInfoI.setPhone(phone);
				userInfoMgr.save(itemInfoI);
				return new ActionForward("/WEB-INF/web/jsp/org/editSuccess.jsp");
			} else {
			//�޸Ĺ�������¼��
				this.userMgr.checkWorkFlowUser(item,useracc);
				TbUserinfo itemInfoI = (TbUserinfo) this.userInfoMgr.find(
						item.getId()).get(0);
				item.setName(name);
				item.setSex(sex);
				item.setUserAcc(useracc);
				item.setPwd(pwd);
				item.setLvl(lvl);
				item.setTel(tel);
				this.userMgr.update(item);

				// String idd = item.getId();
				itemInfoI.setUserid(item.getId());
				itemInfoI.setBirthday(birthday);
				itemInfoI.setEmail(email);
				itemInfoI.setLinkaddress(linkaddress);
				itemInfoI.setHandset(handset);
				itemInfoI.setPhone(phone);
				this.userInfoMgr.update(itemInfoI);
				return new ActionForward("/WEB-INF/web/jsp/org/editSuccess.jsp");
			}

		} else {
			if (nodeId != null && !nodeId.equals("")) {
				TbUser item = this.userMgr.find(nodeId);
				List itemInfo = this.userInfoMgr.find(item.getId());
				if (itemInfo.size() <= 0) {
					((DynaValidatorForm) form).set("id", item.getId());
					((DynaValidatorForm) form).set("name", item.getName());
					// String strsex=item.getSex();
					// if("��".equals(strsex))
					// {
					// ((DynaValidatorForm)form).set("sex", "1");
					// }else
					// {
					// ((DynaValidatorForm)form).set("sex", "2");
					// }
					((DynaValidatorForm) form).set("sex", item.getSex());
					((DynaValidatorForm) form)
							.set("userAcc", item.getUserAcc());
					((DynaValidatorForm) form).set("pwd", item.getPwd());
					((DynaValidatorForm) form).set("lvl", item.getLvl());
					((DynaValidatorForm) form).set("tel", item.getTel());
					((DynaValidatorForm) form).set("userdept", item
							.getUserdept());
					List findAllLvl = this.userlvlMgr.findAll();
					request.setAttribute("allLvl", findAllLvl);
					
					
					List userdeptList = this.userDeptMgr.findAll();
					List userroleList = this.userRoleMgr.getUserRoleList(item);
					request.setAttribute("userroleList", userroleList);
					request.setAttribute("userdeptList", userdeptList);
					
					
					
					return mapping.findForward("usereditS");
				} else {
					TbUserinfo itemInfoI = (TbUserinfo) this.userInfoMgr.find(
							item.getId()).get(0);
					((DynaValidatorForm) form).set("id", item.getId());
					((DynaValidatorForm) form).set("name", item.getName());
					String strsex = item.getSex();
					if ("��".equals(strsex)) {
						((DynaValidatorForm) form).set("sex", "1");
					} else if ("Ů".equals(strsex)) {
						((DynaValidatorForm) form).set("sex", "2");
					} else {
						((DynaValidatorForm) form).set("sex", "");
					}
					// ((DynaValidatorForm)form).set("sex", item.getSex());
					((DynaValidatorForm) form)
							.set("userAcc", item.getUserAcc());
					((DynaValidatorForm) form).set("pwd", item.getPwd());
					((DynaValidatorForm) form).set("lvl", item.getLvl());
					((DynaValidatorForm) form).set("tel", item.getTel());

					((DynaValidatorForm) form).set("birthday", itemInfoI
							.getBirthday());
					((DynaValidatorForm) form).set("email", itemInfoI
							.getEmail());
					((DynaValidatorForm) form).set("linkaddress", itemInfoI
							.getLinkaddress());
					((DynaValidatorForm) form).set("handset", itemInfoI
							.getHandset());
					((DynaValidatorForm) form).set("phone", itemInfoI
							.getPhone());
					((DynaValidatorForm) form).set("userdept", item
							.getUserdept());
					System.out.println(item.getUserdept());
					List findAllLvl = this.userlvlMgr.findAll();

					List userdeptList = this.userDeptMgr.findAll();
					List userroleList = this.userRoleMgr.getUserRoleList(item);
					request.setAttribute("userroleList", userroleList);
					request.setAttribute("userdeptList", userdeptList);

					request.setAttribute("allLvl", findAllLvl);
					return mapping.findForward("usereditS");
				}
			}
		}

		return mapping.findForward("success");

	}

	/**
	 * �жϵ�ǰ�ڵ��Ƿ����ӽڵ�
	 * 
	 * @param nodeId
	 * @return
	 */
	private boolean hasChildNode(String nodeId) {
		if (getChildren(nodeId).size() > 0) {
			return true;
		}
		return false;
	}

	/**
	 * �õ������ڵ������ֱ���ӽڵ�
	 * 
	 * @param parentId
	 *            �����ڵ��id
	 * @return �ýڵ�������ӽڵ�
	 */
	private List getChildren(String parentId) {
		List result = new LinkedList();
		// ��deptMgr����
		result.addAll(deptMgr.getChildren(parentId));
		// ��pstMgr����
		result.addAll(pstMgr.getByDeptId(parentId));
		// ��userMgr����
		result.addAll(userMgr.getChildren(parentId));
		result = this.sortList(result);
		return result;
	}

	private void deleteNodeById(String nodeId) {
		// TbUser item = this.userMgr.find(nodeId);
		// List itemInfoI = this.userInfoMgr.find(item.getId());

		if (deptMgr.delete(nodeId))
			return;
		if (pstMgr.delete(nodeId))
			return;
		if (userMgr.delete(nodeId)) {
			this.userInfoMgr.deleteByUserId(nodeId);

			// if(itemInfoI.size()>0){
			// TbUserinfo itemInfo = (TbUserinfo)
			// this.userInfoMgr.find(item.getId()).get(0);
			// userInfoMgr.delete(itemInfo.getId());
			// }

			this.userInfoMgr.deleteUserRoleByUserId(nodeId);
			// if(itemInfoI.size()>0){
			// TbUserinfo itemInfo = (TbUserinfo)
			// this.userInfoMgr.find(item.getId()).get(0);
			// userInfoMgr.delete(itemInfo.getId());
			// }

			return;
		}

	}

	private void addDept(HttpServletRequest request, String parentId) {
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String lvl = request.getParameter("lvl");
		String tel = request.getParameter("tel");
		String ctc = request.getParameter("ctc");
		String rem = request.getParameter("rem");
		String userdept = request.getParameter("userdept");

		TbDept item = new TbDept();
		item.setCode(code);
		item.setName(name);
		item.setLvl(lvl);
		item.setTel(tel);
		item.setCtc(ctc);
		item.setRem(rem);
		item.setParCode(parentId);
		item.setUserDept(userdept);
		// ȡdeforder�����ֵ
		long deforder = this.deptMgr.getMaxDefOrder(parentId);
		item.setDefOrder(deforder + 1);
		request.setAttribute("nodeid", parentId);
		deptMgr.save(item);

		request.setAttribute("id", item.getId());
		request.setAttribute("name", name);
	}

	private void addPst(HttpServletRequest request, String parentId) {
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String lvl = request.getParameter("lvl");

		TbPst item = new TbPst();
		item.setCode(code);
		item.setName(name);
		item.setLvl(lvl);
		item.setDeptid(parentId);
		System.out.println("parentId==action=" + parentId);
		long deforder = this.pstMgr.getMaxDefOrder(parentId);
		item.setDefOrder(deforder + 1);
		request.setAttribute("nodeid", parentId);
		pstMgr.save(item);

		request.setAttribute("id", item.getId());
		request.setAttribute("name", name);
	}

	private void addUserForPst(HttpServletRequest request, String parentId,
			ActionForm form) {
		String name = (String) ((DynaValidatorForm) form).get("name");
		// String sex = (String) ((DynaValidatorForm) form).get("sex");
		String strsex = (String) ((DynaValidatorForm) form).get("sex");
		String sex = "";
		if ("��".equals(strsex)) {
			sex = "��";
		} else if ("Ů".equals(strsex)) {
			sex = "Ů";
		} else {
			sex = null;
		}
		String userAcc = (String) ((DynaValidatorForm) form).get("userAcc");
		String pwd = (String) ((DynaValidatorForm) form).get("pwd");
		String lvl = (String) ((DynaValidatorForm) form).get("lvl");
		String tel = (String) ((DynaValidatorForm) form).get("tel");
		String userdept = (String) ((DynaValidatorForm) form).get("userdept");

		TbUser item = new TbUser();
		item.setName(name);
		item.setSex(sex);
		item.setUserAcc(userAcc);
		item.setPwd(pwd);
		item.setLvl(lvl);
		item.setTel(tel);
		item.setPst(parentId);
		item.setUserdept(userdept);
		String deptId = this.userMgr.findDeptIdForUser(parentId);
		long deforder = this.userMgr.findMaxDefOrder(parentId);
		item.setDefOrder(deforder + 1);
		item.setDeptCode(deptId);
		request.setAttribute("nodeid", parentId);
		userMgr.save(item, "post");

		request.setAttribute("id", item.getId());
		request.setAttribute("name", name);

		/**
		 * ����Ӧ�û���չ��Ϣ����
		 */

		String birthday = (String) ((DynaValidatorForm) form).get("birthday");
		String email = (String) ((DynaValidatorForm) form).get("email");
		String linkAddress = (String) ((DynaValidatorForm) form)
				.get("linkaddress");
		String handset = (String) ((DynaValidatorForm) form).get("handset");
		String phone = (String) ((DynaValidatorForm) form).get("phone");

		/**
		 * ����Ӧ�û���չ��Ϣ�������ݿ�
		 */
		TbUserinfo itemInfo = new TbUserinfo();
		itemInfo.setUserid(item.getId());
		itemInfo.setBirthday(birthday);
		itemInfo.setEmail(email);
		itemInfo.setLinkaddress(linkAddress);
		itemInfo.setHandset(handset);
		itemInfo.setPhone(phone);
		userInfoMgr.save(itemInfo);

	}

	private void addUserForDept(HttpServletRequest request, String parentId,
			ActionForm form) {
		String name = (String) ((DynaValidatorForm) form).get("name");
		// String sex = (String) ((DynaValidatorForm)form).get("sex");
		String strsex = (String) ((DynaValidatorForm) form).get("sex");
		String sex = "";
		if ("��".equals(strsex)) {
			sex = "��";
		} else if ("Ů".equals(strsex)) {
			sex = "Ů";
		} else {
			sex = null;
		}
		String userAcc = (String) ((DynaValidatorForm) form).get("userAcc");
		String pwd = (String) ((DynaValidatorForm) form).get("pwd");
		String lvl = (String) ((DynaValidatorForm) form).get("lvl");
		String tel = (String) ((DynaValidatorForm) form).get("tel");
		String userdept = (String) ((DynaValidatorForm) form).get("userdept");

		TbUser item = new TbUser();
		item.setName(name);
		item.setSex(sex);
		item.setUserAcc(userAcc);
		item.setPwd(pwd);
		item.setLvl(lvl);
		item.setTel(tel);
		item.setDeptCode(parentId);
		item.setUserdept(userdept);
		long deforder = this.deptMgr.getMaxDefOrder(parentId);
		item.setDefOrder(deforder + 1);
		request.setAttribute("nodeid", parentId);
		userMgr.save(item, "dept");

		request.setAttribute("id", item.getId());
		request.setAttribute("name", name);

		/**
		 * ����Ӧ�û���չ��Ϣ����
		 */

		String birthday = (String) ((DynaValidatorForm) form).get("birthday");
		String email = (String) ((DynaValidatorForm) form).get("email");
		String linkAddress = (String) ((DynaValidatorForm) form)
				.get("linkaddress");
		String handset = (String) ((DynaValidatorForm) form).get("handset");
		String phone = (String) ((DynaValidatorForm) form).get("phone");

		/**
		 * ����Ӧ�û���չ��Ϣ�������ݿ�
		 */
		TbUserinfo itemInfo = new TbUserinfo();
		itemInfo.setUserid(item.getId());
		itemInfo.setBirthday(birthday);
		itemInfo.setEmail(email);
		itemInfo.setLinkaddress(linkAddress);
		itemInfo.setHandset(handset);
		itemInfo.setPhone(phone);
		userInfoMgr.save(itemInfo);

	}
	public ActionForward resultUser(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		String deptId =request.getParameter("deptId");
	    List list = userMgr.getUserNameAndId(deptId);
		Collection<LabelValueBean> collUser = new LinkedList<LabelValueBean>();
		for (int j = 0; j < list.size(); j++) {
			Object[] obj = (Object[]) list.get(j);
			collUser.add(new LabelValueBean(obj[1].toString(), obj[0]
					.toString()));
		}
	    if(list!=null){
	    	for(int i =0; i<list.size(); i++){
	    		Object[] obj = (Object[]) list.get(i);
	    	}
	    }
//		response.setHeader("Pragma", "No-cache");
//		response.setHeader("Cache-Control", "no-cache");
//		response.setDateHeader("Expires", 0);
//		response.setContentType("text/xml;charset=GBK");
//		System.out.println("------------" + result);
//		try {
//			response.getWriter().print(result);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return null;
	}
	
	public List sortList(List temp) {
		Object[] obj = temp.toArray();
		for (int i = 0; i < obj.length; i++) {
			for (int j = 0; j < obj.length - i - 1; j++) { // ���ڽӵ�Ԫ�ؽ��бȽϣ���������С���ͽ���
				if ((obj[j] instanceof TbDept)
						&& (obj[j + 1] instanceof TbDept)) {
					if (((TbDept) obj[j]).getDefOrder().compareTo(
							((TbDept) obj[j + 1]).getDefOrder()) > 0) {
						TbDept tmp = new TbDept();
						tmp = (TbDept) obj[j];
						obj[j] = (TbDept) obj[j + 1];
						obj[j + 1] = tmp;
					}
				} else if ((obj[j] instanceof TbDept)
						&& (obj[j + 1] instanceof TbPst)) {
					if (((TbDept) obj[j]).getDefOrder().compareTo(
							((TbPst) obj[j + 1]).getDefOrder()) > 0) {

						Object tmp = new Object();
						tmp = (TbDept) obj[j];
						obj[j] = (TbPst) obj[j + 1];
						obj[j + 1] = (TbDept) tmp;
					}
				} else if ((obj[j] instanceof TbDept)
						&& (obj[j + 1] instanceof TbUser)) {
					if (((TbDept) obj[j]).getDefOrder().compareTo(
							((TbUser) obj[j + 1]).getDefOrder()) > 0) {
						Object tmp = new Object();
						tmp = (TbDept) obj[j];
						obj[j] = (TbUser) obj[j + 1];
						obj[j + 1] = (TbDept) tmp;
					}
				} else if ((obj[j] instanceof TbPst)
						&& (obj[j + 1] instanceof TbPst)) {
					if (((TbPst) obj[j]).getDefOrder().compareTo(
							((TbPst) obj[j + 1]).getDefOrder()) > 0) {
						TbPst tmp = new TbPst();
						tmp = (TbPst) obj[j];
						obj[j] = (TbPst) obj[j + 1];
						obj[j + 1] = tmp;
					}
				} else if ((obj[j] instanceof TbPst)
						&& (obj[j + 1] instanceof TbDept)) {
					if (((TbPst) obj[j]).getDefOrder().compareTo(
							((TbDept) obj[j + 1]).getDefOrder()) > 0) {
						Object tmp = new Object();
						tmp = (TbPst) obj[j];
						obj[j] = (TbDept) obj[j + 1];
						obj[j + 1] = (TbPst) tmp;
					}
				} else if ((obj[j] instanceof TbPst)
						&& (obj[j + 1] instanceof TbUser)) {
					if (((TbPst) obj[j]).getDefOrder().compareTo(
							((TbUser) obj[j + 1]).getDefOrder()) > 0) {
						Object tmp = new Object();
						tmp = (TbPst) obj[j];
						obj[j] = (TbUser) obj[j + 1];
						obj[j + 1] = (TbPst) tmp;
					}
				} else if ((obj[j] instanceof TbUser)
						&& (obj[j + 1] instanceof TbDept)) {
					if (((TbUser) obj[j]).getDefOrder().compareTo(
							((TbDept) obj[j + 1]).getDefOrder()) > 0) {
						Object tmp = new Object();
						tmp = (TbUser) obj[j];
						obj[j] = (TbDept) obj[j + 1];
						obj[j + 1] = (TbUser) tmp;
					}
				} else if ((obj[j] instanceof TbUser)
						&& (obj[j + 1] instanceof TbPst)) {
					if (((TbUser) obj[j]).getDefOrder().compareTo(
							((TbPst) obj[j + 1]).getDefOrder()) > 0) {
						Object tmp = new Object();
						tmp = (TbUser) obj[j];
						obj[j] = (TbPst) obj[j + 1];
						obj[j + 1] = (TbUser) tmp;
					}
				} else if ((obj[j] instanceof TbUser)
						&& (obj[j + 1] instanceof TbUser)) {
					if (((TbUser) obj[j]).getDefOrder().compareTo(
							((TbUser) obj[j + 1]).getDefOrder()) > 0) {
						TbUser tmp = new TbUser();
						tmp = (TbUser) obj[j];
						obj[j] = (TbUser) obj[j + 1];
						obj[j + 1] = tmp;
					}
				}
			}
		}
		return Arrays.asList(obj);
	}
}
