<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String currentPath = request.getServletPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP '' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<script src="../../../../javascript/validate.js"></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<style>
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:active {text-decoration: none;}
		a:hover {text-decoration: none;}
		</style> 
	</head>
	<%
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
		<html:form action="/messages.do">

			<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40"  valign="middle" background="images/8-1.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="5%" align="center" valign="middle">
								&nbsp;
							</td>
							<td width="11%" height="12" align="center" valign="middle">
								<img src="images/icon5.gif" width="7" height="7" />
							</td>
							<td width="84%" class="table2_topic">
								��ϢͨѶ
							</td>
						</tr>
					</table>
				</td>
          <td background="images/8-2.gif">&nbsp;</td>
        </tr>
      </table>
			  <table width="100%" align="center" border="1" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">			
			<tr>
          <td>
		 <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#0e88b9">			
			<tr>
          <td><table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
                <tr>
                  <th height="30" valign="bottom"></th>
                </tr>
                <tr>
                  <td align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0"> 
                  <tr>
											<td width="15" height="24">
											</td>
											<td width="16%" class="tabin_atab">�ռ���</td>
											<td width="16%" class="tabin_atabno">
												<a href="<%=path%>/sendMessages.do?method=sendBoxList">������</a>
											</td>
											<td class="bg-zw" align="right" >
												<input name="Submit2" type="button" class="button0" value="����Ϣ" onclick="location.href='<%=path%>/messages.do?method=sendMessages&action=add';"
12��		    		 	                                                      	 onmouseover="this.style.cursor='hand'"/>
												&nbsp;&nbsp;
											</td>
										</tr>
									</table>
							<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
							<tr>
								<th width="5%" height="24" align="center" class="bg-zwbt">
									<span style="font-family:����;color:#000000; font-size:13px">���</span>
								</th>
								
								<th height="24" width="10%" align="center" class="bg-zwbt">
								    <span style="font-family:����;color:#000000; font-size:13px">���</span>
								</th>
								
								<th height="24" width="30%" align="center" class="bg-zwbt">
									<span style="font-family:����;color:#000000; font-size:13px">����</span>
								</th>
								<th height="24" width="17%" align="center" class="bg-zwbt">
									<span style="font-family:����;color:#000000; font-size:13px">������</span>
								</th>
								<th height="24" width="17%" align="center" class="bg-zwbt">
									<span style="font-family:����;color:#000000; font-size:13px">����ʱ��</span>
								</th>
								<th height="24" width="10%" align="center" class="bg-zwbt">
									<span style="font-family:����;color:#000000; font-size:13px">״̬</span>
								</th>
								<th align="center" colspan="3" class="bg-zwbt">
									<span style="font-family:����;color:#000000; font-size:13px">����</span>
								</th>
							</tr>
							<c:forEach items="${curPageList}" var="list" varStatus="loop">

								<tr>

									<td width="5%" align="center" height="24" class="bg-zwbt">
										${loop.index+1}
									</td>
									
									<td height="24" width="10%" align="center" class="bg-zwbt">
								        <c:choose>
						    			  <c:when test="${list.messageType == 10}">����</c:when>
						    			  <c:when test="${list.messageType == 20}">����</c:when>
						    			  <c:when test="${list.messageType == 30}">����</c:when>
						    			  <c:when test="${list.messageType == 40}">�߰�</c:when>
						    			  <c:when test="${list.messageType == 50}">�������</c:when>
						    			</c:choose>
								    </td>

									<td height="24" width="20%" align="center" class="bg-zwbt">
										${list.title }
									</td>
									<td height="24" width="17%" align="center" class="bg-zwbt">
										${list.senderName }
									</td>
									<td height="24" width="18%" align="center" class="bg-zwbt">
										<fmt:formatDate value="${list.sendTime }"
											pattern="yyyy-MM-dd HH:mm" />
									</td>
									<c:if test="${list.status==2 }">
										<td height="24" width="10%" align="center" class="bg-zwbt">
											<font color="red">δ�鿴</font>
										</td>
									</c:if>
									<c:if test="${list.status==3 }">
										<td height="24" width="10%" align="center" class="bg-zwbt">
											<font color="#888888">�Ѳ鿴</font>
										</td>
									</c:if>
									<td width="5%" align="center" class="bg-zwbt">
										<a href="<%=path%>/messages.do?method=lookupMessages&id=${list.id }&source=receivers"><span
											class="bg-zw"><img src="<%=path%>/images/icon10.gif" width="15" height="15" border="0" alt="�鿴">
										</span>
										</a>
									</td>
									<td width="5%" align="center" class="bg-zwbt">
										<a href="<%=path%>/messages.do?method=delete&id=${list.id }"
											onclick="return confirm('�Ƿ�ȷ��ɾ��')"><span class="bg-zw"><img
													src="<%=path%>/imagine/sc.gif" width="15" height="15" border="0" alt="ɾ��">
										</span>
										</a>
									</td>
									<td width="5%" align="center" class="bg-zwbt">
										<a
											href="<%=path%>//messages.do?method=sendMessages&action=revert&id=${list.id }&source=shouwenuser"><span
											class="bg-zw"><img src="<%=path%>/imagine/log1.gif" width="15" height="15" border="0" alt="�ظ�">
										</span>
										</a>
									</td>
								</tr>

							</c:forEach>
						</table>
				<table width="99%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="10"></td>
			  </tr>
			  <tr>
				<td class="tabin_page" align="right">
						<a
							href="<%=path%>/messages.do?method=movePage&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>"><span
							class="bg-zw">��һҳ</span>
						</a>
						<a
							href="<%=path%>/messages.do?method=movePage&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>"><span
							class="bg-zw">��һҳ</span>
						</a>
						<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
						<span class="bg-zw">ÿҳ��ʾ</span>
						<a
							href="<%=path%>/messages.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID%>"><span
							class="bg-zw">10</span>
						</a>
						<a
							href="<%=path%>/messages.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID%>"><span
							class="bg-zw">20</span>
						</a>
						<a
							href="<%=path%>/messages.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID%>"><span
							class="bg-zw">30</span>
						</a>
						<span class="bg-zw">��</span>
						<span class="bg-zw">��<%=count %>��</span>
					</td>
				</tr>
				</table></td></tr>
			<tr>
			    <td height="20"></td>
			 </tr>	
			</table></td></tr>
			<%--<tr>
			<td height="10"></td>
			</tr>
			--%></table>
			</td></tr><tr>
			<td height="10"></td>
			</tr>
			</table></td></tr></table>
		</html:form>
	</body>
</html>
