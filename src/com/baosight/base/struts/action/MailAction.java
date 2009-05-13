package com.baosight.base.struts.action;

import java.io.File;
import java.net.MalformedURLException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.baosight.mode.TbUser;
import com.baosight.struts.action.BaseDispatchAction;

public class MailAction extends BaseDispatchAction {
	public ActionForward getUnReadMailCount(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		TbUser user = (TbUser)request.getSession().getAttribute("SYSTEM_USER_SESSION");
		HttpSession session = request.getSession();
		Map map = (Map)session.getAttribute("SYSTEM_USER_DBSY");//Ȩ��
		
		//�õ����������ļ����͵����� 7
		int filesendCount = 0 ;
		if(map!=null && map.get("File transfer")!=null){
			filesendCount = super.tbUserOpeationMgr.count(user.getId(),"7");
		}
		
		//�õ�δ�����ŵ����� 8
		int myMessage = 0;
		//if(map!=null && map.get("DBSY_MYMESSAGE")!=null){
			myMessage = this.messagesMgr.getNotReadRecordNum(user.getId());
		//}
		
		//�õ��������ĳ��������� 11
		int vehiclesApplyNum = 0;
		if(map!=null && map.get("Vehicle Management")!=null){
			vehiclesApplyNum = super.tbVehiclesApplyMgr.findByProperty("status","2").size();
		}
		//��ҳ�������������� 13
		int archiveApplyCount = 0;
		if(map!=null && map.get("Document Management")!=null){
			archiveApplyCount = super.tbUserOpeationMgr.count(user.getId(),"13");
		}		
		//������Ϣ����
		int auditingCount = 0;//�����м�¼���� 9
		int willAuditCount = 0;//��������¼���� 90
		if(map!=null && map.get("GovInfoPub")!=null){
			auditingCount = super.tbUserOpeationMgr.count("","9");
			willAuditCount = super.tbUserOpeationMgr.count("","90");
		}
		//������� 66
		int administrat = 0;
		if(map!=null && map.get("dbsx")!=null){
			administrat = super.tbUserOpeationMgr.count(user.getId(),"66");
		}		 
//		������ѯ
		int counsultWaitCount = 0; //����˼�¼���� 10
		int counsultZBCount = 0; //ר���¼���� 100
		int counsultLeadApproveCount = 0; //���쵼�������� 101
		if(map!=null && map.get("Internet Advisory")!=null){
			counsultWaitCount = super.tbUserOpeationMgr.count("","10");
		}
		if(map!=null && map.get("Internet Advisory Office")!=null){
			counsultZBCount = super.tbUserOpeationMgr.count(user.getId(),"100");
		}
		if(map!=null && map.get("Online advice sought")!=null){
			counsultLeadApproveCount = super.tbUserOpeationMgr.count(user.getId(),"101");
		}

//		����Ͷ��
		int appealWaitCount = 0; //����˼�¼���� 20
		int appealZBCount = 0; //ר���¼���� 200
		int appealLeadApproveCount = 0; //���쵼�������� 201
		if(map!=null && map.get("Online complaints")!=null){
			appealWaitCount = super.tbUserOpeationMgr.count("","20");
		}
		if(map!=null && map.get("Online complaints Office")!=null){
			appealZBCount = super.tbUserOpeationMgr.count(user.getId(),"200");
		}
		if(map!=null && map.get("Online complaints consultation")!=null){
			appealLeadApproveCount = super.tbUserOpeationMgr.count(user.getId(),"201");
		}

//		�ֳ�����
		int directorWaitCount = 0; //����˼�¼���� 40
		int directorZBCount = 0; //ת���¼���� 400
		int directorLeadApproveCount = 0; //���쵼�������� 401
		if(map!=null && map.get("director_mailBox")!=null){
			directorWaitCount = super.tbUserOpeationMgr.count("","40");
		}
		if(map!=null && map.get("director_mailBox_transfer")!=null){
			directorZBCount = super.tbUserOpeationMgr.count(user.getId(),"400");
		}
		if(map!=null && map.get("director_mailBox_consult")!=null){
			directorLeadApproveCount = super.tbUserOpeationMgr.count(user.getId(),"401");
		}
		
//		����
		int resiverDocWaitCount = 0; //�����¼���� 300
		int resiverDocProcessCount = 0; //�����м�¼���� 301
		resiverDocWaitCount = super.tbUserOpeationMgr.count(user.getId(),"300");
		resiverDocProcessCount = super.tbUserOpeationMgr.count(user.getId(),"301");
		
//		����
		int sendDocWaitCount = 0; //�����¼���� 302
		int sendDocProcessCount = 0; //�����м�¼���� 303
		sendDocWaitCount = super.tbUserOpeationMgr.count(user.getId(),"302");
		sendDocProcessCount = super.tbUserOpeationMgr.count(user.getId(),"303");

//		������ɳ���
		int xzxkCC = 0; 
		if(map!=null && map.get("CC")!=null){
			xzxkCC = super.tbUserOpeationMgr.count(user.getId(),"50");
		}	
//		������ɴ߰�
		int xzxkUrger = 0; 
		if(map!=null && map.get("MyUrger")!=null){
			xzxkUrger = super.tbUserOpeationMgr.count(user.getId(),"60");
		}
		
//		ί�й���ί��
		int commission = 0; 
		if(map!=null && map.get("commission")!=null){
			commission = super.tbUserOpeationMgr.count(user.getId(),"70");
		}	
//		ί�й���ί��
		int commissionBe = 0; 
		if(map!=null && map.get("commission")!=null){
			commissionBe = super.tbUserOpeationMgr.count(user.getId(),"710");
		}		
		
		int myMail = 0;
		
		/*
		//		����ʼ���ַ���û���������
		String username = user.getUserAcc();
		String password = user.getPwd();
		String path = request.getRealPath("/")+ "/WEB-INF/classes/maiConfig.xml";
		String mailPop = this.parseXML(path);
		Session mailsession = Session.getInstance(System.getProperties(), null);
		mailsession.setDebug(false);
		Store store = mailsession.getStore("pop3"); // protocolΪ����Э�飬IMAP����POP
		
		store.connect(mailPop, -1, username, password);
		Folder folder = store.getFolder("INBOX");
		folder.open(Folder.READ_WRITE);

//		�õ�δ���ʼ������� 
		if(map==null || map.get("EMAIL")==null){
			myMail = folder.getUnreadMessageCount();
		}*/
		
		response.setContentType("text/xml;charset=UTF-8");
		String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		String str ="<message>" 
			+"<info>"+ archiveApplyCount+"</info>"
			+"<info>"+ myMail+ "</info>" 
			+"<info>"+ filesendCount + "</info>" 
			+"<info>"+ vehiclesApplyNum + "</info>"
			+"<info>"+ myMessage + "</info>" 
			+"<info>"+ auditingCount + "</info>"
			+"<info>"+ willAuditCount + "</info>"
			+"<info>"+ administrat + "</info>"
			+"<info>"+ counsultWaitCount + "</info>"
			+"<info>"+ counsultZBCount + "</info>"
			+"<info>"+ counsultLeadApproveCount + "</info>"
			+"<info>"+ appealWaitCount + "</info>"
			+"<info>"+ appealZBCount + "</info>"
			+"<info>"+ appealLeadApproveCount + "</info>"
			+"<info>"+ resiverDocWaitCount + "</info>"
			+"<info>"+ resiverDocProcessCount + "</info>"
			+"<info>"+ sendDocWaitCount + "</info>"
			+"<info>"+ sendDocProcessCount + "</info>"
			+"<info>"+ directorWaitCount + "</info>"
			+"<info>"+ directorZBCount + "</info>"
			+"<info>"+ directorLeadApproveCount + "</info>"
			+"<info>"+ xzxkCC + "</info>"
			+"<info>"+ xzxkUrger + "</info>"
			+"<info>"+ commission + "</info>"
			+"<info>"+ commissionBe + "</info>"
			+ "</message>";
		System.out.println("*******messages******str*:"+str);
		response.getWriter().write(xml + str);
		
		return null;
		
		/*Session mailsession = Session.getInstance(System.getProperties(), null);
		mailsession.setDebug(false);
		Store store = mailsession.getStore("pop3"); // protocolΪ����Э�飬IMAP����POP
		try{
			store.connect(mailPop, -1, username, password);
			Folder folder = store.getFolder("INBOX");
			folder.open(Folder.READ_WRITE);
			
			response.setContentType("text/xml;charset=UTF-8");
			// response.setHeader("Cache_Control", "no-cache");
			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
			//String str = "<message><info>"+archiveApplyCount+"</info><info>0</info></message>";
			String str ="<message>" 
				+"<info>"+ archiveApplyCount+"</info>"
				+"<info>"+ folder.getUnreadMessageCount() + "</info>" 
				+"<info>"+ filesendNum + "</info>" 
				+"<info>"+ vehiclesApplyNum + "</info>" 
				+"<info>"+ myMessage + "</info>" 
				+ "</message>";
			System.out.println(xml+str);
			response.getWriter().write(xml + str);
			System.out.print("δ���ʼ���" + folder.getUnreadMessageCount());
			folder.close(true);
			store.close();

			return null;
		}catch(Exception e){	
			response.setContentType("text/xml;charset=UTF-8");
			// response.setHeader("Cache_Control", "no-cache");
			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
			//String str = "<message><info>"+archiveApplyCount+"</info><info>0</info></message>";
			String str ="<message>" 
				+"<info>"+ archiveApplyCount+"</info>"
				+"<info>"+ 0 + "</info>" 
				+"<info>"+ filesendNum + "</info>" 
				+"<info>"+ vehiclesApplyNum + "</info>" 
				+"<info>"+ myMessage + "</info>" 
				+ "</message>";
			System.out.println(xml+str);
			response.getWriter().write(xml + str);
			
			store.close();
			return null;
		}*/
			
		
		
/*		String host = "pop3.163.com";
		String username = "52707324";
		String password = "......";

		Session mailsession = Session.getInstance(System.getProperties(), null);
		mailsession.setDebug(false);
		Store store = mailsession.getStore("pop3"); // protocolΪ����Э�飬IMAP����POP
		store.connect(host, -1, username, password);
		Folder folder = store.getFolder("INBOX");
		folder.open(Folder.READ_WRITE);
		int archiveApplyCount = super.tbUserOpeationMgr.archiveApplyCount();
		response.setContentType("text/xml;charset=UTF-8");
		// response.setHeader("Cache_Control", "no-cache");
		String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		String str = "<message><info>"+archiveApplyCount+"</info><info>"
				+ folder.getUnreadMessageCount() + "</info></message>";
		response.getWriter().write(xml + str);
		System.out.print("δ���ʼ���" + folder.getUnreadMessageCount());
		// request.setAttribute("unreadMessageCount",
		// folder.getUnreadMessageCount());
		folder.close(true);
		store.close();

		return null;*/		
	}
	
	// ��ȡ�ʼ�Э��
	public String parseXML(String filename) throws Exception {
		String mailPop = "";
		SAXReader saxReader = new SAXReader();
		try {
			Document document = saxReader.read(new File(filename));
			Element root = document.getRootElement();
			// ��������㣨MailConfig�������к��ӽڵ�
			for (Iterator iter = root.elementIterator(); iter.hasNext();) {
				Element element = (Element) iter.next();
				// �����ļ�����
				if (element.getName().equals("mail-pops")) {
					for (Iterator iterInner = element.elementIterator(); iterInner
							.hasNext();) {
						Element elementInner = (Element) iterInner.next();
						if (elementInner.getName().equals("allow-pop")) {
							mailPop = elementInner.getTextTrim();
						}
					}
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		} 
		return mailPop;
	}	
	
	public ActionForward getMyMail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//String temp = "http://31.16.1.80:88/test.asp?userName=&passWord=";
		TbUser user = (TbUser)request.getSession().getAttribute("SYSTEM_USER_SESSION");
		String username = user.getUserAcc();
		String password = user.getPwd();
		
		response.sendRedirect("http://31.16.1.80:88/test.asp?userName="+username+"&passWord="+password);
		return null;
	}	
}
