<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int curPage = 0;
	long count=0;
	String sessionID = "";
	try {
		sessionID = (String) request.getAttribute("sessionID");
		curPage = (Integer) session.getAttribute(sessionID + "No");
		count=(Long)session.getAttribute(sessionID+"Count");

	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>���гɹ�</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function movePage(p){
	document.getElementById("method").value = "movePage";
	document.getElementById("moveTo").value = p;
	document.forms[0].submit();
}
function resetPageSize(s){
	document.getElementById("method").value = "resetPageSize";
	document.getElementById("pageSize").value = s;
	document.forms[0].submit();
}
function viewItem(id){
	location.href="<%=path%>/techResult.do?method=input&readonly=true&id="+id;
}
function modifyItem(id){
	location.href="<%=path%>/techResult.do?method=input&id="+id;
}
function deleteItem(id){
	if(confirm("��ȷ��Ҫɾ��������¼��")){
		location.href="<%=path%>/techResult.do?method=delete&id="+id;
	}
}
</script>
	</head>
	<body>
<script type="text/javascript" src="<%=path%>/js/calendar-dong.js"></script>
		<form action="<%=path%>/techResult.do">
		<input type="hidden" name="method" value="list"/>
		<input type="hidden" name="sessionID" value="<%=sessionID%>"/>
		<input type="hidden" name="moveTo" value="<%=curPage%>"/>
		<input type="hidden" name="pageSize" value="10"/>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>
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
											<td width="84%" class="table2_topic" align="left">
												���гɹ�
											</td>
										</tr>
									</table>
								</td>
								<td background="images/8-2.gif">
									&nbsp;
								</td>
							</tr>
						</table>
						<table width="100%" align="center" border="0" cellpadding="0"
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
														<th height="30" valign="bottom"></th>
													</tr>
													<tr>
														<td align="center" valign="bottom">
															
															<table width="99%" border="0" cellpadding="0"
																cellspacing="0" >
																<tr>

																	<td height="27" width="93%" colspan="4" valign="middle"
																		bgcolor="#f7f7f7" align="left">
																		��Ŀ����:
																		<input type="text" name="itemName" value="${param.itemName}" size="12" class="shuruk1" />
																		�е���λ:
																		<input type="text" name="bearUnit" value="${param.bearUnit}" size="12" class="shuruk1" />
																	��Ŀ������:
																		<input type="text" name="itemPrincipal" value="${param.itemPrincipal}" size="10" class="shuruk1" />
																			ʱ���:
																		<input type="text" name="startTime" value="${param.startTime}" size="10" class="shuruk1" onfocus="setday(this)"/>
																			��:
																		<input type="text" name="endTime" value="${param.endTime}" size="10" class="shuruk1" onfocus="setday(this)"/>
																		<input type="button" class="button0" value="�� ѯ" onclick="document.forms[0].submit();"/>
																	</td>
																	<td align="right">
																	<input type="button" class="button0" value="�� ��" onclick="location.href='<%=path%>/techResult.do?method=input'"/>
																	</td>
																</tr>
																</table>
																<table width="99%" border="0" cellpadding="0"
																cellspacing="1" class="tabin_in">
																<tr align="center" class="bg-zwbt">
																	<th width="5%" height="25" align="center"
																		style="word-break: break-all; word-wrap:break-word;">
																		���
																	</th>
																	<th align="center" width="20%">
																		��Ŀ����
																	</th>
																	<th align="center" width="20%">
																		�е���λ
																	</th>
																	<th align="center" width="20%">
																		��Ŀ������
																	</th>
																	<th align="center" width="10%">
																		��ʼʱ��
																	</th>
																	<th align="center" width="10%">
																		����ʱ��
																	</th>
																	<th align="center" width="15%">
																		����
																	</th>
																</tr>
																<logic:iterate id="item" indexId="i" name="curPageList" type="com.baosight.tech.mode.TbTechResult">
																<tr>
																<td class="bg-zw">${i+1}</td>
																<td align="center" class="bg-zw">${item.itemName}</td>
																<td align="center" class="bg-zw">${item.bearUnit}</td>
																<td align="center" class="bg-zw">${item.itemPrincipal}</td>
																<td align="center" class="bg-zw"><bean:write name="item" property="startTime" format="yyyy-MM-dd"/></td>
																<td align="center" class="bg-zw"><bean:write name="item" property="endTime" format="yyyy-MM-dd"/></td>
																<td align="center" class="bg-zw">
																<img src="<%=path%>/images/icon10.gif" alt="�鿴" onmouseover="this.style.cursor='hand'" onclick="viewItem('${item.id}')"/>&nbsp;&nbsp;
																<img src="<%=path %>/images/icon9.gif" alt="�޸�" onmouseover="this.style.cursor='hand'" onclick="modifyItem('${item.id}')"/>&nbsp;&nbsp;
																<img src="<%=path %>/images/icon6.gif" alt="ɾ��" onmouseover="this.style.cursor='hand'" onclick="deleteItem('${item.id}')"/></td>
																</tr>
																</logic:iterate>
															</table>
															
															<table width="99%" border="0" cellspacing="0" cellpadding="0" align="right">
																<tr>
																	<td height="10"></td>
																</tr>
																<tr>
																	<td class="tabin_page">
																		<a href="#" onclick="movePage('<%=curPage - 1%>');return false;"><span class="bg-zw">��һҳ</span></a>
																		<a href="#" onclick="movePage('<%=curPage + 1%>');return false;"><span class="bg-zw">��һҳ</span></a>
																		<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
																		&nbsp;&nbsp;&nbsp;&nbsp;
																		<span class="bg-zw">ÿҳ��ʾ</span>
																		<a href="#" onclick="resetPageSize('10');return false;"><span class="bg-zw">10</span></a>
																		<a href="#" onclick="resetPageSize('20');return false;"><span class="bg-zw">20</span></a>
																		<a href="#" onclick="resetPageSize('30');return false;"><span class="bg-zw">30</span></a>
																		<span class="bg-zw">��</span>
															</table></td>
													</tr>
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
		</form>
	</body>
</html>
