<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat"
	pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbCommission" />
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String commission = request.getParameter("commission");
	String beginTime = request.getParameter("beginTime");
	String endTime = request.getParameter("endTime");
	if (commission==null || commission.equals(""))
		commission = "";
	if (beginTime==null || beginTime.equals(""))
		beginTime = "";
	if (endTime==null || endTime.equals(""))
		endTime = "";
		
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	Date now = new Date();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
		List commissionList = (List) request.getAttribute("curPageList");
		%>
		<base href="<%=basePath%>">

		<title>My JSP 'pstlvllist.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path %>/js/calendar.js"></script>
	</head>
	<body>
		<form>
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
											<td width="84%" class="table2_topic">
												ί���б�
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
												<table width="98%" border="0" cellpadding="0"
													cellspacing="0" class="table2bgin">
													<tr>
														<th height="30" valign="bottom"></th>
													</tr>
													<tr>
														<td align="center" valign="top">
															<table width="99%" border="0" cellspacing="0"
																cellpadding="0">
																<tr>
																	<td width="2%" height="25">
																		&nbsp;
																	</td>
																	<td width="18%" class="tabin_atab">
																		<span onclick="javascript:commissionList();"
																			onmouseover="this.style.cursor='hand'">ί���б�</span>
																	</td>
																	<td width="18%" class="tabin_atabno">
																		<span onclick="javascript:beCommissionedList();"
																			onmouseover="this.style.cursor='hand'">��ί���б�</span>
																	</td>
																	<td colspan="5"></td>
																</tr>
															</table>
															<table width="99%" border="0" cellpadding="0"
																cellspacing="1" class="tabin_in">
																<tr>
																	<td align="left" valign="bottom" width="100%"
																		colspan="6" height="25">
																		ί������
																		<input type="text" name="commission" maxlength="10"
																			value="<%=commission%>" class="shuruk1"/>
																		&nbsp;��ʼʱ�䣺
																		<input type="text" name="beginTime" maxlength="10"
																			value="<%=beginTime%>" class="shuruk1" onfocus="setday(this)"/>
																		&nbsp;����ʱ�䣺
																		<input type="text" name="endTime" maxlength="10"
																			value="<%=endTime%>" class="shuruk1" onfocus="setday(this)"/>
																		<input name="Submit2" type="button" class="button0" value="�� ѯ" onclick="searchCommission();"
	    		 	                                                      	 onmouseover="this.style.cursor='hand'"/>
	    		 	                                                     &nbsp;
	    		 	                                                     <input name="Submit2" type="button" class="button0" value="�� ��" onclick="javascript:add();" onmouseover="this.style.cursor='hand'"/>
																	</td>
																	
																</tr>
																<tr align="center">
																	<th width="5%" align="center" height="25">
																		���
																	</th>
																	<th align="center" width="20%">
																		����
																	</th>
																	<th align="center" width="15%">
																		��ί����
																	</th>
																	<th align="center" width="20%">
																		ί�п�ʼ����
																	</th>
																	<th align="center" width="20%">
																		ί�н�������
																	</th>
																	<th align="center" width="20%" colspan="1">
																		����
																	</th>
																</tr>
																<%
																	for (int i = 0; i < commissionList.size(); i++) {
																		TbCommission item = (TbCommission) commissionList.get(i);
																%>
																<tr align="center">
																	<td width="5%" height="25" align="center" nowrap="nowrap">
																		<%=i + 1%>
																	</td>
																	<td align="center" width="20%" nowrap="nowrap">
																		<%=item.getCommTitle()%>
																	</td>
																	<td align="center" width="15%" nowrap="nowrap">
																		<%=item.getBecommedName()%>
																	</td>
																	<td align="center" width="20%" nowrap="nowrap">
																		<%=sdf.format(item.getBegintime())%>
																	</td>
																	<td align="center" width="20%" nowrap="nowrap">
																		<%=sdf.format(item.getEndtime())%>
																	</td>
																	<td align="center" width="20%" nowrap="nowrap">
																	<%
																		if (item.getCommFlag()==2 && now.before(item.getEndtime())) {
																		%>
																		<input type="button" class="button0" value="�޸�" name="mod_btn" onclick="modify('<%=item.getId() %>','')">&nbsp;
																		<input type="button" class="button0" value="ɾ��" name="del_btn" onclick="javascript:del('<%=item.getId() %>');">
																		<%
																		}
																		else if ((item.getCommFlag()==1 && now.before(item.getEndtime()))) {
																		%>
																		<input type="button" class="button0" value="ί�д�����" name="mod_btn" onclick="view('<%=item.getId() %>')">
																		<%
																		}
																		else if ((item.getCommFlag()==1 || item.getCommFlag()==2) && (now.after(item.getEndtime()))) {
																		%>
																		<input type="button" class="button0" value="��Чί��" name="mod_btn" onclick="view('<%=item.getId() %>')">
																		<input type="button" class="button0" value="ɾ��" name="del_btn" onclick="javascript:del('<%=item.getId() %>');">
																		<%
																		}
																		else if (item.getCommFlag()==0) {
																		%>
																		<input type="button" class="button0" value="ί�����" name="mod_btn" onclick="view('<%=item.getId() %>')">
																		<%
																		}
																		else if (item.getCommFlag()==3){
																		%>
																		<input type="button" class="button0" value="ί��ʧ��" name="mod_btn" onclick="modify('<%=item.getId() %>','faiture')">
																		<input type="button" class="button0" value="ɾ��" name="del_btn" onclick="javascript:del('<%=item.getId() %>');">
																		<%
																		}
																	 %>
																	 </td>
																</tr>
																<%
																}
																%>
															</table>
															<table width="99%" border="0" cellspacing="0"
																cellpadding="0" align="right">
																<tr>
																	<td height="10"></td>
																</tr>
																<tr>
																	<td class="tabin_page">
																		<a
																			href="<%=path%>/commission.do?method=movePageInfo&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>&commission=<%=commission%>&beginTime=<%=beginTime%>&endTime=<%=endTime%>&type=1&pageName=commlist"><span
																			class="bg-zw">��һҳ</span>
																		</a>
																		<a
																			href="<%=path%>/commission.do?method=movePageInfo&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>&commission=<%=commission%>&beginTime=<%=beginTime%>&endTime=<%=endTime%>&type=1&pageName=commlist"><span
																			class="bg-zw">��һҳ</span>
																		</a>
																		<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
																		<span class="bg-zw">ÿҳ��ʾ</span>
																		<a
																			href="<%=path%>/commission.do?method=resetPageSizeInfo&pageSize=10&sessionID=<%=sessionID%>&commission=<%=commission%>&beginTime=<%=beginTime%>&endTime=<%=endTime%>&type=1&pageName=commlist"><span
																			class="bg-zw">10</span>
																		</a>
																		<a
																			href="<%=path%>/commission.do?method=resetPageSizeInfo&pageSize=20&sessionID=<%=sessionID%>&commission=<%=commission%>&beginTime=<%=beginTime%>&endTime=<%=endTime%>&type=1&pageName=commlist"><span
																			class="bg-zw">20</span>
																		</a>
																		<a
																			href="<%=path%>/commission.do?method=resetPageSizeInfo&pageSize=30&sessionID=<%=sessionID%>&commission=<%=commission%>&beginTime=<%=beginTime%>&endTime=<%=endTime%>&type=1&pageName=commlist"><span
																			class="bg-zw">30</span>
																		</a>
																		<span class="bg-zw">��</span>
																		<span class="bg-zw">��<%=count %>��</span>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td height="20"></td>
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
					</td>
				</tr>
			</table>
		</form><div align="center"> 
	</div></body>
</html>

<script language="javascript">
	function commissionList() {
		window.location.href="<%=path%>/commission.do?method=commissionList&type=1";
	}

	function beCommissionedList() {
		window.location.href="<%=path%>/commission.do?method=commissionList&type=2";
	}

	function searchCommission() {
		var comm_name=document.getElementById("commission").value;
		var beginTime=document.getElementById("beginTime").value;
		var endTime=document.getElementById("endTime").value;
		window.location.href="<%=path%>/commission.do?method=commissionList&type=1&comm_name="+comm_name+"&beginTime="+beginTime+"&endTime="+endTime;
	}
	function add() {
		location.href="<%=path%>/commission.do?method=addCommission&action=add";	
	}
	
	function modify(id,from) {
		if (from=="faiture"){
			if(confirm('�Ƿ��޸�ί�У�')) 
				window.location.href="<%=path%>/commission.do?method=modCommission&id="+id;
		}
		else
			window.location.href="<%=path%>/commission.do?method=modCommission&id="+id;
	}
	function del(id) {
		if(confirm('�Ƿ�ȷ��ɾ��')) 
			window.location.href="<%=path%>/commission.do?method=delCommission&id="+id;
	}
	function view(id) {
		window.location.href="<%=path%>/commission.do?method=viewCommission&id="+id+"&from=comm";
	}
</script>
