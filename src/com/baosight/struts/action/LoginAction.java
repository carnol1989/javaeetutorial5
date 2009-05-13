package com.baosight.struts.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.baosight.mode.DBSY;
import com.baosight.mode.TbAppsys;
import com.baosight.mode.TbDept;
import com.baosight.mode.TbFunction;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserdept;

public class LoginAction extends BaseDispatchAction {

	private static final String DEPTID_JUOA = "b205f4e34f4f4d2da5bd89e2e10af37a";//��OA
	private static final String DEPTID_FXZHHB = "9f9083fd1930d442011930ebcf52000b";//��Ѵָ�Ӳ�
	//private static final String DEPTID_XXZX = "";//��Ϣ����
	//private static final String DEPTID_SLZX = "";//��������
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String ca = request.getParameter("ca");
		String cert = request.getParameter("cert");
		String KOAL_CERT_SERIAL_NUMBER = (String)request.getSession().getAttribute("KOAL_CERT_SERIAL_NUMBER");
		System.out.println("------------------------------ca:"+ca);
		String mappingUrl = "";
		String key = request.getParameter("goto");
		TbAppsys tbAppsys = appSysMgr.getUrlByCode(key);		
		if(cert!=null && !cert.equals("")&& ca!=null && ca.equals("true")){
			String mdName = "";
			String mdPass = "";
			TbUser item = userMgr.checkSSL(cert);
			if(item!=null){
				mdName = item.getUserAcc();
				mdPass = item.getPwd();
			}else{
				return new ActionForward("index.jsp");
			}
			toMain(mapping, request, response, mdName,mdPass, "");
			request.getSession().setAttribute("keyLogin", "true");
			String loginType = request.getParameter("loginType");
			request.setAttribute("loginType", loginType);
			request.getSession().setAttribute("keyPassword", request.getParameter("keyPassword"));
			return mapping.findForward("success");		
		}		

		// ȡ�õ�¼ϵͳ��ʾkey
		// key=1 Ϊ��¼sso
		// ����Ϊ��¼������ϵͳ
		if (key == null || key.equals("") || key.equals("null")) {
			TbAppsys root = getMappingUrl("1");
			if (root != null && !root.getUrl().equals("")) {
				mappingUrl = root.getUrl();
			}
			key = "1";
		}	
			
		
		DynaActionForm userForm = (DynaActionForm) form;
		// from cokie
		Cookie[] cookies = request.getCookies();
		String cName = "";
		String cPWD = "";
		// key=1 ȡcookies��sso�û���cookies
		if (cookies != null && key != null && !key.equals("1")) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie item = cookies[i];
				if (item.getName().equals("loginUserForSL")) {
					// �õ��û���
					cName = item.getValue();
				}
				if (item.getName().equals("passwordForSL")) {
					cPWD = item.getValue();
				}
			}
		}
		// �������� ȡcookies�����������û���cookies
		if (cookies != null && key != null && key.equals("1")) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie item = cookies[i];
				if (item.getName().equals("loginUserForSSO")) {
					// �õ��û���
					cName = item.getValue();
				}
				if (item.getName().equals("passwordForSSO")) {
					cPWD = item.getValue();
				}
			}
		}
		// sso ��¼ʱʼ��ͨ����¼ҳ��
		// �����ж�cookie ���cookie�в����ڣ���ӱ���ȡ�û��������������֤����֤ͨ��д��sso�û���cookie
		// cookie�д��ڣ�������֤cookie�е�sso �û�
		// ��֤ͨ�� ���жϱ��ϵ��û����Ƿ��cookie����ͬ
		// ����ͬ������֤���ϵ��û��������� ͨ������дsso��cookie ������ԭ���û���cookie
		// ��ͬ�� ���жϱ��ϵ��û����������Ƿ��cookie����ͬ ��ͬ��Ϊͬһ�û���ֱ�ӵ�¼
		if (key != null && key.equals("1")) {
			// cookie���ҵ���������֤
			if ((cName != null && cName.equals(""))
					|| (cPWD != null && cPWD.equals(""))) {
				String fUser = "";
				String fPassword = "";
				fUser = userForm.getString("loginUser");
				fPassword = userForm.getString("password");
//				if(fUser!=null && fPassword!=null){
				if (!fUser.equals("")) {
					//String str = passed(fUser, fPassword, key);
					String str = passed(fUser, fPassword, KOAL_CERT_SERIAL_NUMBER);
					if ("loginIn".equals(str)) {
						// ���ͨ����֤��дcookie

						Cookie c = new Cookie("loginUserForSSO", fUser);
						c.setMaxAge(24 * 60 * 60 * 1000);
						response.addCookie(c);
						Cookie pass = new Cookie("passwordForSSO", fPassword);
						pass.setMaxAge(24 * 60 * 60 * 1000);
						response.addCookie(pass);

						// ��ת
						if (tbAppsys != null) {
							doRedirect(mapping, response, key, mappingUrl,
									fUser, fPassword, tbAppsys, request);
						} else {
							toMain(mapping, request, response, fUser,
									fPassword, mappingUrl);
							String loginType = request
									.getParameter("loginType");
							request.setAttribute("loginType", loginType);
							HttpSession session = request.getSession();
							session.setAttribute("loginType", loginType);
							ActionForward forward = new ActionForward();
							forward.setPath(mappingUrl);
							return mapping.findForward("success");
						}
						return null;
					} else {
						String loginType = request.getParameter("loginType");
						if (loginType != null && loginType.equals("1")) {
							request.setAttribute("loginFlag", str);
							return mapping.findForward("fail1");
						} else if (loginType != null && loginType.equals("2")) {
							request.setAttribute("loginFlag", str);
							return mapping.findForward("fail2");
						} else if (loginType != null && loginType.equals("3")) {
							request.setAttribute("loginFlag", str);
							return mapping.findForward("fail3");
						} else {
							request.setAttribute("loginFlag", str);
							return mapping.findForward("fail");
						}
					}
				}
			} else {
				//String cStr = passed(cName, cPWD, key);
				String cStr = passed(cName, cPWD, KOAL_CERT_SERIAL_NUMBER);
				if ("loginIn".equals(cStr)) {
					// ��֤ͨ����ҳ����ת��URL
					String fUser = "";
					String fPassword = "";
					fUser = userForm.getString("loginUser");
					fPassword = userForm.getString("password");

					// // key=1 ��¼sso
					// if (key != null && key.equals("1")) {

					// ��֤���ϵ��û����Ƿ��Ѵ�����cookie
					// �� ֱ�ӵ�¼
					// �� ��֤���ɹ���дcookie
					if (!fUser.equals(cName) && !fPassword.equals(cPWD)) {
						//String str = passed(fUser, fPassword, key);
						String str = passed(fUser, fPassword, KOAL_CERT_SERIAL_NUMBER);
						if ("loginIn".equals(str)) {
							// ���ͨ����֤��дcookie

							Cookie c = new Cookie("loginUserForSSO", fUser);
							c.setMaxAge(24 * 60 * 60 * 1000);
							response.addCookie(c);
							Cookie pass = new Cookie("passwordForSSO",
									fPassword);
							pass.setMaxAge(24 * 60 * 60 * 1000);
							response.addCookie(pass);

							if (tbAppsys != null) {
								doRedirect(mapping, response, key, mappingUrl,
										fUser, fPassword, tbAppsys, request);
							} else {
								toMain(mapping, request, response, fUser, fPassword,
										mappingUrl);
								String loginType = request
										.getParameter("loginType");
								request.setAttribute("loginType", loginType);
								HttpSession session = request.getSession();
								session.setAttribute("loginType", loginType);
								ActionForward forward = new ActionForward();
								forward.setPath(mappingUrl);
								return mapping.findForward("success");
							}
							return null;

						} else {
							String loginType = request
									.getParameter("loginType");
							if (loginType != null && loginType.equals("1")) {
								request.setAttribute("loginFlag", str);
								return mapping.findForward("fail1");
							} else if (loginType != null
									&& loginType.equals("2")) {
								request.setAttribute("loginFlag", str);
								return mapping.findForward("fail2");
							} else if (loginType != null
									&& loginType.equals("3")) {
								request.setAttribute("loginFlag", str);
								return mapping.findForward("fail3");
							} else {
								request.setAttribute("loginFlag", str);
								return mapping.findForward("fail");
							}
						}

					}
					if (fUser.equals(cName) && fPassword.equals(cPWD)) {
						if (tbAppsys != null) {
							doRedirect(mapping, response, key, mappingUrl,
									cName, cPWD, tbAppsys, request);
						} else {
							String loginType = request
									.getParameter("loginType");
							request.setAttribute("loginType", loginType);
							HttpSession session = request.getSession();
							session.setAttribute("loginType", loginType);
							toMain(mapping, request, response, cName, cPWD,
									mappingUrl);
							return mapping.findForward("success");
						}
						return null;
					} else {
						String loginType = request.getParameter("loginType");
						if (loginType != null && loginType.equals("1")) {
							request.setAttribute("loginFlag", cStr);
							return mapping.findForward("fail1");
						} else if (loginType != null && loginType.equals("2")) {
							request.setAttribute("loginFlag", cStr);
							return mapping.findForward("fail2");
						} else if (loginType != null && loginType.equals("3")) {
							request.setAttribute("loginFlag", cStr);
							return mapping.findForward("fail3");
						} else {
							request.setAttribute("loginFlag", cStr);
							return mapping.findForward("fail");
						}
					}
					// } else {// ͨ����¼sso֮���ٵ�¼��ϵͳ��
					// doRedirect(response, key, mappingUrl, cName, cPWD,
					// tbAppsys, request);
					// return null;
					// }

				} else {
					request.setAttribute("loginFlag", cStr);
					return mapping.findForward("fail");
				}
			}

		} else {
			// ��Ϊsso ϵͳ ��������
			// ������֤cookie
			// cookieΪ�գ�ȥ�����û��������������֤��ͨ��д�����������û�cookie
			// cookie��Ϊ�գ��ɹ���¼
			if ((cName != null && cName.equals(""))
					|| (cPWD != null && cPWD.equals(""))) {
				// cookie��û�У���form����
				String fUser = "";
				String fPassword = "";

				// if(key!=null && key.equals("1"))
				// {
				fUser = userForm.getString("loginUser");
				fPassword = userForm.getString("password");
				if (!fUser.equals("") && !fPassword.equals("")) {
					//String str = passed(fUser, fPassword, key);
					String str = passed(fUser, fPassword, KOAL_CERT_SERIAL_NUMBER);
					if ("loginIn".equals(str)) {
						// ���ͨ����֤��дcookie

						Cookie c = new Cookie("loginUserForSL", fUser);
						c.setMaxAge(24 * 60 * 60 * 1000);
						response.addCookie(c);
						Cookie pass = new Cookie("passwordForSL", fPassword);
						pass.setMaxAge(24 * 60 * 60 * 1000);
						response.addCookie(pass);

						// ��ת
						if (tbAppsys != null) {
							doRedirect(mapping, response, key, mappingUrl,
									fUser, fPassword, tbAppsys, request);
						} else {
							toMain(mapping, request, response, fUser,
									fPassword, mappingUrl);
							ActionForward forward = new ActionForward();
							forward.setPath(mappingUrl);
							return mapping.findForward("success");
						}
						return null;
					} else {
						if (key.equals("6")) {
							return new ActionForward(
									"http://31.16.1.7/fx/zb/loginIndexDo.jsp?result=fail&loginUser="+fUser, true);
						} else {
							request.setAttribute("loginFlag", str);
							return mapping.findForward("fail");
						}
					}
				}
			} else {
				//�Ƿ�Ѵֵ��
				if(key!=null && !key.equals("") && key.equals("6")){
					String fUser = "";
					String fPassword = "";
					fUser = userForm.getString("loginUser");
					fPassword = userForm.getString("password");
					if (!fUser.equals("") && !fPassword.equals("")) {
						//String str = passed(fUser, fPassword, key);
						String str = passed(fUser, fPassword, KOAL_CERT_SERIAL_NUMBER);
						if ("loginIn".equals(str)) {
							// ���ͨ����֤��дcookie

							Cookie c = new Cookie("loginUserForSL", fUser);
							c.setMaxAge(24 * 60 * 60 * 1000);
							response.addCookie(c);
							Cookie pass = new Cookie("passwordForSL", fPassword);
							pass.setMaxAge(24 * 60 * 60 * 1000);
							response.addCookie(pass);

							// ��ת
							if (tbAppsys != null) {
								doRedirect(mapping, response, key, mappingUrl,
										fUser, fPassword, tbAppsys, request);
							} else {
								toMain(mapping, request, response, fUser,
										fPassword, mappingUrl);
								ActionForward forward = new ActionForward();
								forward.setPath(mappingUrl);
								return mapping.findForward("success");
							}
							return null;
						} else {
							return new ActionForward("http://31.16.1.7/fx/zb/loginIndexDo.jsp?result=fail&loginUser="+fUser, true);
						}
					}					
				}else{
					//���Ƿ�Ѵֵ��
					//String cStr = passed(cName, cPWD, key);
					String cStr = passed(cName, cPWD, KOAL_CERT_SERIAL_NUMBER);
					if ("loginIn".equals(cStr)) {
						// ��֤ͨ����ҳ����ת��URL
						/*
						 * String fUser = ""; String fPassword = ""; fUser =
						 * userForm.getString("loginUser"); fPassword =
						 * userForm.getString("password"); // ��֤���ϵ��û����Ƿ��Ѵ�����cookie //
						 * �� ֱ�ӵ�¼ // �� ��֤���ɹ���дcookie if (!fUser.equals(cName)) {
						 * String str = passed(fUser, fPassword, key); if
						 * ("loginIn".equals(str)) {
						 */// ���ͨ����֤��дcookie
						Cookie c = new Cookie("loginUserForSL", cName);
						c.setMaxAge(24 * 60 * 60 * 1000);
						response.addCookie(c);
						Cookie pass = new Cookie("passwordForSL", cPWD);
						pass.setMaxAge(24 * 60 * 60 * 1000);
						response.addCookie(pass);

						if (tbAppsys != null) {
							doRedirect(mapping, response, key, mappingUrl, cName,
									cPWD, tbAppsys, request);
						} else {
							toMain(mapping, request, response, cName, cPWD,
									mappingUrl);
							ActionForward forward = new ActionForward();
							forward.setPath(mappingUrl);
							return mapping.findForward("success");
						}
						return null;

						/*
						 * } else { request.setAttribute("loginFlag", str); return
						 * mapping.findForward("fail"); } } if (fUser.equals(cName) &&
						 * fPassword.equals(cPWD)) { doRedirect(response, key,
						 * mappingUrl, cName, cPWD, tbAppsys, request); return null; }
						 */

					} else {
						request.setAttribute("loginFlag", cStr);
						return mapping.findForward("fail");					
					}
				}
			}
		}
		try {
			TbAppsys root = getMappingUrl("0");
			if (root != null && !root.getUrl().equals("")) {
				// request.setAttribute("loginFlag", "false");
				response.sendRedirect(root.getUrl() + "?goto=" + key);
			}

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	private void doRedirect(ActionMapping mapping,
			HttpServletResponse response, String key, String mappingUrl,
			String name, String pwd, TbAppsys tbAppsys,
			HttpServletRequest request) {
		// isChild==1Ϊ��ϵͳ
		if (tbAppsys != null) {
			Integer isChild = Integer.valueOf(tbAppsys.getIschild().toString());
			if (isChild != null && isChild == 1) {
				if (tbAppsys.getCode().equals("6")) {
					mappingUrl += tbAppsys.getUrl() + "?result=succes&logName="
							+ name;
				} else {
					mappingUrl += tbAppsys.getUrl() + "?logName=" + name
							+ "&password=" + pwd;
				}
				try {
					response.sendRedirect(mappingUrl);
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			} else {
				try {
					response.sendRedirect(tbAppsys.getUrl());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}
	}

	private String passed(String name, String cpwd, String KOAL_CERT_SERIAL_NUMBER) {
		return userMgr.checkUser(name, cpwd, KOAL_CERT_SERIAL_NUMBER);
	}

	private TbAppsys getMappingUrl(String key) {
		return appSysMgr.getUrlByCode(key);
	}

	public void toMain(ActionMapping mapping, HttpServletRequest request,
			HttpServletResponse response, String name, String pwd,
			String mappingUrl) {
		// ��¼�û�д��session
		HttpSession session = request.getSession();
		
		String KOAL_CERT_SERIAL_NUMBER = (String)session.getAttribute("KOAL_CERT_SERIAL_NUMBER");
		TbUser user = this.userMgr.findByNameAndPwd(name, pwd);
		//		GCL MOD 2008-11-25 start
		boolean isfxzhb = false;
		if (DEPTID_JUOA.equals(user.getUserdept()))
			isfxzhb = this.userMgr.isForDeptOfUser (user, DEPTID_FXZHHB);
		request.setAttribute("ISFXZHB", isfxzhb);
		//session.setAttribute("ISFXZHB", isfxzhb);
		//GCL MOD 2008-11-25 end
		// TbUser user = this.userMgr.findUserByName(name);
		//ȡ�û���ӵ�еĶ���Ϣ�����Ľ�ɫ
		List inforolesUserList = this.functionMgr.findInfoRolesUserList(user);
		
		List firstLevelList = this.functionMgr.findFirstLevelRes(user);
		List secondLevelList = null;
		Map functionMap = new HashMap();
		TbFunction tbFunction = new TbFunction();
		List<TbFunction> firstLevelListT = new ArrayList();
		int firstSize = firstLevelList.size();
		for (int i = 0; firstSize > 0 && i < firstSize; i++) {
			tbFunction = (TbFunction) firstLevelList.get(i);
			secondLevelList = this.functionMgr.findSecondLevelRes(user,
					tbFunction);
			if (secondLevelList.size()!=0) {
				firstLevelListT.add(tbFunction);
			}
		}
		int temp = firstLevelListT.size();
		for (int i = 0; temp > 0 && i < temp; i++) {
			tbFunction = (TbFunction) firstLevelListT.get(i);
			secondLevelList = this.functionMgr.findSecondLevelRes(user,
					tbFunction);
			functionMap.put(tbFunction.getId(), secondLevelList);
		}
		
		System.out.println("------------------------user--------------------------------"+user);
		System.out.println("------------------------getDeptCode--------------------------------"+user.getDeptCode());
		if(user!=null && user.getDeptCode()!=null){
			TbDept dept = this.deptMgr.find(user.getDeptCode());
			if(dept.getParCode()!=null && !dept.getParCode().equals("")){
				TbDept parDept = this.deptMgr.find(dept.getParCode());
				if(parDept!=null){
					session.setAttribute("SYSTEM_USER_DEPT_ID", parDept.getId());
					session.setAttribute("SYSTEM_USER_DEPT_NAME", parDept.getName());
				}
			}
		}
//		//��ȡ�û���������
//		if(user!=null && user.getUserdept()!=null){
//			TbUserdept tbUserdept = this.iTbUserMgr.findByUserId(user.getUserdept());
//			if(tbUserdept !=null && tbUserdept.getId()!=null){
//				session.setAttribute("SYSTEM_USER_USERDEPT_SESSION", tbUserdept);
//			}
//		}
		//��ȡ��ǰ�û��Ĵ�������Ȩ��
		if(user!=null){
			getDBSYAuthInfo(request,user);
		}
		
		session.setAttribute("inforolesUserList", inforolesUserList);
		session.setAttribute("firstLevelList", firstLevelListT);
		session.setAttribute("functionMap", functionMap);
		session.setAttribute("SYSTEM_USER_SESSION", user);
		
		//��ӵ�ǰ�û����Ի�������Ϣ
		if(user!=null){
			String sql = this.functionMgr.getPersonalInfo(user);
			session.setAttribute("SYSTEM_USER_PERSONALINFO", sql);
			TbUserdept userDept = this.userMgr.findUserDeptByUserId(user.getId());
			if(userDept!=null){
				session.setAttribute("SYSTEM_USER_PERSONALINFO_DEPT", userDept.getName());
			}
		}
	}
	public ActionForward forwordSSL(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		AutoLoginAction a  = new AutoLoginAction();
		a.setUserMgr(this.userMgr);
		a.setFunctionMgr(this.functionMgr);
		a.setDeptMgr(this.deptMgr);
		a.setServlet(this.servlet);
		ActionForward  forward = a.execute(mapping, form, request, response);
		return forward;
	}
	/**
	 * ��ȡ��������Ȩ��
	 * @param request
	 * @return
	 * @author lqs 2008-09-26
	 */
	public void getDBSYAuthInfo(HttpServletRequest request,TbUser user){
		if(user!=null){
			//����������Ϣ����
			getDBSYByFunKey(user,functionMgr.DBSYAUDIT_XXGK,request);
			//����
			getDBSYByFunKey(user,functionMgr.DBSY_VEHICLE,request);
//			�������
			getDBSYByFunKey(user,functionMgr.DBSY_ADMINISTRAT,request);
//			�ҵ��ʼ�
			getDBSYByFunKey(user,functionMgr.DBSY_MYMAIL,request);
//			�ļ�����
			getDBSYByFunKey(user,functionMgr.DBSY_FILETRANSMISSION,request);
//			��������
			getDBSYByFunKey(user,functionMgr.DBSY_ARCHIVES,request);
//			�ҵĶ���
			getDBSYByFunKey(user,functionMgr.DBSY_MYMESSAGE,request);
//			������ѯ
			getDBSYByFunKey(user,functionMgr.DBSY_COUNSULT,request);
//			������ѯר��
			getDBSYByFunKey(user,functionMgr.DBSY_COUNSULTZB,request);
//			������ѯ���쵼����
			getDBSYByFunKey(user,functionMgr.DBSY_COUNSULTLEADAPPROVE,request);
//			����Ͷ��
			getDBSYByFunKey(user,functionMgr.DBSY_APPEAL,request);
//			����Ͷ��ר��
			getDBSYByFunKey(user,functionMgr.DBSY_APPEALZB,request);
//			����Ͷ�ߴ��쵼����
			getDBSYByFunKey(user,functionMgr.DBSY_APPEALLEADAPPROVE,request);
//			�ֳ��������
			getDBSYByFunKey(user,functionMgr.DBSY_DIRECTORWAIT,request);
//			�ֳ�����ת��
			getDBSYByFunKey(user,functionMgr.DBSY_DIRECTORZB,request);
//			�ֳ�������쵼����
			getDBSYByFunKey(user,functionMgr.DBSY_DIRECTORLEADAPPROVE,request);
//			������ɳ���
			getDBSYByFunKey(user,functionMgr.DBSY_XZXK_CC,request);		
//			������ɴ߰�
			getDBSYByFunKey(user,functionMgr.DBSY_XZXK_Urger,request);		
//			ί�й���ί��
			getDBSYByFunKey(user,functionMgr.DBSY_XZXK_Commission,request);				
		}
	}
	public void getDBSYByFunKey(TbUser user,String funKey,HttpServletRequest request){
		HttpSession session = request.getSession();
		Map map = (Map)session.getAttribute("SYSTEM_USER_DBSY");
		DBSY dbsy = this.functionMgr.getDBSYAuthInfo(user.getId(), funKey);
		if(dbsy!=null){
			if(map==null){
				map = new HashMap();
				map.put(funKey, dbsy);
			}else{
				map.put(funKey, dbsy);
			}
			session.setAttribute("SYSTEM_USER_DBSY", map);
		}
	}
	
}
