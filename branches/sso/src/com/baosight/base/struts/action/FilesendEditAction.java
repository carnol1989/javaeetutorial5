package com.baosight.base.struts.action;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import oracle.sql.CLOB;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestHandler;
import org.apache.struts.validator.DynaValidatorForm;
import org.hibernate.Hibernate;
import org.hibernate.lob.SerializableClob;

import com.baosight.base.dao.impl.TbFilesendAttachmentDAOImpl;
import com.baosight.base.dao.impl.TbUserDAOImpl;
import com.baosight.base.dao.impl.TbUserOpeationDAOImpl;
import com.baosight.base.service.ITbFilesendMgr;
import com.baosight.base.service.ITbUserOpeationMgr;
import com.baosight.mode.TbFilesend;
import com.baosight.mode.TbFilesendAttachment;
import com.baosight.mode.TbUser;
import com.baosight.mode.TbUserOpeation;
public class FilesendEditAction extends Action {

	private ITbFilesendMgr tbFilesendMgr;
	private TbFilesendAttachmentDAOImpl tbFilesendAttachmentDAO;
	private TbUserDAOImpl tbUserDAO;
	private ITbUserOpeationMgr tbUserOpeationMgr;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Boolean maxLengthExceeded = (Boolean) request.getAttribute(MultipartRequestHandler.ATTRIBUTE_MAX_LENGTH_EXCEEDED);
		String method = request.getParameter("method");
		if ((maxLengthExceeded != null) && (maxLengthExceeded.booleanValue()))
			return mapping.findForward("error");
	
		if(method.equals("add"))
			return this.add(mapping, form, request, response);
		
		if(method.equals("view"))
			return this.view(mapping, form, request, response);

		if(method.equals("download"))
			return this.download(mapping, form, request, response);
		
		return null;
	}
	
	private ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws java.text.ParseException, IOException, SerialException, SQLException {
		
		String action = request.getParameter("action");
		
		if (action.equals("add"))
			return mapping.findForward("add");
		if (action.equals("submit")){
			//����������
			TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
			String userId = user.getId();
			String receiverId = (String) ((DynaValidatorForm) form).get("receiver")+",";
			String ccId = (String) ((DynaValidatorForm) form).get("cc");
			if(StringUtils.isNotBlank(ccId))
				ccId+=",";
			String stId = (String) ((DynaValidatorForm) form).get("st");
			if(StringUtils.isNotBlank(stId))
				stId+=",";
			String subject = (String) ((DynaValidatorForm) form).get("subject");
			String content = (String) ((DynaValidatorForm) form).get("content");
			TbFilesend Filesend = new TbFilesend();
			Filesend.setSenderId(userId);
			Filesend.setReceiverId(Hibernate.createClob(receiverId));
			Filesend.setCcId(Hibernate.createClob(ccId));
			Filesend.setStId(Hibernate.createClob(stId));
			Filesend.setSubject(subject);
			Filesend.setContent(content);
			Filesend.setSendDt(new Date());
			Filesend.setSendType(new Long(1));
			Filesend.setIsView("0");
            //�ϴ�����
			MultipartRequestHandler multipartRequestHandler=form.getMultipartRequestHandler();
			Hashtable files =multipartRequestHandler.getFileElements();
			Set<TbFilesendAttachment> tbFilesendAttachments=this.uploadFile(files, Filesend);
			Filesend.setTbFilesendAttachments(tbFilesendAttachments);
			String[] receiverArray = receiverId.split(",");
			for (String receiver : receiverArray) {
				this.tbUserOpeationMgr.byUseridSaveOrUpdate(receiver, "7",true);
			}
			this.tbFilesendMgr.save(Filesend);
		}
		return mapping.findForward("success");
	}
	
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		//�ظ�������
		if (StringUtils.isNotBlank(action)) {
			TbUser user = (TbUser) request.getSession().getAttribute("SYSTEM_USER_SESSION");
			String userId = user.getId();
			//���޸Ĳ���
			String receiverId = (String) ((DynaValidatorForm) form).get("forwardReceiver");
			String content = (String) ((DynaValidatorForm) form).get("forwardContent");
			String subject = (String) ((DynaValidatorForm) form).get("subject");
			String sendId = (String) ((DynaValidatorForm) form).get("sendId");
			String reId=(String) ((DynaValidatorForm) form).get("receiver");
			TbFilesend tbFilesend = new TbFilesend();
			tbFilesend.setSenderId(userId);
			
			tbFilesend.setSubject(subject);
			tbFilesend.setContent(content);
			tbFilesend.setSendDt(new Date());
			tbFilesend.setIsView("0");
			//ת��
			if(action.equals("forward")){
				tbFilesend.setSendType(new Long(2));
				tbFilesend.setReceiverId(Hibernate.createClob(receiverId));
				Set newtbFilesendAttachments=new HashSet();
				Set tbFilesendAttachments=this.tbFilesendMgr.findById(id).getTbFilesendAttachments();
				Iterator iter=tbFilesendAttachments.iterator();
				while(iter.hasNext()){
					TbFilesendAttachment newfilesendAttachment=new  TbFilesendAttachment();
					TbFilesendAttachment filesendAttachment=(TbFilesendAttachment)iter.next();
					newfilesendAttachment.setOriginallyName(filesendAttachment.getOriginallyName());
					newfilesendAttachment.setServerName(filesendAttachment.getServerName());
					newfilesendAttachment.setTbFilesend(tbFilesend);
					newtbFilesendAttachments.add(newfilesendAttachment);
				}
				tbFilesend.setTbFilesendAttachments(newtbFilesendAttachments);
			}
			else if(action.equals("reversion")){
				tbFilesend.setSendType(new Long(3));
				tbFilesend.setReceiverId(Hibernate.createClob(sendId));
				this.tbUserOpeationMgr.byUseridSaveOrUpdate(reId, "7",false);
				this.tbUserOpeationMgr.byUseridSaveOrUpdate(sendId, "7",true);
			}
			
			this.tbFilesendMgr.save(tbFilesend);
		} 
		else if(StringUtils.isNotBlank(id)){
			//��ת�༭ҳ�����úý�Ҫ�޸ĵ��ֶ�
			TbFilesend tbFilesend = this.tbFilesendMgr.findById(id);
			((DynaValidatorForm) form).set("id", id);
			String sendDt =DateFormatUtils.ISO_DATETIME_FORMAT.format(tbFilesend.getSendDt()).replaceAll("T"," ");
			String sendName=this.getUserNamebyId(tbFilesend.getSenderId());
			String receiverId=StringUtils.chomp(this.getStringByClobType(tbFilesend.getReceiverId()),"," );
			String ReceiverName=this.getUserNamebyId(receiverId);
			((DynaValidatorForm) form).set("sendName",sendName);
			((DynaValidatorForm) form).set("sendId",tbFilesend.getSenderId());
			((DynaValidatorForm) form).set("receivername",ReceiverName);
			((DynaValidatorForm) form).set("sendDt",sendDt);
			((DynaValidatorForm) form).set("subject",tbFilesend.getSubject());
			((DynaValidatorForm) form).set("content",tbFilesend.getContent());
			request.setAttribute("files", tbFilesend.getTbFilesendAttachments());
			
			String isView = tbFilesend.getIsView();
			if(!isView.equals("1")){
				tbFilesend.setIsView("1");
				this.tbFilesendMgr.update(tbFilesend);
				this.tbUserOpeationMgr.byUseridSaveOrUpdate(receiverId, "7" ,false);
			}
			return mapping.findForward("view");
		}
		return mapping.findForward("success");
	}
	
	public ActionForward download(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id=(String)request.getParameter("id");
		TbFilesendAttachment attachmentfileReocrd  = this.tbFilesendAttachmentDAO.findById(id);
	    String fullPath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile\\File transfer\\"+attachmentfileReocrd.getServerName();    
	    FileInputStream file = new FileInputStream(fullPath);   
	    //��������ļ�����������
	    String filename = new String(attachmentfileReocrd.getOriginallyName().getBytes("GBK"),"ISO_8859_1");
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
	 * �ϴ������ļ��������ļ���¼��
	 * @param files     �ļ���
	 * @param Archives  �����ļ������ĵ�����¼
	 * @return �����ļ���¼��
	 * @throws IOException
	 */
	private Set<TbFilesendAttachment> uploadFile(Hashtable files,TbFilesend filesend) throws IOException{
	
		String filePath = this.getServlet().getServletContext().getRealPath("/")+"UploadFile\\File transfer";
		Set<TbFilesendAttachment> tbFilesendAttachments=new HashSet<TbFilesendAttachment>();
        String serverfileName="";
        TbFilesendAttachment filesendAttachment=null;
		for (Enumeration e = files.keys(); e.hasMoreElements();) {
			String key = (String) e.nextElement();
			FormFile formfile = (FormFile) files.get(key);
			serverfileName=this.fileUpload(formfile, filePath);//�õ��ϴ��ļ�����ļ���
			String filename = formfile.getFileName().trim(); //�ļ���    
			filesendAttachment =new TbFilesendAttachment(filesend,filename,serverfileName);
			tbFilesendAttachments.add(filesendAttachment);
		}
		return tbFilesendAttachments;
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
	
	/**
	 * 
	 * @param userId �û�ID <br/>
	 * ��ʽ:9f9083fd193616a301193643d3d80073,9f9083fd193616a3011936445a3e0075,
	 * @return �û��� ��ʽ:����,����
	 */
	private String getUserNamebyId(String userId){
		String[] ids=StringUtils.split(userId,',');
		String result="";
		for(int i=0;i<ids.length;i++)
			result+=this.tbUserDAO.findById(ids[i]).getName()+",";
		result=StringUtils.chomp(result,",");
		return result;
	}
	/**
	 * CLOBת��String
	 * @param c 
	 * @return
	 * @throws SQLException
	 * @throws Exception
	 */
	private String getStringByClobType(Clob c) throws SQLException, Exception{
		SerializableClob  sc= (SerializableClob)c;
		Clob wrapclob = sc.getWrappedClob();
		CLOB clob = (CLOB)wrapclob;
		Reader is = clob.getCharacterStream ();
	    BufferedReader br = new BufferedReader ( is );
	    String s = br.readLine ();
	    String result = "";
	    while ( s != null ){
	    	result += s ;
	         s = br.readLine ();
	    }
	    br.close();
	    is.close();
		return result;
	}
	
	public void setTbFilesendMgr(ITbFilesendMgr tbFilesendMgr) {
		this.tbFilesendMgr = tbFilesendMgr;
	}

	public void setTbFilesendAttachmentDAO(
			TbFilesendAttachmentDAOImpl tbFilesendAttachmentDAO) {
		this.tbFilesendAttachmentDAO = tbFilesendAttachmentDAO;
	}

	public void setTbUserDAO(TbUserDAOImpl tbUserDAO) {
		this.tbUserDAO = tbUserDAO;
	}

	public void setTbUserOpeationMgr(ITbUserOpeationMgr tbUserOpeationMgr) {
		this.tbUserOpeationMgr = tbUserOpeationMgr;
	}


	
}
