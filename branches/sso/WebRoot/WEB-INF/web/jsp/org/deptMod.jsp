<%@ page language="java" import="java.util.*,com.baosight.mode.TbDept" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String parentId = (String)request.getAttribute("parentid");
String addType = request.getParameter("addtype");
TbDept deptInfo = (TbDept)request.getAttribute("deptInfo");
System.out.println("deptInfo==="+deptInfo);
String deptId = (String)deptInfo.getId();
System.out.println("id=="+deptId);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deptedit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <html:form>
       <table>
    		<tr><td>���ű��</td><td><input type="text" name="code" value="<%=deptInfo.getCode() %>"/></td></tr>
    		<tr><td>��������</td><td><input type="text" name="name" value="<%=deptInfo.getName() %>"/></td></tr>
    		<tr><td>���ż���</td><td><input type="text" name="lvl" value="<%=deptInfo.getLvl() %>"/></td></tr>
    		<tr><td>��ϵ�绰</td><td><input type="text" name="tel" value="<%=deptInfo.getTel() %>"/></td></tr>
    		<tr><td>��ϵ��</td><td><input type="text" name="ctc" value="<%=deptInfo.getCtc() %>"/></td></tr>
    		<tr><td>˵��</td><td><input type="text" name="rem" value="<%=deptInfo.getRem() %>"/></td></tr>
    	</table>
    	<table border="0">
    	<tr>
    		<td><input type="button" value="�ύ" onclick="javascript:submit()"></td>
    		<td><input type="button" value="ȡ��" onclick="history.go(-1)"/></td>
    	</tr>
    </table>
    <input type="hidden" name="id" value="<%=deptId %>"/>
    <input type="hidden" name="parentid" value="<%=parentId %>"/>
    <input type="hidden" name="addtype" value="<%=addType %>"/>
    <input type="hidden" name="action" />
    </html:form>
  </body>
<script language="javascript">
function submit(){
window.location.href="<%=path %>/orgrightdetailaction.do?method=deptAndPostMod&type=dept&deptId=<%=deptId%>";
}
</script>
</html>

