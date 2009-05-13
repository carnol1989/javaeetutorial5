package com.baosight.layout.struts.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.layout.*;
import com.baosight.layout.portlet.*;
import com.baosight.layout.table.*;
import com.baosight.mode.TbUser;

public class LayoutAction extends DispatchAction {

	
	

	public ActionForward execute(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boolean bSuccess = true;
		UserEO user = null;
		LayoutEO layout = null;
		HttpSession session = ((HttpServletRequest) request).getSession(true);//���session
		String userId = ((TbUser) session.getAttribute("SYSTEM_USER_SESSION")).getId();//���session��user��ֵ
		if (userId == null || userId.equals("")) {//���user��ֵ������
			bSuccess = false;
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");//����login.jspҳ��
			dispatcher.forward(request, response);
		} else {//���user��ֵ����
			user = new UserEO(userId);//����UserEO����
			layout = LayoutEO.getInstance(user);//��ø�User�Ĳ�������
		}
		String action = request.getParameter("action");//���action��ֵ
		if (bSuccess && action != null && action.equals("close")) {//�������close,ɾ���ô���
			String id = request.getParameter("id");
			String side = request.getParameter("side");
			if (side != null && side.equals("right")) {
				String s = layout.getColNarrowRight();
				layout.setColNarrowright(Util.replaceAWithB(s, id, ""));
			} else if (side != null && side.equals("left")) {
				String s = layout.getColNarrowLeft();
				layout.setColNarrowLeft(Util.replaceAWithB(s, id, ""));

			} else if (side != null && side.equals("wide"))
			{
				String s = layout.getColWide();
				layout.setColWide(Util.replaceAWithB(s, id, ""));
			}
			bSuccess = layout.ToDb();
		}else if (bSuccess && action != null && action.equals("change"))//�������change,���±��沼��
		{
			String left = request.getParameter("left");//�����಼��
			String wide = request.getParameter("wide");//����м䲼��
			String right = request.getParameter("right");//����Ҳ಼��
			layout.setColNarrowLeft(left);
			layout.setColWide(wide);
			layout.setColNarrowright(right);
			bSuccess = layout.ToDb();//�������ݿ�
		}else if (bSuccess && action != null && action.equals("add"))//�������add,����²���
		{
			String id = request.getParameter("id");
			id = id + ",4,2,1";
			String []idList = id.split(",");
			layout.setIdList(idList);
			layout.ToAddDb(userId);//�������ݿ�		
		}		
		return null;
	}

}
