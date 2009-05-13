<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>

<html>
	<head>
		<title>���Զ���</title>
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			//�Ƿ�����
			String insureflag = (String) request.getAttribute("insureflag");
			boolean flag = true;
			if (insureflag != null) {
				if ("true".equals(insureflag)) {
					flag = false;
				} else {
					flag = true;
				}
			}
			String sessionID = "";
			int curPage = 0;
			long count=0;
			try {
				sessionID = (String) request.getAttribute("sessionID");
				curPage = (Integer) session.getAttribute(sessionID + "No");
				count=(Long)session.getAttribute(sessionID+"Count");

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		%>

		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/images/style.css" rel="stylesheet"
			type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=path%>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
		<script src="<%=path%>/javascript/validate.js"></script>
		<script type="text/javascript" src="<%=path%>/javascript/calendar.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-setup.js"></script>
		<script type="text/javascript" src="<%=path%>/js/calendarS.js"></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<script language="javascript">
		function clear(){  
			document.smsSubscribeForm.username.value = "";
			document.smsSubscribeForm.usernameId.value = "";
			document.smsSubscribeForm.userPhone.value = "";
			document.smsSubscribeForm.subjectFeeTypeId.value = "";
			document.smsSubscribeForm.subjectnameType.value = "";
			document.smsSubscribeForm.subjectnameId.value = "";
			document.smsSubscribeForm.subjectname.value = "";
			//document.smsSubscribeForm.subjectOptionalFeeTypeId.value = "";
			//document.smsSubscribeForm.subjectnameOptionalType.value = "";
			//document.smsSubscribeForm.subjectnameOptionalId.value = "";
			//document.smsSubscribeForm.subjectnameOptional.value = "";
			document.smsSubscribeForm.infoType.value = "";
			document.smsSubscribeForm.departId.value = "";
			//document.smsSubscribeForm.mobilenum2.value = "";
		}
		function clearType(){  
			document.smsSubscribeForm.commDepartList.value = "";
			document.smsSubscribeForm.userNameLike.value = "";
			document.smsSubscribeForm.content.value = "";
			document.smsSubscribeForm.contentid.value = "";
		}
		function checkin(){
			if(document.smsSubscribeForm.username.value==""){
				alert("�û����Ʋ���Ϊ�գ�");
				return false;
			}else if(document.smsSubscribeForm.subjectname.value==""){
				alert("������Ŀ����Ϊ�գ�");
				return false;
			}else{
			    document.smsSubscribeForm.method.value="executeSave";
				document.smsSubscribeForm.submit();
			}
		}
		// ͨѶ¼
		function addbookList(idText,nameText,mobileText,groupsText){
		    window.open("<%=path%>/commonalityTree.do?method=input&idText="+idText+"&nameText="+nameText+"&mobileText="+mobileText+"&groupsText="+groupsText,"",'width=450,height=500,top=100, left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
			//window.showModalDialog("<%=path%>/commonalityTree.do?method=input&idText="+idText+"&nameText="+nameText+"&mobileText="+mobileText+"&groupsText="+groupsText,window,'dialogwidth:450px;dialogheight:500px;help:0;center:yes;resizable:0;status:0;scroll:yes');
		}
		// ������Ϣ
		function selectItem(subjectState,remark){
			window.open("<%=path%>/smsSubscribe.do?method=executeLinkA&subjectState="+subjectState+"&remark="+remark,"",'height=500, width=400, top=100, left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
			//window.showModalDialog("<%=path%>/smsSubscribe.do?method=executeLinkA&subjectState="+subjectState+"&remark="+remark,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');					
		}
		function chooseQuery(){
			  document.smsSubscribeForm.method.value="executeInput";
			  document.smsSubscribeForm.submit();
		}
		function clickText(){
			window.showModalDialog("<%=path %>/commonalityCommAction.do?method=subscribeTreeList&type=sms",window,'dialogwidth:450px;dialogheight:500px;help:0;center:yes;resizable:0;status:0;scroll:yes');
		}
		function chooseSubjectName(subjectFlag){
		 window.showModalDialog("<%=path%>/smsSubscribe.do?method=selectSubjectName&subjectFlag="+subjectFlag,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');					
		}
</script>
	</head>
	<body>
		<html:form action="/smsSubscribe?" method="post">
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="288" height="40" align="left" valign="middle"
									background="<%=path%>/images/8-1.gif">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="5%" align="center" valign="middle">
												&nbsp;
											</td>
											<td width="11%" height="12" align="center" valign="middle">
												<img src="<%=path%>/images/icon5.gif" width="7" height="7" />
											</td>
											<td width="84%" class="table2_topic" align="right">
												��Ϣ����
											</td>
										</tr>
									</table>
								</td>
								<td background="<%=path%>/images/8-2.gif">
									&nbsp;
								</td>
							</tr>
						</table>
						<table width="100%" align="center" border="1" cellpadding="0"
							cellspacing="1" bgcolor="#0e88b9">
							<tr>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="table2bg">
										<tr>
											<td align="center" valign="top">
												<table width="98%" border="0" cellpadding="0"
													cellspacing="0" class="table2bgin">
													<tr>
														<th height="15" valign="bottom"></th>
													</tr>
													<tr>
														<td align="center" valign="bottom">
															<input type="hidden" name="method" />
															<table width="100%" border="0" bordercolorlight="#cccccc"
																bordercolordark="#FFFFFF" cellpadding="4"
																cellspacing="0">

																<tr>
																	<td colspan="2" bgcolor="f7f7f7">
																		<table width="100%" bordercolorlight="#cccccc"
																			bordercolordark="#FFFFFF" border="1" cellspacing="0"
																			cellpadding="2" id="question1">
																			<tr>
																				<td bgcolor="#F7F7F7">
																					<strong>�����û���</strong>
																				</td>
																				<td>
																					<input type="hidden" name="departId" />
																					<input type="text" name="username" size="50"
																						maxlength="50" readonly="readonly" title="" />
																					&nbsp;&nbsp;&nbsp;
																					<input type="hidden" name="usernameId" />
																					<input type="hidden" name="userPhone" />
																					<input type="button" onclick="addbookList('usernameId','username','userPhone','departId')" value="ͨѶ¼" onmousemove="this.style.cursor='hand'"/>
																					<input type="button" onclick="checkin()" value="�ύ" onmousemove="this.style.cursor='hand'"/>
																					<input type="button" onclick="javascript:clear()" value="���" onmousemove="this.style.cursor='hand'"/>
																					
																					<%--<a
																						onclick="addbookList('usernameId','username','userPhone','departId')"
																						onMouseOver="this.style.cursor='hand'">ͨѶ¼</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																					<a onclick="checkin()"
																						onMouseOver="this.style.cursor='hand'">�ύ</a>
																					&nbsp;

																					<a href="javascript:clear()">���</a>
																				--%></td>
																			</tr>
																			<input type="hidden" name="infoType" />
																			<tr>
																				<td bgcolor="#F7F7F7" width="12%">
																					<strong>������Ϣ��</strong>
																				</td>
																				<td>
																					<input type="hidden" name="subjectFeeTypeId" />
																					<input type="hidden" name="subjectnameType" />
																					<input type="hidden" name="subjectnameId" />
																					<input type="text" name="subjectname" size="45"
																						maxlength="50" readonly="readonly" />
																					&nbsp;

																					<a onclick="selectItem('TQYB',0)"
																						onMouseOver="this.style.cursor='hand'">����Ԥ��</a>&nbsp;
																					<a onclick="selectItem('CWYB',0)"
																						onMouseOver="this.style.cursor='hand'">��λԤ��</a>&nbsp;
																					<a onclick="selectItem('CWYJ',0)"
																						onMouseOver="this.style.cursor='hand'">��λԤ��</a>&nbsp;
																					<a onclick="selectItem('SCSW',0)"
																						onMouseOver="this.style.cursor='hand'">ʵ��ˮλ</a>&nbsp;
																					<a onclick="selectItem('SCYL',0)"
																						onMouseOver="this.style.cursor='hand'">ʵʱ����</a>&nbsp;
																					<a onclick="selectItem('FSFX',0)"
																						onMouseOver="this.style.cursor='hand'">���ٷ���</a>	&nbsp;
																						
																					<%--<a onclick="selectItem('TFYJ',0)"
																						onMouseOver="this.style.cursor='hand'">̨��Ԥ��</a>
																					<a onclick="selectItem('BYYJ',0)"
																						onMouseOver="this.style.cursor='hand'">����Ԥ��</a>
																						
																						<a onclick="selectItem('QDLJB',0)"
																						onMouseOver="this.style.cursor='hand'">ǿ��������</a>
																				--%></td>
																			</tr>
																			<%--<tr>
																				<td bgcolor="#F7F7F7">
																					<strong>���Ŀ�ѡ��Ϣ��</strong>
																				</td>
																				<td>
																					<input type="hidden" name="subjectnameOptionalType" />
																					<input type="hidden"
																						name="subjectOptionalFeeTypeId" />
																					<input type="hidden" name="subjectnameOptionalId" />
																					<input type="text" name="subjectnameOptional"
																						size="45" maxlength="50" readonly="readonly" />
																					&nbsp;
																					<a onclick="selectItem('SCYL',1)"
																						onMouseOver="this.style.cursor='hand'">ʵʱ����</a>
																					<a onclick="selectItem('SCSW',1)"
																						onMouseOver="this.style.cursor='hand'">ʵ��ˮλ</a>
																					<a onclick="selectItem('FSFX',1)"
																						onMouseOver="this.style.cursor='hand'">���ٷ���</a>
																					<a onclick="selectItem('CWYJ',1)"
																						onMouseOver="this.style.cursor='hand'">��λԤ��</a>
																					<a onclick="selectItem('TFYJ',1)"
																						onMouseOver="this.style.cursor='hand'">̨��Ԥ��</a>
																					<a onclick="selectItem('BYYJ',1)"
																						onMouseOver="this.style.cursor='hand'">����Ԥ��</a>
																					<a onclick="selectItem('FXCWYJ',1)"
																						onMouseOver="this.style.cursor='hand'">��Ѵ��λԤ��</a>
																			</tr>
																		--%>
																		</table>
																	</td>
																</tr>
															</table>
															<table width="100%" border="0" bordercolorlight="#cccccc"
																bordercolordark="#FFFFFF" cellpadding="4"
																cellspacing="0">
																<tr>
																	<td>
																		<strong><font color="#FF0000">��</font>&nbsp;ͨѶ�飺</strong>
																		<input type="hidden" name="commDepartList"/>
																		<input type="text" name="commDepartListName" onclick="clickText()" readonly="readonly" />
																		<%--<html:select property="commDepartList">
																			<option Value="">
																				--��ѡ����������--
																			</option>
																			<html:optionsCollection property="collCommList"
																				name="smsSubscribeForm" />
																		</html:select>
																		--%><strong> �û����� </strong>
																		<input type="text" name="userNameLike" size="10"
																			value="">
																		<strong>��Ŀ���ƣ�<input type="text"
																				name="content" size="20" value="" onclick="chooseSubjectName('');"/> <input
																				type="hidden" name="contentid" value="" /> </strong>
																		<input type="button" onclick="chooseQuery();" value="��ѯ" onmousemove="this.style.cursor='hand'"/>
																			<input type="button" onclick="clearType();" value="���" onmousemove="this.style.cursor='hand'"/>
																		<%--<a onclick="chooseQuery();"
																			onMouseOver="this.style.cursor='hand'"><font
																			color="#FF0000">��ѯ</font> </a>
																		--%><%--<a onclick="clearType();"
																			onMouseOver="this.style.cursor='hand'"><font
																			color="#FF0000">���</font> </a>
																	--%></td>
																</tr>
															</table>

															<table width="100%" border="0" bordercolorlight="#cccccc"
																bordercolordark="#FFFFFF" cellpadding="2"
																cellspacing="0">

																<tr>
																	<td colspan="2" bgcolor="f7f7f7">
																		<table width="100%" bordercolorlight="#cccccc"
																			bordercolordark="#FFFFFF" border="1" cellspacing="0"
																			cellpadding="2">
																			<tr>
																				<td align="center" width="25%" bgcolor="e0e3e8">
																					<strong>��������</strong>
																				</td>
																				<td align="center" width="10%" bgcolor="e0e3e8">
																					<strong>�û�����</strong>
																				</td>
																				<td align="center" width="10%" bgcolor="e0e3e8">
																					<strong>�ֻ�����</strong>
																				</td>
																				<td width="25%" align="center" bgcolor="e0e3e8">
																					<strong>��������</strong>
																				</td>
																				<td width="10%" align="center" bgcolor="e0e3e8">
																					<strong> ְ�� </strong>
																				</td>
																				<td width="20%" align="center" bgcolor="e0e3e8">
																					<strong> ��ע </strong>
																				</td>

																			</tr>
																			<logic:iterate id="item" name="curPageList">
																				<tr>
																					<td width="25%">
																						<bean:write name="item" property="name" />
																						&nbsp;
																					</td>
																					<td width="10%">
																						<bean:write name="item" property="username" />
																						&nbsp;
																					</td>
																					<td width="10%">
																						<bean:write name="item" property="mobileNum" />
																						&nbsp;
																					</td>
																					<td width="25%">
																						<bean:write name="item" property="subjectname" />
																						&nbsp;
																					</td>
																					<td width="10%">
																						<bean:write name="item" property="duty" />
																						&nbsp;
																					</td>
																					<td width="20%">
																						<bean:write name="item" property="remark" />
																						&nbsp;
																					</td>
																				</tr>
																			</logic:iterate>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="13">
																		<table align="right">
																			<tr>
																				<td>
																					<a
																						href="<%=path%>/smsSubscribe.do?method=movePageCur&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>"><span
																						class="bg-zw">��һҳ</span> </a>
																					<a
																						href="<%=path%>/smsSubscribe.do?method=movePageCur&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>"><span
																						class="bg-zw">��һҳ</span> </a>
																					<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
																					<span class="bg-zw">ÿҳ��ʾ</span>
																					<a
																						href="<%=path%>/smsSubscribe.do?method=resetPageSizeCur&pageSize=10&sessionID=<%=sessionID%>"><span
																						class="bg-zw">10</span> </a>
																					<a
																						href="<%=path%>/smsSubscribe.do?method=resetPageSizeCur&pageSize=20&sessionID=<%=sessionID%>"><span
																						class="bg-zw">20</span> </a>
																					<a
																						href="<%=path%>/smsSubscribe.do?method=resetPageSizeCur&pageSize=30&sessionID=<%=sessionID%>"><span
																						class="bg-zw">30</span> </a>
																					<span class="bg-zw">��</span>
																					<span class="bg-zw">��<%=count %>��</span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>

														</td>
													<tr>
														<td height="10"></td>
													</tr>
												</table>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td height="8"></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</html:form>
	</body>
</html>
