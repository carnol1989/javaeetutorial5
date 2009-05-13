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

		<title>My JSP 'infoAudit.jsp' starting page</title>

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
	%>
	<body>
		<form action="/infoAudit.do">
			<input type="hidden" value="1" name="bid">
		<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="5%" align="center" valign="middle">
								&nbsp;
							</td>
							<td width="11%" height="12" align="center" valign="middle">
								<img src="images/icon5.gif" width="7" height="7" />
							</td>
							<td width="84%" class="table2_topic">
								������Ϣ����
							</td>
						</tr>
					</table>
				</td>
          <td background="images/8-2.gif">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" align="center" border="1"  cellpadding="0" cellspacing="1" bgcolor="#0e88b9">			
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
                      <td width="2%" height="24">&nbsp;</td>
                      <td width="16%" align="center" class="tabin_atabno">
                          <a href="<%=path%>/tbGovInfoPubMain.do?method=list&action=all&condition=willAudit"><span class="bg-zw">�������Ϣ�б�</span></a></td>                      
                            <%
								String condition = request.getParameter("condition");
								if (condition.equals("auditing")) {//�������ʽ
							%>
							<td width="16%" align="center"  class="tabin_atab" ><span class="bg-zw">�������Ϣ�б�</span> </td>
							<%} else{%>
 							<td width="16%" align="center" class="tabin_atabno">
 							<a href="<%=path%>/infoAudit.do?method=findAuditList&condition=auditing"><span class="bg-zw">�������Ϣ�б�</span> </td>
 							<%} %>
 							<% if (condition.equals("audited_pass")) { //���ͨ����ʽ %>
                        	<td width="16%" align="center" class="tabin_atab" ><span class="bg-zw">���ͨ���б�</span></td>
                        	<%} else{%>
	                        <td width="16%" align="center" class="tabin_atabno" >
                            <a href="<%=path %>/infoAudit.do?method=findAuditList&condition=audited_pass"  ><span class="bg-zw">���ͨ���б�</span></a></td>
                        	 <%}%>
                         	<% if (condition.equals("audited_notPass")) { //���δͨ���б���ʽ %>
                        	<td width="16%" align="center" class="tabin_atab" ><span class="bg-zw">���δͨ���б�</span></td>
                        	<%} else{%>
	                        <td width="16%" align="center" class="tabin_atabno" >
                            <a href="<%=path %>/infoAudit.do?method=findAuditList&condition=audited_notPass"  ><span class="bg-zw">���δͨ���б�</span></a></td>
                        	 <%}
							 if (condition.equals("invalidApply")) { //��Ч������ʽ %>
                       		<td width="16%" align="center"  class="tabin_atab"><span class="bg-zw">��Ч�����б�</span></td>
                        	<%}else {%>
                        	<td width="16%" align="center"  class="tabin_atabno">
                        	<a href="<%=path %>/infoAudit.do?method=findAuditList&condition=invalidApply"  ><span class="bg-zw">��Ч�����б�</span></a></td>
                        	<% }%> 
                        	<%
							 if (condition.equals("notAccept")) { //����������ʽ %>
                       		<td width="16%" align="center"  class="tabin_atab"><span class="bg-zw">���������б�</span></td>
                        	<%}else {%>
                        	<td width="16%" align="center"  class="tabin_atabno">
                        	<a href="<%=path %>/infoAudit.do?method=findAuditList&condition=notAccept"  ><span class="bg-zw">���������б�</span></a></td>
                        	<% }%> 
                        <td width="29%">&nbsp;</td>
                        </tr>
                       </table>
					<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
					<tr>
					<th width="5%" align="center" height="25">
						���
					</th>
					<th width="12%" align="center">
						����(������)
					</th>
					<th width="15%" align="center">
						���֤/��֯��������
					</th>
					<th width="10%" align="center">
						��������
					</th>
					<th width="15%" align="center">
						��������
					</th>
					<th width="10%" align="center">
						�շ�(δ�շ�)
					</th>
					<th width="10%" align="center">
						״̬
					</th>
					<%
					if (!condition.equals("auditing") || condition.equals("notAccept")) { //�����ͨ�������δͨ������Ч�����б�����ʾ���鿴��
					%>
					<th width="18%" colspan="2" align="center">
						�鿴
					</th>
					<%} else { //���������Ϣ�б�����ʾ����ˡ� %>
					<th width="18%"  colspan="2" align="center">
						����
					</th>
					<%}%>
				</tr>
				<c:forEach items="${curPageList}" var="list" varStatus="loop">
					<tr align="center" class="bg-zw" height="25">
						<td width="5%" align="center">
							${loop.index+1}
						</td>
						<td width="12%" align="center">
							${list.tbGovInfoPub.applicant}
						</td>
						<td width="15%" align="center">
							${list.tbGovInfoPub.certNo}
						</td>
						<td width="10%" align="center">
							${list.tbGovInfoPub.applyType}
						</td>
						<td width="15%" align="center">
							<fmt:formatDate value="${list.tbGovInfoPub.startTime}"
								pattern="yyyy-MM-dd" />
						</td>
						<td width="10%" align="center">
							${list.tbGovInfoPub.fee}
						</td>
						<td width="10%" align="center">
							${list.statusName}
						</td> 
						<% if (condition.equals("auditing")) {//������б�����ʾ����ˡ�%>
						<td width="9%" align="center" >
						<a href="<%=path %>/infoAudit.do?method=delete&id=${list.tbGovInfoPub.id}" onclick="return confirm('ȷ�ϸ�����Ϊ��Ч����');">
						<img src="<%=path %>/images/icon6.gif" width="15" height="15" border="0" alt="��Ч����">
						</a>
						</td>
						<td width="9%" align="center">
						<a href="<%=path %>/tbGovInfoPubMain.do?method=view&id=${list.tbGovInfoPub.id}&disply=<%=condition%>&status=${list.status}"><img src="<%=path%>/images/sh.gif" width="37" height="18" border="0" /></a>
						</td>
						<%}else{//�����б�����ʾ���鿴�� %>
						<td width="18%" align="center" >
						<img src="images/button_1.gif" onmouseover="this.style.cursor='hand'" onclick="window.location='tbGovInfoPubMain.do?method=view&id=${list.tbGovInfoPub.id}&disply=<%=condition%>&status=${list.status}'" />			
						</td>
						<%} %>
					</tr>
				</c:forEach>
			</table>
			<table width="99%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="10"></td>
			  </tr>
			  <tr>
				<td class="tabin_page" align="right">
					<a href="<%=path%>/infoAudit.do?method=movePage&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>&condition=<%=condition%>"><span
							class="bg-zw">��һҳ</span></a>
					<a href="<%=path%>/infoAudit.do?method=movePage&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>&condition=<%=condition%>"><span
							class="bg-zw">��һҳ</span></a>
						<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="bg-zw">ÿҳ��ʾ</span>
					<a href="<%=path%>/infoAudit.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID%>&condition=<%=condition%>"><span
							class="bg-zw">10</span></a>
					<a href="<%=path%>/infoAudit.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID%>&condition=<%=condition%>"><span
							class="bg-zw">20</span></a>
					<a href="<%=path%>/infoAudit.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID%>&condition=<%=condition%>"><span
							class="bg-zw">30</span></a>
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
		</form>
	</body>
</html>
