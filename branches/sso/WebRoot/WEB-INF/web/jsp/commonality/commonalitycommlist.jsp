<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbCommonalityComm" />
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String type = (String) request.getParameter("type");
	String parentid = (String) request.getAttribute("parentId");
	if (parentid == null || "".equals(parentid))
		parentid = (String) request.getParameter("parentId");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>����ͨѶ��</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		function selectByComm()
			{
				//var parentId=document.getElementById("parentId").value;
            	var name=document.getElementById("name").value;
            	window.location.replace("<%=path%>/commonalityCommAction.do?method=list&action=comm&name="+name+"&type=<%=type%>");
			}
			
			function add()
			{
			if ("<%=parentid%>"=="null" || "<%=parentid%>"=="")
				{
					alert("��ѡ����������!");
					return false;
				}
			else
            	window.location.replace("<%=path%>/commonalityCommAction.do?method=add&action=add&parentid=<%=parentid%>&type=<%=type%>");
            
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
		//List commList = (List) request.getAttribute("commList");

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

		List commonalityCommList = (List) request
				.getAttribute("curPageList");
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
							<td height="25" colspan="3" valign="bottom" align="left">
								<%--<select name="parentId">
									<option value="">
										����
									</option>
									<%
											if (commList != null) {
											for (int i = 0; i < commList.size(); i++) {
												TbCommonalityComm comm = (TbCommonalityComm) commList
												.get(i);
												if (parentid != null && parentid.equals(comm.getId())) {
									%>
									<option value="<%=comm.getId()%>" selected="selected">
										<%=comm.getName()%>
									</option>
									<%
									} else {
									%>
									<option value="<%=comm.getId()%>">
										<%=comm.getName()%>
									</option>
									<%
											}
											}
										}
									%>
								</select>
								&nbsp;&nbsp;&nbsp;
								--%><span>�����ƣ�</span>
								<input type="text" name="name" value="${name}" class="shuruk1" />
								<input name="Submit2" type="submit" class="button0" value="�� ѯ"
									onclick="selectByComm();"
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
															<td width="20%" class="tabin_atabno">
																<a
																	href="commonalityaction.do?method=list&parentid=<%=parentid%>&type=<%=type%>"><span
																	class="bg-zw">����ͨѶ¼</span>
																</a>
															</td>
															<td width="20%" class="tabin_atab">
																����ͨѶ��
															</td>
															
															<td width="58%" colspan="3">
																&nbsp;
															</td>
														</table>
														<table width="99%" border="0" cellpadding="0"
															cellspacing="1" class="tabin_in">
															<tr>
																<td height="25" colspan="6" valign="bottom"
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
																<th width="35%" align="center">
																	����
																</th>
																<th width="10%" align="center">
																	�Ƿ�����
																</th>
																<th width="40%" align="center">
																	��ע
																</th>
																<th width="10%" align="center" colspan="2">
																	����
																</th>
															</tr>
															<%
																	if (commonalityCommList != null) {
																	for (int i = 0; i < commonalityCommList.size(); i++) {
																		Object[] item = (Object[]) commonalityCommList.get(i);
															%>
															<tr align="center" class="bg-zw">
																<td width="5%" height="25" align="center">
																	<%=i+1%>
																</td>
																<td width="35%" align="center">
																	<%=item[2]%>
																</td>
																<td width="10%" align="center">
																	<%
																	if (item[3].toString().equals("1")) {
																	%>
																	��
																	<%
																	} else {
																	%>
																	��
																	<%
																	}
																	%>
																</td>
																<td width="40%" align="center">
																	<%=item[5]%>
																</td>
																<%
																if (item[3].toString().equals("0")) {
																%>
																<td width="5%" align="center">
																	<a
																		href="<%=path%>/commonalityCommAction.do?method=modify&id=<%=item[0]%>&type=<%=type%>"><img
																			src="<%=path%>/imagine/xg.gif" width="15" height="15"
																			border="0" alt="�޸�"> </a>
																</td>
																<td width="5%" align="center">
																	<a
																		href="<%=path%>/commonalityCommAction.do?method=delete&id=<%=item[0]%>&parentId=<%=item[1]%>&type=<%=type%>"
																		onclick="return confirm('�Ƿ�ȷ��ɾ��')"><img
																			src="<%=path%>/imagine/sc.gif" width="15" height="15"
																			border="0" alt="ɾ��"> </a>
																</td>
																<%
																} else {
																%>
																<td width="10%" align="center" colspan="2">
																	<a
																		href="<%=path%>/commonalityCommAction.do?method=modify&id=<%=item[0]%>&type=<%=type%>"><img
																			src="<%=path%>/imagine/xg.gif" width="15" height="15"
																			border="0" alt="�޸�"> </a>
																</td>
																<%
																}
																%>

															</tr>
															<%
																	}
																}
															%>

															<tr>
																<td colspan="6">
																	<table align="right">
																		<tr>
																			<td>
																				<a
																					href="<%=path%>/commonalityCommAction.do?method=movePage2&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>&type=<%=type%>&parentid=<%=parentid%>"><span
																					class="bg-zw">��һҳ</span> </a>
																				<a
																					href="<%=path%>/commonalityCommAction.do?method=movePage2&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>&type=<%=type%>&parentid=<%=parentid%>"><span
																					class="bg-zw">��һҳ</span> </a>
																				<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
																				<span class="bg-zw">ÿҳ��ʾ</span>
																				<a
																					href="<%=path%>/commonalityCommAction.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID%>&type=<%=type%>&parentid=<%=parentid%>"><span
																					class="bg-zw">10</span> </a>
																				<a
																					href="<%=path%>/commonalityCommAction.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID%>&type=<%=type%>&parentid=<%=parentid%>"><span
																					class="bg-zw">20</span> </a>
																				<a
																					href="<%=path%>/commonalityCommAction.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID%>&type=<%=type%>&parentid=<%=parentid%>"><span
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
