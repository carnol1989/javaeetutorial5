<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List userList = (List)request.getAttribute("userList");
String type = (String)request.getParameter("type");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <base href="<%=basePath%>">

    <title>My JSP 'resSetlist.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="images/style.css" rel="stylesheet" type="text/css">
	</head>
<body>
	<form name="form1" method="post">
		<table width="97%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<img src="images/icon5.gif" width="11.5" height="14"><span class="bg-zw">&nbsp;&nbsp;�쵼ѡ��</span>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr> 
				<td colspan="5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top"> 
							<table width="98%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
                			    <tr> 
                    				<td height="20" colspan="5" valign="middle" background="<%=path %>/imagine/bg-bt.gif">
                        			<span class="bg-zw"> ��Ա�б� </span>
                    				</td>
             					</tr>
    							<tr align="center" class="bg-zwbt"><%--<input name="allCheck" type="checkbox"></input>ȫѡ</td>--%>
    	   							<th align="center" height="25" width="10%" nowrap="nowrap">���</th>
    	   							<th align="center" width="25%" nowrap="nowrap">�쵼����</th>
    	   							<th align="center" width="25%" nowrap="nowrap">ְλ</th>
    	   							<th align="center" width="25%" nowrap="nowrap">��������</th>
    	   							<th align="center" nowrap="nowrap">&nbsp;</th>
    							</tr>
    							<% if (userList!=null && userList.size()>0){
    								for (int i=0;i<userList.size();i++) {
    									Object[] item = (Object[])userList.get(i);
    								%>
    							<tr align="center">
    								<input type="hidden" name="<%=item[0] %>" value="<%=item[1] %>">
    								<td align="center" height="25" width="10%" nowrap="nowrap"><%=i+1 %></td>
    								<td align="center" width="25%" nowrap="nowrap"><%=item[1] %></td>
    								<td align="center" width="25%" nowrap="nowrap"><%=item[3] %></td>
    								<td align="center" width="25%" nowrap="nowrap"><%=item[4] %></td>
    								<td align="center"><input type="radio" value='<%=item[0] %>' name="userId"></input></td>
    							</tr>		
    								<%}%>
    							<tr>
    								<td align="center" colspan="5">
    								<input type="button" class="button0" value="�ύ" onclick="save('<%=type %>');"></td>
    							</tr>
    							<%}else {%>
    							<tr>
    								<td align="center" colspan="5"><font color="red">��Ϊ���ڲ��ŷ��䷢�Ĳ����쵼�������ˣ���</font></td>
    							</tr>
    							<%}
    							%>
		 					</table> 
 						</td>
 					</tr>
 				</table>
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">
function save(type) {
	var userIdSel;
	var objs = document.forms[0].userId;
	if(objs && objs.length){
		for(i=0;i<objs.length;i++){
			if(objs[i].checked){
				userIdSel=objs[i].value;
				break;
			}
		}
	}else if(objs){
		userIdSel = objs.value;
	}else{
		alert("û��ѡ��ļ�¼��");
		return false;
	}
	window.dialogArguments.document.getElementById("leaderId").value=userIdSel;
	window.dialogArguments.document.getElementById("leaderName").value=document.getElementById(userIdSel).value;
	window.dialogArguments.document.xdocSendForm.submit();
	window.close();
}
</script>
</body>
</html>
