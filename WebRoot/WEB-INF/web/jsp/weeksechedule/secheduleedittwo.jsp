<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm")
			.format(new Date());
	System.out.println(date);
	String weekofyear = (String) request.getAttribute("weekofyear");

	String stratTimeDate = (String) request
			.getAttribute("stratTimeDate");
	String stratTimeTime = (String) request
			.getAttribute("stratTimeTime");
	String username = (String) request.getAttribute("username");
	String userid = (String) request.getAttribute("userid");

	String ischild = (String) request.getAttribute("ischild");
	String timeoutflag = (String) request.getAttribute("timeoutflag");
	String xgorgl = (String)request.getParameter("xgorgl");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'pstlvledit.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/index-css.css" rel="stylesheet"
			type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=path%>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
  		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path%>/javascript/calendar.js"></script>
		<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-setup.js"></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<script type='text/javascript'
			src='<%=strpath%>/dwr/interface/weeksecheduleselectuser.js'></script>

		<script type="text/javascript">
		<!--
		function showusers()
		{
			if(document.all.userids.value=="")
			{
				alert("����û��ѡ����Ա��");
			}
			else
			{
				weekSecheduleSelectUser();
			}
		}
		function selectuser(argDeptOrUser)
		{
			//alert(argDeptOrUser);
			//����֪ͨ
			if(argDeptOrUser=='no')
			{
				document.all.userids.value="";
				document.all.deptids.value="";
				document.all.attendance.value="����֪ͨ";
				
			}
			else if(argDeptOrUser=='alldelete')
			{
				document.all.userids.value="";
				document.all.deptids.value="";
				document.all.attendance.value="";
				document.getElementById("tableone").style.display = "";
				document.getElementById("tabletwo").style.display = "";
			}
			else
			{
				if(document.all.attendance.value=="����֪ͨ")
				{
					document.all.attendance.value="";
				}
				//var url = "<%=path%>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=851a36fb19078db2011907a09e390003&source=week_sechedule";
				//window.open(url);
				//����
				if(document.all.id.value=='')
				{
					window.showModalDialog("<%=path%>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=851a36fb19078db2011907a09e390003&source=week_sechedule&deptOrUser="+argDeptOrUser,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
				}
				else//�޸�
				{
					window.showModalDialog("<%=path%>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=851a36fb19078db2011907a09e390003&source=week_sechedule&deptOrUser="+argDeptOrUser+"&flag=modify",window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
				}
				
				//window.showModalDialog("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=selectuser",window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
				//window.open("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=selectuser", 'newwindow', 'height=500, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				//window.location.replace("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=selectuser");
			}
		}
		
		function selectdept(argDeptOrUser)
		{
			//alert(argDeptOrUser);
			//����֪ͨ
			if(argDeptOrUser=='no')
			{
				document.all.userids.value="";
				document.all.deptids.value="";
				document.all.attendance.value="����֪ͨ";
				
			}
			else if(argDeptOrUser=='alldelete')
			{
				document.all.userids.value="";
				document.all.deptids.value="";
				document.all.attendance.value="";
				document.getElementById("tableone").style.display = "";
				document.getElementById("tabletwo").style.display = "";
			}
			else
			{
				if(document.all.attendance.value=="����֪ͨ")
				{
					document.all.attendance.value="";
				}
				//var url = "<%=path%>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=851a36fb19078db2011907a09e390003&source=week_sechedule";
				//window.open(url);
				//����
				if(document.all.id.value=='')
				{
					window.showModalDialog("<%=path%>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=851a36fb19078db2011907a09e390003&source=week_secheduledept&deptOrUser="+argDeptOrUser,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
				}
				else//�޸�
				{
					window.showModalDialog("<%=path%>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=851a36fb19078db2011907a09e390003&source=week_secheduledept&deptOrUser="+argDeptOrUser+"&flag=modify",window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
				}
				
				//window.showModalDialog("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=selectuser",window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
				//window.open("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=selectuser", 'newwindow', 'height=500, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				//window.location.replace("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=selectuser");
			}
		}

		function checkform(boolean)
		{
			var error="";
			if (document.all.itemTitle.value=="")
			{
				error=error+"\n�ճ̱���δ��д��";
				alert(error);;
				document.getElementById("itemTitle").focus();
				return false;
			}
			else if (getLen(document.getElementById("itemTitle").value) > 100)
			{
				error=error+"\n����ı���̫������100���ֽڣ�";
				alert(error);;
				document.getElementById("itemTitle").focus();
				return false;
			}
			if (document.all.promulgator.value=="")
			{
				error=error+"\n������δ��д��";
				alert(error);;
				document.getElementById("promulgator").focus();
				return false;
			}
			if (boolean == true)
			{
				if(document.all.attendance.value=="")
				{
					error=error+"\n����û��ѡ��μ��ߣ���ѡ��";
					alert(error);;
					document.getElementById("attendance").focus();
					return false;
				}
			}
			if (document.all.rem.value=="")
			{
				error=error+"\n��ص�δ��д��";
				alert(error);;
				document.getElementById("rem").focus();
				return false;
			}
			else if (getLen(document.getElementById("rem").value) > 200)
			{
				error=error+"\n����ĵص�̫������200���ֽڣ�";
				alert(error);;
				document.getElementById("rem").focus();
				return false;
			}
			if (document.all.content.value=="")
			{
				error=error+"\n�����δ��д��";
				alert(error);;
				document.getElementById("content").focus();
				return false;
			}
			else if (getLen(document.getElementById("content").value) > 1000)
			{
				error=error+"\n���������̫������1000���ֽڣ�";
				alert(error);;
				document.getElementById("content").focus();
				return false;
			}
			return true;
		}

		function submitValue(boolean)
		{
			var sflag=true;
			var error="";
			if(document.getElementById("timeoutflag").value=='1')
			{
				error=error+"�����ճ��ѹ��ڣ������޸ģ�\n";
				sflag=false;
			}
			if(document.getElementById("ischild").value=='1')
			{
				error=error+"�����ճ�Ϊ�����ճ̼�����ӵ��ճ̣������޸ģ�\n";
				sflag=false;
			}
			if(sflag==true)
			{
				if(checkform(boolean))
				{
					document.all.method.value='add';
					document.all.action.value='submit';
					document.forms[0].submit();
				}
			}
			else
			{
				alert(error);
				document.forms[0].reset();
			}
		}

		//����֤
		function chk()
		{
			var itemTitle = document.getElementById("itemTitle").value;
			var rem = document.getElementById("rem").value;
			var content = document.getElementById("content").value;
			if(itemTitle == ""){
				document.getElementById("fitemTitle").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				return false;	
			}
			else
			{
				if(getLen(document.getElementById("itemTitle").value) > 100)
				{
					document.getElementById("fitemTitle").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���100���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					return false;			
				}
				else
				{
					document.getElementById("fitemTitle").innerHTML = "";
				}
			}
			if(rem == "")
			{
				document.getElementById("frem").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				return false;	
				
			}
			else
			{
				if(getLen(document.getElementById("rem").value) > 200)
				{
					document.getElementById("frem").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���200���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					return false;	
								
				}
				else
				{
					document.getElementById("frem").innerHTML = "";
				}
			}
			if(content == "")
			{
				document.getElementById("fcontent").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				return false;	
				
			}
			else
			{
				if(getLen(document.getElementById("content").value) > 1000)
				{
					document.getElementById("fcontent").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���1000���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					return false;
				}
				else
				{
					document.getElementById("fcontent").innerHTML = "";
				}
			}
		}
		//�Ƿ�Ϊ�޸�
		function ismodify()
		{
			if(document.getElementById("addtype").value=="dept")
			{
				if(document.getElementById("id").value=="")
				{
					document.getElementById("tableone").style.display = "";
					document.getElementById("tabletwo").style.display = "";
				}else
				{
					document.getElementById("tableone").style.display = "none";
					document.getElementById("tabletwo").style.display = "";
				}
			}
		}

		function deletecheck(id,ischild,flag)
		{
			var sflag=true;
			var error="";
			if(document.getElementById("timeoutflag").value=='1')
			{
				error=error+"�����ճ��ѹ��ڣ�����ɾ����\n";
				sflag=false;
			}
			if(document.getElementById("ischild").value=='1')
			{
				error=error+"�����ճ�Ϊ�����ճ̼�����ӵ��ճ̣�����ɾ����\n";
				sflag=false;
			}
			if(sflag==true)
			{
				if(checkform(flag))
				{
					if(confirm('�Ƿ�ȷ��ɾ��?'))
					{
						var strpath="<%=path%>/tbZwWeekSecheduleAction.do?method=delete&id="+id;
						window.location.href=strpath;
						//alert(strpath);
					}
				}
			}
			else
			{
				alert(error);
				document.forms[0].reset();
			}
		}
		
		function returnlist(){
					
					window.location.replace("<%=path%>/tbZwWeekSecheduleAction.do?method=list&action=alllist");
	
					}
	</script>

	</head>

	<body onload="javascript:setFocus('itemTitle');ismodify();">
		<input type="hidden" name="ischild" value="<%=ischild%>">
		<input type="hidden" name="timeoutflag" value="<%=timeoutflag%>">
		<html:form action="/tbZwWeekSecheduleAction.do">

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="288" height="40" align="left" valign="middle"
						background="images/8-1.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="5%" align="center" valign="middle">
									&nbsp;
								</td>
								<td width="11%" height="12" align="center" valign="middle">
									<img src="images/icon5.gif" width="7" height="7" />
								</td>
								<td width="84%" class="table2_topic">
									<%
										String action = (String) request.getAttribute("action");
										String addtype = (String) request.getParameter("addtype");
										System.out.println(addtype);

										if (action != null) {
											if ("modify".equals(action)) {
												if ("dept".equals(addtype)) {
									%>
									�ճ̹���-�����ճ��޸�
									<%
									} else {
									%>
									�ճ̹���-�����ճ��޸�
									<%
											}
											} else {
												if ("dept".equals(addtype)) {
									%>
									�ճ̹���-�����ճ�����
									<%
									} else {
									%>
									�ճ̹���-�����ճ�����
									<%
											}
											}
										} else {
											if ("dept".equals(addtype)) {
									%>
									�ճ̹���-�����ճ�����
									<%
									} else {
									%>
									�ճ̹���-�����ճ�����
									<%
										}
										}
									%>
								</td>
							</tr>
						</table>
					</td>
					<td background="images/8-2.gif">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="1"
				bgcolor="#0e88b9">
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="table2bg">
							<tr>
								<td align="center" valign="top">
									<table width="98%" border="0" cellpadding="0" cellspacing="0"
										class="table2bgin">
										<tr>
											<th width="94%" height="30" align="right" valign="bottom">
												<img src="<%=path%>/images/fh.gif" width="46" height="25"
													border="0" onclick="returnlist()"
													onmouseover="this.style.cursor='hand'" />
											</th>
											<th width="6%" valign="bottom"></th>
										</tr>

										<tr>
											<td colspan="2" align="center" valign="top">
												<table width="98%" border="0" cellpadding="0"
													cellspacing="1" class="tabin1_in">
													<tr>
														<td nowrap width="80" height="25">
															�ճ̱���
														</td>
														<td height="25" colspan="2">
															<html:text property="itemTitle" maxlength="100"
																style="color: 4c6a95;text-indent: 1pt;height: 18px;width: 87%;border: 1px solid #a5a5a5" readonly="true"></html:text>
															<font color="red">*</font>
															<font color="red"> <span id="fitemTitle"></span> </font>
														</td>
													</tr>
													<%--<tr>
						<td width="50%">
							<span>�ճ�����</span>
						</td>
						<td colspan="2">
							<html:select property="itemType">
								<html:option value="1">�����ճ�</html:option>
								<html:option value="2">�Ǹ����ճ�</html:option>
							</html:select>
						</td>
					</tr>
					--%>
													<tr>
														<td nowrap width="100" height="25">
															����ڼ�ʱ��
														</td>
														<td height="25" colspan="2">
															<%
																		if (request.getAttribute("action") != null
																		&& "modify".equals(request.getAttribute("action"))) {
															%>
															<html:text property="startTime" style="color: 4c6a95;text-indent: 1pt;height: 18px;width: 87%;border: 1px solid #a5a5a5"
																readonly="true" title="���ѡ��ʱ��"></html:text>
															<%
															} else {
															%>
															<html:text property="startTime" style="color: 4c6a95;text-indent: 1pt;height: 18px;width: 87%;border: 1px solid #a5a5a5"
																value="<%=date%>" readonly="true"
																title="���ѡ��ʱ��"></html:text>
															<%
															}
															%>

															&nbsp;&nbsp;
														</td>
													</tr>

													<tr>
														<td nowrap width="80" height="25">
															�ټ���
														</td>
														<td height="25" colspan="2">
															<input type="text" style="color: 4c6a95;text-indent: 1pt;height: 18px;width: 87%;border: 1px solid #a5a5a5" name="promulgator"
																value="${promulgator}" readonly="true">
														</td>
													</tr>
													<%
													if ("dept".equals(request.getParameter("addtype"))) {
													%>
													<tr>
														<td nowrap width="80" height="25">
															�μ���
														</td>
														<td height="25" colspan="2" align="left">
															<input type="hidden" name="addtype" value="dept" />
															<table align="center" width="100%" border="0"
																cellpadding="0" cellspacing="0" bordercolor="97cdda"
																class="tableborder">
																<tr>
																	<td height="25" colspan="2" width="90%">
																		<html:textarea property="attendance"
																			style="color: 4c6a95;text-indent: 1pt;height: 100px;width: 100%;border: 1px solid #a5a5a5" cols="120" rows="7" readonly="true"></html:textarea>
																	</td>
																	<td width="10%">
																		<table align="center" id="tableone" width="100%"
																			border="0" cellpadding="0" cellspacing="0"
																			bordercolor="97cdda" class="tableborder">
																			<tr>
																				<td>
																					<a onclick="selectdept('dept');" title="ѡ����"
																						onmouseover="this.style.cursor='hand'"> <img
																							src="<%=path%>/imagine/z1.gif" width="85"
																							height="20"> </a>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<a onclick="selectuser('user');" title="ѡ����Ա"
																						onmouseover="this.style.cursor='hand'"> <img
																							src="<%=path%>/imagine/xz.gif" width="85"
																							height="20"> </a>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<a onclick="selectuser('no');" title="����֪ͨ"
																						onmouseover="this.style.cursor='hand'"> <img
																							src="<%=path%>/imagine/z2.gif" width="85"
																							height="20"> </a>
																				</td>
																			</tr>
																		</table>
																		<table align="center" id="tabletwo" width="98%"
																			border="0" cellpadding="0" cellspacing="0"
																			bordercolor="97cdda" class="tableborder">
																			<tr>
																				<td>
																					<a onclick="selectuser('alldelete');" title="׷��"
																						onmouseover="this.style.cursor='hand'"> <img
																							src="<%=path%>/imagine/z3.gif" width="85"
																							height="20"></a>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<%
													} else {
													%>
													<input type="hidden" name="addtype" value="person" />
													<%
													}
													%>
													<tr>
														<td nowrap width="80" height="25">
															�ص�
														</td>
														<td height="25" colspan="2">
															<html:text property="rem" style="color: 4c6a95;text-indent: 1pt;height: 18px;width: 87%;border: 1px solid #a5a5a5"
																maxlength="200" onkeydown="notNull();" onblur="chk();" readonly="true"></html:text>
															<font color="red">*</font>
															<font color="red"> <span id="frem"></span> </font>
														</td>
													</tr>
													<tr>
														<td nowrap width="80" height="25">
															�����
														</td>
														<td height="25" colspan="2">
															<html:textarea property="content" cols="150"
																style="color: 4c6a95;text-indent: 1pt;height: 100px;width: 87%;border: 1px solid #a5a5a5" rows="7" onkeydown="notNull();"
																onblur="chk();" readonly="true"></html:textarea>
															<font color="red">*</font>
															<font color="red"> <span id="fcontent"></span> </font>
														</td>
													</tr>

													<tr>

														<td colspan="3" align="center" class="bg-zw">
															<%
																	if ("modify".equals(request.getParameter("method"))) {
																	if ("dept".equals(request.getParameter("addtype"))) {
															%>
															<a onclick="submitValue(true);"
																onmouseover="this.style.cursor='hand'"><img
																	src="<%=path%>/imagine/a3.gif" width="60" height="20">
															</a>&nbsp;&nbsp;
															<%
															} else {
															%>
															<a onclick="submitValue(false);"
																onmouseover="this.style.cursor='hand'"><img
																	src="<%=path%>/imagine/a3.gif" width="60" height="20">
															</a>&nbsp;&nbsp;
															<%
																}
																} else {
																	if ("dept".equals(request.getParameter("addtype"))) {
															%>
															<a onclick="submitValue(true);"
																onmouseover="this.style.cursor='hand'"><img
																	src="<%=path%>/imagine/tj.gif" width="52" height="23">
															</a>&nbsp;&nbsp;
															<%
															} else {
															%>
															<a onclick="submitValue(false);"
																onmouseover="this.style.cursor='hand'"><img
																	src="<%=path%>/imagine/tj.gif" width="52" height="23">
															</a>&nbsp;&nbsp;
															<%
																}
																}
															%>
															<%--<%
															if ("modify".equals(request.getParameter("method"))) {
															%>
															<img onmouseover="this.style.cursor='hand'"
																onclick="deletecheck('<%=request.getParameter("id")%>','<%=request.getParameter("ischild")%>','<%=request.getParameter("flag")%>')"
																src="<%=path%>/imagine/a4.gif" width="60" height="20"
																border="0" alt="ɾ��">
															<%
															}
															%>
														--%></td>
													</tr>
												</table>
											</td>
										</tr>

									</table>
								</td>
							</tr>
							<tr>
								<td height="8"></td>
							</tr>
							</table>
							
							</td>
							</tr>
							</table>
							<input type="hidden" name="date" value="<%=date%>" />
							<input type="hidden" name="addtype"
								value="<%=request.getParameter("addtype")%>" />
							<input type="hidden" name="action" />
							<input type="hidden" name="method" />
							<%
								String puserids = (String) request.getAttribute("userids");
								String pdeptids = (String) request.getAttribute("deptids");
								if (puserids != null && !"".equals(puserids)) {
							%>
							<input type="hidden" name="userids" value="<%=puserids%>" />
							<%
							} else {
							%>
							<input type="hidden" name="userids" />
							<%
								}

								if (pdeptids != null && !"".equals(pdeptids)) {
							%>
							<input type="hidden" name="deptids" value="<%=pdeptids%>" />
							<%
							} else {
							%>
							<input type="hidden" name="deptids" />
							<%
							}
							%>

							<input type="hidden" name="loginuserid" value="<%=userid%>" />
							<html:hidden property="id" />
					</html:form>
					<form action="" name="usersForm"></form>
	</body>
</html>
