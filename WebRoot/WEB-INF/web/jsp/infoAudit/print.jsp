<%@ page language="java"  pageEncoding="GBK"%>


<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String needPrintURL =(String) request.getAttribute("needPrintURL");
	String isOrNotPrint =(String) request.getAttribute("isOrNotPrint");
	String printPath=needPrintURL+"&isOrNotPrint="+isOrNotPrint;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<head>
		<base href="<%=basePath%>">

		<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<SCRIPT LANGUAGE=javascript>
		<!--
		// ---------------------=== �ؼ���ʼ��WebOffice���� ===---------------------- //
		function WebOffice1_NotifyCtrlReady() {
			document.all.WebOffice1.LoadOriginalFile("<%=printPath%>", "doc");
		}
		
		
		// ---------------------== �ر�ҳ��ʱ���ô˺������ر��ļ� ==---------------------- //
		function window_onunload() {
			document.all.WebOffice1.Close();
		}
		 
		// ---------------------------== ����ĵ����� ==---------------------------------- //
		function UnProtect() {
			document.all.WebOffice1.ProtectDoc(0,1, myform.docPwd.value);
		}
		
		// ---------------------------== �����ĵ����� ==---------------------------------- //
		function ProtectFull() {
			document.all.WebOffice1.ProtectDoc(1,1, myform.docPwd.value);
		}
		// -----------------------------== �޶��ĵ� ==------------------------------------ //
		function ProtectRevision() {
			document.all.WebOffice1.SetTrackRevisions(1) 
		}
		
		// -----------------------------== �����޶� ==------------------------------------ //
		function UnShowRevisions() {
			document.all.WebOffice1.ShowRevisions(0);
		}
		
		// --------------------------== ��ʾ��ǰ�޶� ==---------------------------------- //
		function ShowRevisions() {
			document.all.WebOffice1.ShowRevisions(1);
		
		}
		
		// -------------------------== ���ܵ�ǰ�����޶� ==------------------------------- //
		function AcceptAllRevisions() {
		 	document.all.WebOffice1.SetTrackRevisions(4);
		}
		
		// ---------------------------== ���õ�ǰ�����û� ==------------------------------- //
		function SetUserName() {
			if(myform.UserName.value ==""){
				alert("�û�������Ϊ��")
				myform.UserName.focus();
				return false;
			}
		 	document.all.WebOffice1.SetCurrUserName(myform.UserName.value);
		}
		
		// -------------------------=== ������ǩ�׼Ӻ�ͷ ===------------------------------ //
		function addBookmark() {
			document.all.WebOffice1.SetFieldValue("mark_1", "���������Ϣ�������޹�˾", "::ADDMARK::");			
		}
		
		// -------------------------=== ������ǩ�׼Ӻ�ͷ ===------------------------------ //
		function addRedHead() {
			document.all.WebOffice1.SetFieldValue("mark_1", "", "::ADDMARK::");			// �����ǩ
			document.all.WebOffice1.SetFieldValue("mark_1", "tmp1.doc", "::FILE::");
		}
		
		// -----------------------------== ������ҳ ==------------------------------------ //
		function return_onclick() {
			//alert("�����ɹ�!");
			history.back();
		}
		// �򿪱����ļ�
		function docOpen() {
		var myform = document.forms[0];
			if(myform.DocFilePath.value == "") {
				alert("�ļ�·��������Ϊ��");
				myform.DocFilePath.focus();
				return false;
			}
			if( 0 == document.all.WebOffice1.LoadOriginalFile(myform.DocFilePath.value,"doc")){
				alert("�ļ���ʧ�ܣ�����·���Ƿ�Ϸ�");
				myform.DocFilePath.focus();
				return false;
			}
				
		}
		// -----------------------------== �����ĵ� ==------------------------------------ //
		function SaveDoc() {
			 var myform = document.forms[0];		 
			 if(myform.DocTitle.value ==""){
				alert("���ⲻ��Ϊ��")
				myform.DocTitle.focus();
				return false;
			}
			if(myform.DocID.value ==""){
				alert("�ĺŲ���Ϊ��")
				myform.DocID.focus();
				return false;
			}
			
			document.all.WebOffice1.HttpInit();			//��ʼ��Http����
			// �����Ӧ��PostԪ�� 
			document.all.WebOffice1.HttpAddPostString("DocTitle", myform.DocTitle.value);
			document.all.WebOffice1.HttpAddPostString("DocID", myform.DocID.value);
			document.all.WebOffice1.HttpAddPostString("DocType","doc");
			document.all.WebOffice1.HttpAddPostString("DocFilePath",myform.DocFilePath.value);
			document.all.WebOffice1.HttpAddPostCurrFile("DocContent","");		// �ϴ��ļ�
			
			document.all.WebOffice1.HttpPost("<%=path%>/docEditTest.do?method=upload");
			
			if("OK" == document.all.WebOffice1.HttpPost("<%=path%>/docEditTest.do?method=upload")){
				//alert("�ļ��ϴ��ɹ�");	
			}else{
				//alert("�ļ��ϴ�ʧ��")
			}
			return_onclick(); 
			}
		//-->
		</SCRIPT>
		<!-- --------------------=== ����Weboffice��ʼ������ ===--------------------- -->
		<SCRIPT LANGUAGE=javascript FOR=WebOffice1 EVENT=NotifyCtrlReady>
		<!--
		 WebOffice1_NotifyCtrlReady()			// ��װ����Weboffice(ִ��<object>...</object>)�ؼ���ִ�� "WebOffice1_NotifyCtrlReady"����
		//-->
		</SCRIPT>
	<link href="<%=path%>/css/wd-css.css" rel="stylesheet" type="text/css">
	</head>

<body leftmargin="0" marginwidth="1024">
		<html:form action="/docEditTest.do?method=upload" enctype="multipart/form-data" 
			method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
					<td colspan="3" valign="top">
						<!-- -----------------------------== װ��weboffice�ؼ� ==--------------------------------- -->
						<object id=WebOffice1 height=560 width="100%"
							style="LEFT: 0px; TOP: 0px"
							classid="clsid:E77E049B-23FC-4DB8-B756-60529A35FAD5"
							codebase=WebOffice.ocx#V3,0,0,0>
							<param name="_ExtentX" value="6350">
							<param name="_ExtentY" value="6350">
							<param name="BorderColor" value="-2147483632">
							<param name="BackColor" value="-2147483643">
							<param name="ForeColor" value="-2147483640">
							<param name="TitlebarColor" value="-2147483635">
							<param name="TitlebarTextColor" value="-2147483634">
							<param name="BorderStyle" value="1">
							<param name="Titlebar" value="1">
							<param name="Toolbars" value="1">
							<param name="Menubar" value="1">
						</object>
						<!-- --------------------------------== ����װ�ؿؼ� ==----------------------------------- -->
					</td>

  </tr>
</table>
		</html:form>
</body>
</html>
