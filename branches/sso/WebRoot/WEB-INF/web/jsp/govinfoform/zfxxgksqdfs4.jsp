<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../inc/taglibs.jsp" %>

<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String infoId = request.getParameter("id");
String sqTime = (String)request.getAttribute("sqTime");
String dfTime = (String)request.getAttribute("dfTime");
String lsNo = (String)request.getAttribute("lsNo");

String id = request.getParameter("id");
String disply=request.getParameter("disply");
String status=request.getParameter("status");
String url=path+"/xxgkAction.do?method=getGovInfoPub&id="+id+"&disply="+disply+"&status="+status;

String passWay = request.getParameter("passWay");
String email=request.getParameter("email");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zfxxgksqdas4.jsp' starting page</title>
    
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

	<script type="text/javascript">
		function checkForm()
		{
			var error="";
			if (document.all.year.value=="")
			{
				error=error+"\n��δ��д��";
				alert(error);
				document.getElementById("year").focus();
				return false;
			}
			if (document.all.month.value=="")
			{
				error=error+"\n��δ��д��";
				alert(error);
				document.getElementById("month").focus();
				return false;
			}
			if (document.all.date.value=="")
			{
				error=error+"\n��δ��д��";
				alert(error);
				document.getElementById("date").focus();
				return false;
			}
			return true;
		}

		function isOrNotEdit()
		{
			if(<%= request.getAttribute("editYesOrNo")%>=='0'){
			  document.getElementById("btnDiv").style.display="none";
			  
			  var inputs=document.getElementsByTagName("input");
				for (i=0;i<inputs.length-2;i++){
					inputs[i].setAttribute('disabled',true);
				}
			}
		}

		function submitValue()
		{
			if(checkForm())
			{
				document.all.dfTime.value = document.all.year.value+'-'+document.all.month.value+'-'+document.all.date.value;
				
				//�����ʼ�������
				if(<%=passWay %>=='17'){
					document.getElementById("hidBtn").style.display="none";//�ύǰ��ť���أ����㷢���ʼ�������
					var inputs = document.getElementsByTagName("input");
					var spans = document.getElementsByTagName("span");
					for (i=0;i<9;i++){
						inputs[i].style.display="none"
						spans[i+1].innerText= inputs[i].value;
					}
					document.all.content.value =document.getElementById("allBody").innerHTML;//�������鴫����̨�����㷢���ʼ�
				}
				
				document.forms[0].submit();
				return true;
			}
		}
		function print(){
			var flag=false; //flag ��ʾ���Ƿ���ȷ�ύ
			if(<%= request.getAttribute("editYesOrNo")%>!='0'){
				if(submitValue()){
					flag=true;
				}
			}
			if(flag || <%=request.getAttribute("editYesOrNo")%>=='0'){
				var id = document.getElementById("id").value;
				var rem = document.getElementById("rem").value;
				var url = "<%=basePath%>zfxxgksqdfs4action.do?method=add&rem="+rem;
				var isOrNotPrint = "print";
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>
  </head>

<body onload="isOrNotEdit();">
<html:form action="/zfxxgksqdfs4action.do?method=addOrEditSave">
<div align="center"  id="allBody">
<table width="620" border="0" align="center">
  <tr>
    <td align="center"><span class="titleTop" style="font-size:18.0pt;font-family:SimSun;">������Ϣ����������飨�ģ�</span></td>
  </tr>
  <tr>
    <td class="content" width="100%" align="right" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��ˮ�񲻴��(<%=lsNo.substring(0,4) %>)��<input type="text" name="year1" value="<%=lsNo.substring(4,lsNo.length()) %>" class="UNDERLINE35"/><span ></span>��</td>
  </tr>
  <tr>
    <td class="content" width="100%" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><html:text property="applicant" readonly="true" styleClass="UNDERLINE150"/><span ></span>��</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;�����أ���������<input type="text" maxlength="4" name="year1" value="<%=sqTime.substring(0,4) %>" class="UNDERLINE35"/><span ></span>��<input type="text" maxlength="2" name="year1" value="<%=sqTime.substring(5,7) %>" class="UNDERLINE35"/><span ></span>��<input type="text" maxlength="2" name="year1" value="<%=sqTime.substring(8,10) %>" class="UNDERLINE35"/><span ></span>���յ���������λ��Ҫ���ȡ</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><html:text property="attr1" readonly="true" styleClass="UNDERLINE320"/><span ></span>�����롣</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;����飬������λ��Ҫ���ȡ��������Ϣ���ڱ����أ���������</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��ְ��Ȩ�޷�Χ���������أ�������δ������δ��ȡ����������Ϣ��</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">���ڡ������ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��ģ����</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">�涨���Դ𸴡�</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;��Ա��𸴲������������յ�����֮����60�������Ϻ�������</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">���� �����л����񹲺͹�ˮ���������������飬������3��������</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">����Ժ�����������ϡ�</td>
  </tr>
  <tr>
    <td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��</td>
  </tr>
  <tr>
    <td class="content" width="100%" align="right"></td>
  </tr>
  <tr>
    <td class="content" width="100%" align="right" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" size="8" maxlength="4" name="year" class="lineInput1" value=<%="".equals(dfTime) ? "" :dfTime.substring(0,4)%>><span ></span>��<input type="text" size="8" maxlength="2"name="month" class="lineInput1" value=<%="".equals(dfTime) ? "" :dfTime.substring(5,7)%>><span ></span>��<input type="text" size="8" maxlength="2" name="date" class="lineInput1" value=<%="".equals(dfTime) ? "" :dfTime.substring(8,10)%>><span ></span>��</td>
  </tr>
  <tr>
    <td class="content" width="100%">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhu">&nbsp;&nbsp;&nbsp;&nbsp;ʹ��ָ�ϣ�</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhuCon">&nbsp;&nbsp;&nbsp;&nbsp;���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��ģ�����ڡ����ڱ��������Թ���Ȩ�޷�Χ����������δ�������߻�ȡ�ġ����εĴ𸴡�</td>
  </tr>
  <html:hidden property="infoId" value="<%=infoId%>"/>
  <html:hidden property="lsNo" value="<%=lsNo%>"/>
  <html:hidden property="sqTime" value="<%=sqTime%>"/>
  <html:hidden property="dfTime"/>
   <input type="hidden" id="id" name="id"  value="${id }"/>
  <input type="hidden" id="rem" name="rem" value="${rem }"/>
  
   <input type="hidden" name="content" id="content">
   <input type="hidden" name="passWay" value=<%=passWay%>>
   <input type="hidden" name="email" value=<%=email%>>
  <tr>
    <td align="center" id="hidBtn"><button id="btnDiv" onclick="javascript:submitValue();"/>ȷ ��</button><button onclick="window.print();">�� ӡ</button><button onclick="window.location='<%=url %>'">�� ��</button></td>
  </tr>
</table>
</div>
</html:form>
</body>
</html>
