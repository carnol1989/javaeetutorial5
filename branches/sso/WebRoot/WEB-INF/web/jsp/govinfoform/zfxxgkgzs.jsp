<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../inc/taglibs.jsp" %>

<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String infoId = request.getParameter("id");
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
	<link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">	
	<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">	
	<link href="<%=path %>/css/govinfoform.css" rel="stylesheet" type="text/css">	
	<script src="../../../../javascript/validate.js"></script>
	<script type='text/javascript' src='<%=strpath%>/dwr/interface/pstlvl.js'></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>
	<script type="text/javascript" src="<%=path %>/javascript/calendar.js"></script>
	<script type="text/javascript" src="<%=path %>/javascript/calendar-zh.js"></script>
	<script type="text/javascript" src="<%=path %>/javascript/calendar-setup.js"></script>

  </head>

  <body>
  		<html:form action="/zfxxgkgzsaction.do?method=addOrEditSave" >
<div align="center">
<table width="500" border="0">
  <tr>
    <td align="center"><span class="style1">������Ϣ������֪��</span></td>
  </tr>
  <tr>
    <td align="right"><html:text property="attr1" styleClass="UNDERLINE100"/>(<html:text property="attr2" styleClass="S_35"/>)��<html:text property="attr3" styleClass="UNDERLINE35"/>��-������</td>
  </tr>
  <tr>
    <td align="left"><html:text property="attr4" styleClass="UNDERLINE150" value="�������������������ƣ�"/>��</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;��������<html:text property="attr5" styleClass="UNDERLINE80"/>��<html:text property="attr6" styleClass="UNDERLINE35"/>��<html:text property="attr7" styleClass="UNDERLINE35"/>���յ���������λ����</td>
  </tr>
  <tr>
    <td>��<html:text property="attr8" styleClass="UNDERLINE320"/>�����룬������</td>
  </tr>
  <tr>
    <td>��֤����<html:text property="attr9" styleClass="UNDERLINE100"/>(<html:text property="attr10" styleClass="S_35"/>)��<html:text property="attr11" styleClass="UNDERLINE35"/>��-�ա�</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;���飬������λ�������ȡ��������Ϣ���ڿɹ�����������</td>
  </tr>
  <tr>
    <td>Ϣ���룬���ݡ��Ϻ���������Ϣ�����涨����ʮ�����ڣ�һ����</td>
  </tr>
  <tr>
    <td>�Ĺ涨�������ؽ�ͨ��������ʽ�ṩ��������Ϣ��</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="attr12" value="1">&nbsp;&nbsp;ֽ��</html:radio></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="attr12" value="2">&nbsp;&nbsp;�����ʼ�</html:radio></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="attr12" value="3">&nbsp;&nbsp;����</html:radio></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="attr12" value="4">&nbsp;&nbsp;����</html:radio></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="attr12" value="5">&nbsp;&nbsp;������ʽ</html:radio>������Ϊ<html:text property="attr13" styleClass="UNDERLINE150"/></input></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����Ĺ涨������</td>
  </tr>
  <tr>
    <td>�ؽ���������λ����ȡʵ�ʷ����ļ���/����/�ʼ�/���ͷ��á���</td>
  </tr>
  <tr>
    <td>���յ�����֪��󣬵�<html:text property="attr14" styleClass="UNDERLINE170"/>����ɷѵȾ�����</td>
  </tr>
  <tr>
    <td>���������ؽ����ݡ��Ϻ���������Ϣ�����涨����ʮ�����ڶ���</td>
  </tr>
  <tr>
    <td>�Ĺ涨����������λ������������10������������������λ��</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��</td>
  </tr>
  <tr>
    <td align="right">������ӡ�£�</td>
  </tr>
  <tr>
    <td align="right"><html:text property="attr15" styleClass="S_35"/>��<html:text property="attr16" styleClass="S_35"/>��<html:text property="attr17" styleClass="S_35"/>��</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <html:hidden property="infoId" value="<%=infoId%>"/>
  <tr>
    <td align="center"><button onclick="CheckForm()"/>ȷ ��</button><button onclick="window.print();">�� ӡ</button><button onclick="history.back()">�� ��</button></td>
  </tr>
</table>
</div>
		
		</html:form>
  </body>
</html>

<script type="text/javascript">
			function chk(){
		    var code = document.getElementById("code").value;
		    var name = document.getElementById("name").value;
		    
		    if(name == ""){
		
				document.getElementById("fname").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				//document.getElementById("name").focus();
				return false;	
				
			}else{
				    if(getLen(document.getElementById("name").value) > 32){
					document.getElementById("fname").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���32���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					//document.getElementById("name").focus();
					return false;	
								
				}
				else{document.getElementById("fname").innerHTML = "";}
			}
					   
		 
			if(code == ""){
		
				document.getElementById("fcode").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				//document.getElementById("code").focus();
				return false;	
				
			}else{
				    if(getLen(document.getElementById("code").value) > 32){
					document.getElementById("fcode").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���32���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					//document.getElementById("code").focus();
					return false;	
								
				}
				else{document.getElementById("fcode").innerHTML = "";}
			}	
			

			
			
	}
			function CheckForm(){
/*		   var code = document.getElementById("code").value;
		   var name = document.getElementById("name").value;
		    if(name == ""){alert("�������벻����"); return false;}
			if(getLen(document.getElementById("name").value) >32){alert("�ַ��������"); return false;}
			if(code == ""){alert("�������벻����"); return false;}
			if(getLen(document.getElementById("code").value) >32){alert("�ַ��������"); return false;}
						pstlvlNameCheck();
           
            if(this.pstlvlNameflag=="false"){alert("�����ظ�"); return false;}
            			pstlvlCodeCheck();
           
            if(this.pstlvlCodeflag=="false"){alert("�����ظ�"); return false;}
	*/		
				document.forms[0].submit();
				}

	function returnl()
	{	
		var path=document.getElementById("path").value;
		window.location.replace(path+"/vehiclesapplyaction.do?method=list");
	}
</script>
