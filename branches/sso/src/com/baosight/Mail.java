package com.baosight;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class Mail {

    public static void main(String args[]) throws Exception 
    { 
        String host = "pop3.163.com"; 
//        String from =  "52707324@163.com"; 
//        String to = "maodongfei65@hotmail.com"; 
        String username = "52707324"; 
        String password = "......"; 
//
//        // Get system properties 
//        // Properties props = System.getProperties(); �ܶ��������������ģ���ʵ���������ã���������applet�� 
//        Properties props = new Properties(); 
//
//        // Setup mail server 
//        props.put("mail.smtp.host", host); 
//        props.put("mail.smtp.auth", "true"); //��������ͨ����֤ 
//
//        // Get session 
//        Session session = Session.getDefaultInstance(props); 
//
//        // watch the mail commands go by to the mail server 
//        session.setDebug(true); 
//
//        // Define message 
//        MimeMessage message = new MimeMessage(session); 
//        message.setFrom(new InternetAddress(from)); 
//        message.addRecipient(Message.RecipientType.TO, 
//          new InternetAddress(to)); 
//        message.setSubject("Hello JavaMail"); 
//        message.setText("Welcome to JavaMail"); 
//
//        // Send message 
//        message.saveChanges(); 
//        Transport transport = session.getTransport("smtp"); 
//        transport.connect(host, username, password); 
//        transport.sendMessage(message, message.getAllRecipients()); 
//        transport.close(); 
    	Session mailsession=Session.getInstance(System.getProperties(),null); 
    	mailsession.setDebug(false); 
    	Store store=mailsession.getStore("pop3"); //protocolΪ����Э�飬IMAP����POP 
    	store.connect(host,-1,username,password); 
    	Folder folder = store.getFolder("INBOX"); 
    	try{ 
    	folder.open(Folder.READ_WRITE); 
    	} 
    	catch(MessagingException ex){ 
    	folder.open(Folder.READ_ONLY); 
    	} 
    	System.out.print("δ���ʼ���"+folder.getUnreadMessageCount()); 
    	folder.close(true); 
    	store.close(); 

    } 



}
