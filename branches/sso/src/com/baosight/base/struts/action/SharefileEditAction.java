package com.baosight.base.struts.action;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestHandler;
import org.apache.struts.validator.DynaValidatorForm;

import com.baosight.base.service.ITbShareFileMgr;
import com.baosight.mode.TbShareFile;
import com.baosight.mode.TbUser;

public class SharefileEditAction extends Action {
	
	
	private ITbShareFileMgr tbShareFileMgr;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Boolean maxLengthExceeded = (Boolean) request.getAttribute(MultipartRequestHandler.ATTRIBUTE_MAX_LENGTH_EXCEEDED);
		String method = request.getParameter("method");
		if ((maxLengthExceeded != null) && (maxLengthExceeded.booleanValue()))
			return mapping.findForward("error");
	
		if(method.equals("add"))
			return this.add(mapping, form, request, response);
		
		if(method.equals("modify"))
			return this.modify(mapping, form, request, response);
		return null;
	}
	
	private ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String action = request.getParameter("action");
		
		if (StringUtils.isBlank(action))
			return mapping.findForward("add");
		if (action.equals("submit")){
			//����������
			String uploadPath= this.getServlet().getServletContext().getRealPath("/")+"UploadFile/Resources Sharing";
			TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
			String userId = user.getId();
			String explanation = (String) ((DynaValidatorForm) form).get("explanation");
			String type = (String) ((DynaValidatorForm) form).get("type");
			String isShare = (String) ((DynaValidatorForm) form).get("isShare");
			FormFile file = (FormFile) ((DynaValidatorForm) form).get("file");
			//�ϴ�����
			String serverName=this.fileUpload(file, uploadPath);
			
			TbShareFile saveObject = new TbShareFile();
			saveObject.setUserid(userId);
			saveObject.setExplanation(explanation);
			saveObject.setIsShare(isShare);
			saveObject.setType(type);
			saveObject.setOriginallyName(file.getFileName());
			saveObject.setServerName(serverName);
          
			this.tbShareFileMgr.save(saveObject);
		}
		return mapping.findForward("success");
	}
	
	private ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws java.text.ParseException, SQLException, IOException {
		
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		if (StringUtils.isNotBlank(action)&&action.equals("submit")) {
			//���޸Ĳ���
			String type = (String) ((DynaValidatorForm) form).get("type");
			String isShare = (String) ((DynaValidatorForm) form).get("isShare");
			String explanation = (String) ((DynaValidatorForm) form).get("explanation");
			
			TbShareFile updateObject = this.tbShareFileMgr.findById(id);
			updateObject.setExplanation(explanation);
			updateObject.setIsShare(isShare);
			updateObject.setType(type);

			tbShareFileMgr.update(updateObject);
		} 
		else if(StringUtils.isNotBlank(id)){
			//��ת�༭ҳ�����úý�Ҫ�޸ĵ��ֶ�
			
			TbShareFile updateObject = tbShareFileMgr.findById(id);
			request.setAttribute("fileName", updateObject.getOriginallyName());
			((DynaValidatorForm) form).set("id", id);
			((DynaValidatorForm) form).set("explanation",updateObject.getExplanation());
			((DynaValidatorForm) form).set("isShare",updateObject.getIsShare());
			((DynaValidatorForm) form).set("type",updateObject.getType());
			
			return mapping.findForward("add");
		}
		return mapping.findForward("success");
	}
	
	/**
	 * ͨ��IO Stream�ϴ�����������
	 * @param file 
	 * @param uploadPath �ϴ���Ŀ¼
	 * @return  ����һ��UUID��Ϊ�洢���ļ������浽������
	 * @throws IOException
	 */
	private String fileUpload( FormFile file, String uploadPath) throws IOException{
		String filename=UUID.randomUUID().toString();
		java.io.InputStream stream = file.getInputStream();//���ļ����� 
        OutputStream bos = new FileOutputStream(uploadPath + "/"+ filename); 
        //����һ���ϴ��ļ�������������ϴ��ļ�����webӦ�õĸ�Ŀ¼�� 
        int bytesRead = 0; 
        byte[] buffer = new byte[8192]; 
        while ( (bytesRead = stream.read(buffer, 0, 8192)) != -1) { 
        	bos.write(buffer, 0, bytesRead);//���ļ�д������� 
         }
         bos.close(); 
         stream.close(); 
         //����һ��UUID��Ϊ�ļ������浽WEB������
         return filename;
	}

	public void setTbShareFileMgr(ITbShareFileMgr tbShareFileMgr) {
		this.tbShareFileMgr = tbShareFileMgr;
	}
	

	
}
