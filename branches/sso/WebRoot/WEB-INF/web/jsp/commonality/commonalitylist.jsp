<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbCommonality" />
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

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
	String parentid = (String) request.getAttribute("parentid");
	String type = (String) request.getParameter("type");
	if (parentid == null || "".equals(parentid))
		parentid = (String) request.getParameter("parentid");
	String p_name = (String) request.getAttribute("p_name");
	if (p_name == null || "".equals(p_name))
		p_name = (String) request.getParameter("p_name");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>����ͨѶ¼</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/images/style.css" rel="stylesheet"
			type="text/css" />
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		
		function selectByName()
			{

				var name=document.getElementById("name").value;
            	var phone=document.getElementById("phone").value;
            	var duty=document.getElementById("duty").value;
            	var remark=document.getElementById("remark").value;
            	window.location.replace("<%=path%>/commonalityaction.do?method=list&action=selectByName&name="+name+"&phone="+phone+"&duty="+duty+"&remark="+remark);
			}
			
			function add()
			{
			if ("<%=parentid%>"=="null" || "<%=parentid%>"=="")
				{
					alert("��ѡ����������!");
					return false;
				}
			else
            window.location.replace("<%=path%>/commonalityaction.do?method=add&action=add&parentid=<%=parentid%>&type=<%=type%>");
            
			}
			
	</script>
		<style>
a:link {text-decoration: none;}
a:visited {text-decoration: none;}
a:active {text-decoration: none;}
a:hover {text-decoration: none;}
</style>
	</head>
	<%
	List commonalityList = (List) request.getAttribute("curPageList");
	%>
	<body>
		<table width="100%" align="center" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="288" height="40" valign="middle"
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
								ͨѶ¼����
							</td>
						</tr>
					</table>
				</td>
				<td background="images/8-2.gif">
					&nbsp;
				</td>
			</tr>
		</table>
		<table width="100%" align="center" border="1" cellpadding="0"
			cellspacing="1" bgcolor="#0e88b9">
			<tr>
				<td>
					<table>
						<tr bgcolor="#0e88b9">
							<td height="25" colspan="3" valign="bottom"></td>
							<td height="25" colspan="5" valign="bottom" bgcolor="#f7f7f7"
								align="left">
								<span class="bg-zw">������</span>
								<input type="text" name="name" value="${name}" size="10"
									class="shuruk1" />
								<span class="bg-zw">�ƶ��绰��</span>
								<input type="text" name="phone" value="${phone}" size="10"
									class="shuruk1" />
								<span class="bg-zw">ְ��</span>
								<input type="text" name="duty" value="${duty}" size="10"
									class="shuruk1" />
								<span class="bg-zw">��ע��</span>
								<input type="text" name="remark" value="${remark}" size="10"
									class="shuruk1" />
								<input name="Submit2" type="submit" class="button0" value="�� ѯ"
									onclick="selectByName();"
									onmouseover="this.style.cursor='hand'" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" align="center" border="0" cellpadding="0"
						cellspacing="0" bgcolor="#0e88b9">
						<tr>
							<td>
								<table width="98%" align="center" border="0" cellpadding="0"
									cellspacing="0" class="table2bg">
									<tr>
										<td align="center" valign="top">
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0" class="table2bgin">
												<tr>
													<th height="20" valign="bottom"></th>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="98%" border="0" cellspacing="0"
															cellpadding="0">
															<td width="2%" height="24">
																&nbsp;
															</td>
															<td width="20%" class="tabin_atab">
																����ͨѶ¼
															</td>
															<td width="20%" class="tabin_atabno">
																<a
																	href="commonalityCommAction.do?method=list&parentid=<%=parentid%>&type=<%=type%>"><span
																	class="bg-zw">����ͨѶ��</span> </a>
															</td>
															<td width="58%" colspan="3">
																&nbsp;
															</td>
														</table>
														<table width="99%" border="0" cellpadding="0"
															cellspacing="1" class="tabin_in">
															<tr>
																<td height="25" colspan="8" valign="bottom"
																	bgcolor="#f7f7f7" align="right">
																	&nbsp;
																	<input name="Submit2" type="submit" class="button0"
																		value="�� ��" onclick="add();"
																		onmouseover="this.style.cursor='hand'" />
																</td>

															</tr>

															<tr align="center">
																<th width="5%" height="25" align="center">
																	���
																</th>
																<th width="18%" align="center">
																	����
																</th>
																<th width="10%" align="center">
																	����
																</th>
																<th width="15%" align="center">
																	ְ��
																</th>
																<th width="17%" align="center">
																	�ƶ��绰
																</th>
																<th width="25%" align="center">
																	��ע
																</th>
																<th align="center" colspan="2">
																	����
																</th>
															</tr>
															<%
																	if (commonalityList != null) {
																	for (int i = 0; i < commonalityList.size(); i++) {
																		Object[] item = (Object[]) commonalityList.get(i);
															%>
															<tr align="center" class="bg-zw">
																<td width="5%" height="25" align="center">
																	<%=i + 1%>
																</td>
																<td width="15%" align="center">
																	<%=item[17]== null ? "" : item[17]%>
																</td>
																<td width="10%" align="center">
																	<%=item[3]%>
																	<%--<a
																		href="<%=path%>/commonalityaction.do?method=modify&id=<%=item.getId()%>&flag=info&type=<%=type %>"><%=item.getName()%>
																	</a>
																--%>
																</td>
																<%
																if (item[4] == null) {
																%>
																<td width="15%" align="center"></td>
																<%
																} else {
																%>
																<td width="15%" align="center">
																	<%=item[4]%>
																</td>
																<%
																}
																%>

																<td width="15%" align="center">
																	<%=item[10]%>
																</td>

																<%
																if (item[15] == null) {
																%>
																<td width="25%" align="center"></td>
																<%
																} else {
																%>
																<td width="25%" align="center">
																	<%=item[15]%>
																</td>
																<%
																}
																%>

																<td width="7%" align="center">
																	<a
																		href="<%=path%>/commonalityaction.do?method=modify&id=<%=item[0]%>&flag=modify&parentid=<%=parentid%>&type=<%=type%>"><img
																			src="<%=path%>/imagine/xg.gif" width="15" height="15"
																			border="0" alt="�޸�"> </a>
																</td>
																<td width="8%" align="center">
																	<a
																		href="<%=path%>/commonalityaction.do?method=delete&id=<%=item[0]%>&parentid=<%=parentid%>"
																		onclick="return confirm('�Ƿ�ȷ��ɾ��')"><img
																			src="<%=path%>/imagine/sc.gif" width="15" height="15"
																			border="0" alt="ɾ��"> </a>
																</td>
															</tr>
															<%
																}
																}
															%>


															<tr>
																<td colspan="12">
																	<table align="right">
																		<tr>
																			<td>
																				<a
																					href="<%=path%>/commonalityaction.do?method=movePage&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>&parentid=<%=parentid%>&type=<%=type%>&p_name=<%=p_name%>"><span
																					class="bg-zw">��һҳ</span> </a>
																				<a
																					href="<%=path%>/commonalityaction.do?method=movePage&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>&parentid=<%=parentid%>&type=<%=type%>&p_name=<%=p_name%>"><span
																					class="bg-zw">��һҳ</span> </a>
																				<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
																				<span class="bg-zw">ÿҳ��ʾ</span>
																				<a
																					href="<%=path%>/commonalityaction.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID%>&parentid=<%=parentid%>&type=<%=type%>&p_name=<%=p_name%>"><span
																					class="bg-zw">10</span> </a>
																				<a
																					href="<%=path%>/commonalityaction.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID%>&parentid=<%=parentid%>&type=<%=type%>&p_name=<%=p_name%>"><span
																					class="bg-zw">20</span> </a>
																				<a
																					href="<%=path%>/commonalityaction.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID%>&parentid=<%=parentid%>&type=<%=type%>&p_name=<%=p_name%>"><span
																					class="bg-zw">30</span> </a>
																				<span class="bg-zw">��</span>
																				<span class="bg-zw">��<%=count %>��</span>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>

														</table>
														<table width="99%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td height="10"></td>
															</tr>


														</table>
													</td>
												</tr>
												<%--<tr>
<td height="10"></td>
</tr>
--%>
											</table>
										</td>
									</tr>
								</table>
						<tr>
							<td height="10"></td>
						</tr>
					</table>
	</body>
</html>
