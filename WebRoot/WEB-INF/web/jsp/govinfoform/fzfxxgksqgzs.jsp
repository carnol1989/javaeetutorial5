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
String url=path+"/tbGovInfoPubMain.do?method=view&id="+id+"&disply="+disply+"&status="+status;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fzfxxgksqgzs.jsp' starting page</title>
    
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
			if (<%= request.getAttribute("editYesOrNo")%>=='0') {
				document.getElementById("btnDiv").style.display="none";
			
				var inputs=document.getElementsByTagName("input");
				for (i=0;i<inputs.length-2;i++){
					inputs[i].setAttribute('disabled',true);
				}
			}

			var attr2 = document.getElementById("attr2").value;
			if (attr2 != "") {
				selAttr2(attr2);
			}

		}
		function submitValue()
		{
			if(checkForm())
			{
				document.all.dfTime.value = document.all.year.value+'-'+document.all.month.value+'-'+document.all.date.value;
				document.forms[0].submit();
				return true;
			}
		}
		function print(){
			var flag=false;//flag ��ʾ���Ƿ���ȷ�ύ
			if(<%= request.getAttribute("editYesOrNo")%>!='0'){
				if(submitValue()){
					flag=true;
				}
			}
			if(flag || <%=request.getAttribute("editYesOrNo")%>=='0'){
				var id = document.getElementById("id").value;
				var rem = document.getElementById("rem").value;
				var url = "<%=basePath%>fzfxxgksqgzsaction.do?method=add&rem="+rem;
				var isOrNotPrint = "print";
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>
  </head>

<body onload="isOrNotEdit();">
<html:form action="/fzfxxgksqgzsaction.do?method=addOrEditSave" >
<div align="center">
<table width="70%" border="0">
  <tr>
    <td align="center"><span class="titleTop">��������Ϣ���������֪��</span></td>
  </tr>
  <tr>
    <td class="content" width="100%" align="right">��ˮ������(<%=lsNo.substring(0,4) %>)��<input type="text" name="year1" value="<%=lsNo.substring(4,lsNo.length()) %>" class="UNDERLINE35"/>��</td>
  </tr>
  <tr>
    <td class="content" width="100%" align="left"><html:text property="applicant" readonly="true" styleClass="UNDERLINE150" />��</td>
  </tr>
  <tr>
    <td class="content" width="100%">&nbsp;&nbsp;&nbsp;&nbsp;�����أ���������<input type="text" maxlength="4" name="year1" value="<%=sqTime.substring(0,4) %>" class="UNDERLINE35"/>��<input type="text" maxlength="2" name="year1" value="<%=sqTime.substring(5,7) %>" class="UNDERLINE35"/>��<input type="text" maxlength="2" name="year1" value="<%=sqTime.substring(8,10) %>" class="UNDERLINE35"/>���յ���������λ��ͨ��</td>
  </tr>
  <tr>
    <td class="content" width="100%">
    <html:checkbox property="attr2" value="17" disabled="true">�����ʼ�</html:checkbox>
    <html:checkbox property="attr2" value="20" disabled="true">�ʼ�</html:checkbox>
    <html:checkbox property="attr2" value="19" disabled="true">����</html:checkbox>
    <html:checkbox property="attr2" value="21" disabled="true">������ȡ</html:checkbox>
    <html:checkbox property="attr2" value="18" disabled="true">�ֳ�����</html:checkbox>
  </tr>
  <tr>
    <td class="content" width="100%">Ҫ���ȡ<html:text property="attr1" readonly="true" styleClass="UNDERLINE320"/>�Ĳ��ϡ�</td>
  </tr>
  <tr>
    <td class="content" width="100%">&nbsp;&nbsp;&nbsp;&nbsp;����飬���ύ�Ĳ��ϲ����ϡ��Ϻ���������Ϣ�����涨���ڶ�</td>
  </tr>
  <tr>
    <td class="content" width="100%">ʮһ���涨��������Ϣ����������Ҫ�󣬲������ڡ��Ϻ���������Ϣ</td>
  </tr>
  <tr>
    <td class="content" width="100%">�����涨���������ز��ٰ��ա��Ϻ���������Ϣ�����涨�������𸴡�</td>
  </tr>
  <tr>
    <td class="content" width="100%">&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��</td>
  </tr>
  <tr>
    <td class="content" width="100%" align="right"></td>
  </tr>
  <tr>
    <td class="content" width="100%" align="right"><input type="text" size="8" maxlength="4" name="year" class="lineInput1" value=<%="".equals(dfTime) ? "" :dfTime.substring(0,4)%>>��<input type="text" size="8" maxlength="2"name="month" class="lineInput1" value=<%="".equals(dfTime) ? "" :dfTime.substring(5,7)%>>��<input type="text" size="8" maxlength="2" name="date" class="lineInput1" value=<%="".equals(dfTime) ? "" :dfTime.substring(8,10)%>>��</td>
  </tr>
  <tr>
    <td class="content" width="100%">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhu">&nbsp;&nbsp;&nbsp;&nbsp;ʹ��ָ�ϣ�</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhuCon">&nbsp;&nbsp;&nbsp;&nbsp;���ı������ڹ��񡢷��˻�������֯�ύ����������У�δ���ա��л����񹲺͹�������Ϣ�����������͡��Ϻ���������Ϣ�涨���Ĺ涨������κ�������Ϣ�����������</td>
  </tr>
  <html:hidden property="infoId" value="<%=infoId%>"/>
  <html:hidden property="lsNo" value="<%=lsNo%>"/>
  <html:hidden property="sqTime" value="<%=sqTime%>"/>
  <html:hidden property="dfTime"/>
  <html:hidden property="attr2"/>
  <input type="hidden" id="id" name="id"  value="${id }"/>
  <input type="hidden" id="rem" name="rem" value="${rem }"/>
  <tr>
    <td align="center"><button id="btnDiv" onclick="javascript:submitValue()"/>ȷ ��</button><button onclick="print();">�� ӡ</button><button onclick="window.location='<%=url %>'">�� ��</button></td>
  </tr>
</table>
</div>
</html:form>
</body>
</html>
