<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
				document.all.WebOffice1.LoadOriginalFile("${contextPath}", "doc");
				document.all.WebOffice1.SetToolBarButton2("Menu Bar",1,8);
				document.all.WebOffice1.SetToolBarButton2("Standard",1,8);
				document.all.WebOffice1.SetToolBarButton2("��������ǩ��",1,11);
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
			document.all.WebOffice1.SetFieldValue("mark_1", "��ǩ��", "::ADDMARK::");			
		}

		// -------------------------=== ������ǩ�׼Ӻ�ͷ ===------------------------------ //
		function addRedHead() {
			document.all.WebOffice1.SetFieldValue("mark_1", "", "::ADDMARK::");			// �����ǩ
			document.all.WebOffice1.SetFieldValue("mark_1", "tmp1.doc", "::FILE::");
		}

		// -----------------------------== ������ҳ ==------------------------------------ //
		function return_onclick() {
			document.all.WebOffice1.Close();
			window.close();
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
		function saveDoc() {
			var myform = document.forms[0];		 
			 if(myform.docName.value ==""){
				alert("���Ʋ���Ϊ��")
				myform.DocTitle.focus();
				return false;
			}
			document.all.WebOffice1.HttpInit();		//��ʼ��Http����
			// �����Ӧ��PostԪ�� 
			document.all.WebOffice1.HttpAddPostString("DocSendId", myform.docId.value);
			document.all.WebOffice1.HttpAddPostString("DocAttId",myform.fileId.value);
			document.all.WebOffice1.HttpAddPostString("DocTitle", myform.docName.value);
			document.all.WebOffice1.HttpAddPostString("DocType","doc");
			document.all.WebOffice1.HttpAddPostCurrFile("DocContent","");
			// �ϴ��ļ�
			var result = document.all.WebOffice1.HttpPost("<%=basePath%>docSendBook.do?method=uploadWebOfficeFile");
			
			if("failed" == result){
				alert("�ļ��ϴ�ʧ��!");	
			}else{
				if(myform.fileId.value==""){
					myform.fileId.value=result;
					var tb = opener.document.getElementById("docContextTb");
					var row = tb.insertRow();
					var cell = row.insertCell();
					cell.className="bg-zw";
					cell.innerHTML="<a href=\"#\" onclick=\"moddoc('"+myform.fileId.value+"');return false;\">"+myform.docName.value+"</a>";
				}else{
					opener.document.getElementById(myform.fileId.value).innerHTML="<a href=\"#\" onclick=\"moddoc('"+myform.fileId.value+"');return false;\">"+myform.docName.value+"</a>";
				}
				alert("�ļ��ϴ��ɹ�!")
			}
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

	<body leftmargin="0" style="background-color:#e8f0f1">
		<html:form action="/docEditTest.do?method=upload"
			enctype="multipart/form-data" method="post"><%--
			<table width="1024" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="1024" height="102" align="left" valign="middle"
						background="imagine/doc/b1-1.gif">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="55">
									&nbsp;
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<table width="100%" border="0" align="center"
													cellpadding="0" cellspacing="0">
													<tr>
														<td width="150">
															<table width="100%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<!-- <td align="right" class="zw">�ĺ�</td>
	                      <td width="90"><input name="DocID" type="text" class="srk"></td> -->
																	<td align="right" class="zw">
																		�ļ����ƣ�
																	</td>
																	<td width="90">
																		<input name="docName" type="text" class="srk"
																			value="${fileName}">
																	</td>
																</tr>
															</table>
														</td>
														<td width="30">
														</td>
														<td width="326">
															<table width="326" height="22" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td width="2" background="imagine/doc/fgx.gif">
																	</td>
																	<td width="15" align="center" class="zw">
																		&nbsp;
																	</td>
																	<td width="67" align="center"
																		background="imagine/doc/bt3.gif" class="zw">
																		<a onclick="return ProtectRevision()"
																			onmouseover="this.style.cursor='hand'">�޶��ĵ�</a>
																	</td>
																	<td width="8">
																		&nbsp;
																	</td>
																	<td width="67" align="center"
																		background="imagine/doc/bt3.gif" class="zw">
																		<a onclick="return ShowRevisions()"
																			onmouseover="this.style.cursor='hand'">��ʾ�޶�</a>
																	</td>
																	<td width="8">
																		&nbsp;
																	</td>
																	<td width="67" align="center"
																		background="imagine/doc/bt3.gif" class="zw">
																		<a onclick="return UnShowRevisions()"
																			onmouseover="this.style.cursor='hand'">�����޶�</a>
																	</td>
																	<td width="8">
																		&nbsp;
																	</td>
																	<td width="67" align="center"
																		background="imagine/doc/bt3.gif" class="zw">
																		<a onclick="return AcceptAllRevisions()"
																			onmouseover="this.style.cursor='hand'">�����޶�</a>
																	</td>
																	<td width="15">
																	</td>
																	<td width="2
								  "
																		background="imagine/doc/fgx.gif">
																	</td>
																</tr>
															</table>
														</td>
														<td width="450"></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td align="right">
												<table width="100%" height="24" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td align="center" class="zw">
															&nbsp;
														</td>
														<td width="118" align="center"
															background="imagine/doc/bt4-0.gif" class="zw"
															onclick="return saveDoc()"
															onmouseover="this.style.cursor='hand'">
															&nbsp;
														</td>
														<td width="8">
															&nbsp;
														</td>
														<td width="89" height="24" align="center"
															background="imagine/doc/bt4.gif" class="zw"
															onclick="return return_onclick()"
															onmouseover="this.style.cursor='hand'">
															��&nbsp;&nbsp;��
														</td>
														<td width="100">
															&nbsp;
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					--%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:0px" > 
	<tr>
		<td height="25" align="center" valign="middle">	
			 <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:0px" height="22">
			  <tr>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td class="zw" width="67" align="center" valign="middle">�ļ�����:</td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="67" align="center" valign="middle"><input name="docName" type="text" class="srk" value="${fileName}"></td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="118" align="center" valign="middle" background="<%=basePath%>/imagine/doc/bt4-0.gif" class="zw" onclick="return saveDoc()" onmouseover="this.style.cursor='hand'">
			    </td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="1" align="center" valign="middle" background="<%=basePath%>/imagine/doc/fgx.gif"></td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="67" align="center" valign="middle" background="<%=basePath%>/imagine/doc/bt3.gif" class="zw">
			    <a onclick="return ProtectRevision()" onmouseover="this.style.cursor='hand'">�޶��ĵ�</a>
			    </td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="67" align="center" valign="middle" background="<%=basePath%>/imagine/doc/bt3.gif" class="zw">
			     <a onclick="return ShowRevisions()" onmouseover="this.style.cursor='hand'">��ʾ�޶�</a>
			    </td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="67" align="center" valign="middle" background="<%=basePath%>/imagine/doc/bt3.gif" class="zw">
			    <a onclick="return UnShowRevisions()" onmouseover="this.style.cursor='hand'">�����޶�</a>
			    </td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="67" align="center" valign="middle" background="<%=basePath%>/imagine/doc/bt3.gif" class="zw">
			  	 <a onclick="return AcceptAllRevisions()" onmouseover="this.style.cursor='hand'">�����޶�</a>
			    </td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="1" align="center" valign="middle" background="<%=basePath%>/imagine/doc/fgx.gif"></td>
			    <td width="10" align="center" valign="middle">&nbsp;</td>
			    <td width="49" align="center" valign="middle" background="<%=basePath%>/imagine/doc/bt1.gif" class="zw" onclick="return return_onclick()" onmouseover="this.style.cursor='hand'">��&nbsp;&nbsp;��
			    </td>
			    <td  align="center" valign="middle">&nbsp;</td>
			  </tr>
			</table>
   		</td>
   	</tr>
 </table>
					
				<table width="100%">

				<tr>
					<td colspan="3" valign="top"><!-- -----------------------------== װ��weboffice�ؼ� ==--------------------------------- -->
						<object id=WebOffice1 height="660" width="100%"
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
			<input type="hidden" name="docId" value="${param.docId}">
			<input type="hidden" name="fileId" value="${param.fileId}">
		</html:form>
	</body>
</html>
