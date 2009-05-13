package com.baosight.base.struts.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestHandler;

import com.baosight.base.service.IDocServiceMgr;
import com.baosight.mode.TbDocAttach;
import com.baosight.mode.TbUser;
import com.baosight.struts.action.BaseDispatchAction;
import com.baosight.tools.MSWordManager;

/** 
 * MyEclipse Struts
 * Creation date: 08-04-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class DocAttachAction extends BaseDispatchAction {

	private Map<String,String> nameFileMap;

	public ActionForward delete(ActionMapping mapping,ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		if(id==null || id.length()<1){
			response.getOutputStream().println("ɾ��ʧ�ܣ�û��Id");
			return null;
		}
	 	String uploadFilePath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile\\";
	 	TbDocAttach uploadFile=docAttachMgr.findById(id);
	 	if(uploadFile.getPath()!=null && uploadFile.getPath().length()>0){
	 		uploadFilePath += uploadFile.getPath()+"\\";
	 	}
	 	File f=new File(uploadFilePath+uploadFile.getServerName());
	 	f.delete();
	 	this.docAttachMgr.delete(uploadFile);
	 	response.getOutputStream().println("ɾ���ɹ�");
	 	return null;
	}

	/**
	 * <p>Decription:��������webOfficeҳ��</p>
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @author heaton.cai
	 * <p>Create Time:2008-8-22</p>
	 */
	public ActionForward goDocContext(ActionMapping mapping,ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("fileId");
		TbUser user = getCurrentUser(request);
		String realPath = request.getRealPath("/");
		String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		if(id!=null && !"".equals(id)){
			TbDocAttach uploadFile=docAttachMgr.findById(id);
			request.setAttribute("contextPath", path+"UploadFile/"+uploadFile.getPath()+"/"+uploadFile.getServerName());
			request.setAttribute("fileName", uploadFile.getOriginallyName());
		}else{
			//��ģ�岢����Ϊ��.doc
			String fileTitle = request.getParameter("fileTitle");
			String sendMain = request.getParameter("sendMain");
			String sendSecond = request.getParameter("sendSecond");
			String topicWord = request.getParameter("topicWord");
			String type = request.getParameter("dtype");
			this.openTmpAndSaveNewDoc(user,realPath, fileTitle, sendMain, sendSecond, topicWord, type);
			request.setAttribute("contextPath", path+"UploadFile/template_fw/temp.doc");
			request.setAttribute("fileName", "");
		}
	 	return mapping.findForward("goDocContext");
	}

	protected void openTmpAndSaveNewDoc(TbUser user, String path, String fileTitle, String sendMain, 
			String sendSecond, String topicWord, String type) {
		 MSWordManager msWordManager = new MSWordManager();
		  try {
			   String now = DateUtil.formatDate(new Date(), "yyyy-MM-dd");
			   String  year = now.substring(0,4);
			   String month = now.substring(5,7);
			   String  day = now.substring(8,10);
			   
			   if ("1".equals(type) && IDocServiceMgr.DEPT_TYPE_INFO.equals(user.getUserdept())) {
				   msWordManager.openDocument(path+"UploadFile/template_fw/template_xxzxxz.doc");//��Ϣ������������
			   }
			   else if ("2".equals(type) && IDocServiceMgr.DEPT_TYPE_INFO.equals(user.getUserdept())) {
				   msWordManager.openDocument(path+"UploadFile/template_fw/template_xxzxdw.doc");//��Ϣ���ĵ�ί����
			   }
			   else if ("juOAXZ".equals(type) && IDocServiceMgr.DEPT_TYPE_JUOA.equals(user.getUserdept())) {
				   msWordManager.openDocument(path+"UploadFile/template_fw/template_joaxz.doc");//����������
			   }
			   else if ("juOADW".equals(type) && IDocServiceMgr.DEPT_TYPE_JUOA.equals(user.getUserdept())) {
				   msWordManager.openDocument(path+"UploadFile/template_fw/template_joadw.doc");//�ֵ�ί����
			   }
			   else
				   msWordManager.openDocument(path+"UploadFile/template_fw/template_xxzxxz.doc");
			   msWordManager.moveStart();
			   if(msWordManager.find("fileTitle")){
				   System.out.println("fileTitle");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("fileTitle", fileTitle);
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("sendMain")){
				   System.out.println("sendMain");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("sendMain", sendMain);
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("sendSecond")){
				   System.out.println("sendSecond");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("sendSecond", sendSecond);
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("topicWord")){
				   System.out.println("topicWord");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("topicWord", topicWord);
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("yyyy")){
				   System.out.println("yyyy");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("yyyy", year+"");
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("nian")){
				   System.out.println("wyyyy");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("nian", year+"");
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("yue")){
				   System.out.println("wmm");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("yue", month+"");
			   }
			   msWordManager.moveStart();
			   if(msWordManager.find("ri")){
				   System.out.println("wdd");
				   msWordManager.moveLeft(1);
				   msWordManager.replaceText("ri", day+"");
			   }
			   msWordManager.save(path+"UploadFile\\template_fw\\temp.doc");
		  } catch (Exception e) {
		   e.printStackTrace();
		  }
		  msWordManager.close();
	}
	
	public ActionForward download(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		String id=(String)request.getParameter("id");
		TbDocAttach fileReocrd  = this.docAttachMgr.findById(id);
	    String fullPath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile\\";
	    if(fileReocrd.getPath()!=null && fileReocrd.getPath().length()>0){
	    	fullPath += fileReocrd.getPath()+"\\";
	    }
	    fullPath += fileReocrd.getServerName();
	    FileInputStream file = new FileInputStream(fullPath);
	    String filename = new String(fileReocrd.getOriginallyName().getBytes("GBK"),"ISO_8859_1");
	    response.setContentType("application/octet-stream;charset=GBK");
	    response.setHeader("Content-Disposition", "attachment;filename="+ filename);
	    ServletOutputStream out = response.getOutputStream();
	    out.flush();
	    byte buffer[] = new byte[1024];
	    int size;
	    while ((size = file.read(buffer)) != -1) {
	        out.write(buffer, 0, size);
	        out.flush();
	    }

	    file.close();
	    out.close();
		return null;
	}

	/**
	 * <p>Decription:�����ϴ����ļ�</p>
	 * @param form
	 * @param type
	 * @param foreignId
	 * @param path
	 * @throws IOException
	 * @author heaton.cai
	 * <p>Create Time:2008-8-4</p>
	 */
	public void saveAttachFile(ActionForm form,String type,String foreignId,String path) throws IOException{
        //�ϴ�����
		MultipartRequestHandler multipartRequestHandler=form.getMultipartRequestHandler();
		Hashtable files =multipartRequestHandler.getFileElements();
		if(files.size()>0){
			this.uploadFile(files,type,foreignId,path);
		}
	}

	/**
	 * <p>Decription:�ļ��ϴ�</p>
	 * @param file ��Ҫ�ϴ����ļ�
	 * @param type ��������
	 * @param foreignId �ⲿId
	 * @param path ����·��
	 * @return Id
	 * @throws IOException
	 * @author heaton.cai
	 * <p>Create Time:2008-10-15</p>
	 */
	public String saveAttachFile(FormFile file,String type,String foreignId,String path) throws IOException{
        //�ϴ��ļ�
		String filePath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile";
		if(path!=null && path.length()>0){
			filePath += "/"+path;
		}
		String serverfileName=this.fileUpload(file, filePath);
		String filename = file.getFileName().trim();  
		TbDocAttach tbUploadFile = new TbDocAttach(foreignId,path,filename,serverfileName,type);
		super.docAttachMgr.save(tbUploadFile);
		return tbUploadFile.getId();
	}

	protected void uploadFile(Hashtable files,String type,String foreignId,String path) throws IOException{
		String filePath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile";
		if(path!=null && path.length()>0){
			filePath += "/"+path;
		}
        String serverfileName="";
        TbDocAttach tbUploadFile=null;
		for (Enumeration e = files.keys(); e.hasMoreElements();) {
			String key = (String) e.nextElement();
			FormFile formfile = (FormFile) files.get(key);
			serverfileName=this.fileUpload(formfile, filePath);
			String filename = formfile.getFileName().trim();  
			tbUploadFile =new TbDocAttach(foreignId,path,filename,serverfileName,getFileType(key,type));
			super.docAttachMgr.save(tbUploadFile);
		}
	}

	protected String fileUpload(FormFile file, String uploadPath) throws IOException{
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
	public TbDocAttach saveAttachFileForWebOff(ActionForm form,String type,String foreignId,String path,String webOfficeTitle,TbDocAttach att) throws IOException{
        //�ϴ�����
		MultipartRequestHandler multipartRequestHandler=form.getMultipartRequestHandler();
		Hashtable files =multipartRequestHandler.getFileElements();
		if(files.size()>0){
			return this.uploadFileForWebOff(files,type,foreignId,path,webOfficeTitle,att);
		}else{
			return null;
		}
	}


	protected TbDocAttach uploadFileForWebOff(Hashtable files,String type,String foreignId,String path,String webOfficeTitle,TbDocAttach att) throws IOException{
		String filePath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile";
		if(path!=null && path.length()>0){
			filePath += "/"+path;
		}
        String serverfileName="";
        TbDocAttach tbUploadFile=null;
		for (Enumeration e = files.keys(); e.hasMoreElements();) {
			FormFile formfile = (FormFile) files.get(e.nextElement());			
			if(att==null){
				serverfileName=this.fileUpload(formfile, filePath);
				tbUploadFile =new TbDocAttach(foreignId,path,webOfficeTitle,serverfileName,type);
				super.docAttachMgr.save(tbUploadFile);
			}else{
				this.fileUploadForWebOff(formfile, filePath,att.getServerName());
				if(webOfficeTitle!=null && !"".equals(webOfficeTitle)){
					att.setOriginallyName(webOfficeTitle);
				}
				docAttachMgr.save(att);
				tbUploadFile = att;
			}
		}
		return tbUploadFile;
	}
	protected String fileUploadForWebOff(FormFile file, String uploadPath,String filename) throws IOException{
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

	protected String getFileType(String key,String daf){
		if(nameFileMap==null || nameFileMap.size()<1){
			return daf;
		}
		Iterator<String> iter = nameFileMap.keySet().iterator();
		while(iter.hasNext()){
			String fileKey = iter.next();
			if(key.indexOf(fileKey)>-1){
				return nameFileMap.get(fileKey);
			}
		}
		return daf;
	}

	public void setNameFileMap(Map<String, String> nameFileMap) {
		this.nameFileMap = nameFileMap;
	}

	public static final String TYPE_WARNING_PUB = "30";//Ԥ������
	public static final String TYPE_TECH_DISCOURE = "21";//���ķ���
	public static final String TYPE_TECH_STANDARD = "22";//��׼�淶
	public static final String TYPE_TECH_RESULT = "23";//���гɹ�����
	public static final String TYPE_TECH_RESULT_TECH = "24";//���гɹ������ĵ�
	public static final String TYPE_TECH_RESULT_MANG = "25";//���гɹ������ĵ�
	public static final String TYPE_TECH_MAP_APPROVE = "26";//��ͼ����������
	public static final String TYPE_TECH_MAP_AGBOOK = "27";//��ͼ�����ŵ��
	public static final String PATH_TECH = "/tech";//���й�����λ��
	public static final String PATH_WARING_PUB = "/warningPub";//Ԥ����������λ��
}