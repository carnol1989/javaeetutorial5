<%@ page language="java" import="java.util.*,com.baosight.mode.TbGovInfoPub" pageEncoding="GBK"%>
<%@ include file="../../inc/taglibs.jsp" %>

<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String infoId = request.getParameter("id");
String sqTime = (String)request.getAttribute("sqTime");
String year = (String)request.getAttribute("year");
String no = (String)request.getAttribute("no");
String attr1 = (String)request.getAttribute("attr1");
String dfTime = (String)request.getAttribute("dfTime");
//List statusList = (List)request.getAttribute("statusList");
//TbGovInfoPub tbGovInfoPub = (TbGovInfoPub)request.getAttribute("tbGovInfoPub");

String id = request.getParameter("id");
String disply=request.getParameter("disply");
String status=request.getParameter("status");

String url="/tbGovInfoPubMain.do?method=view&id="+id+"&disply="+disply+"&status=262144";

String passWay = request.getParameter("passWay");
String email=request.getParameter("email");
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
					for (i=0;i<6;i++){
						inputs[i].style.display="none"
						spans[i+1].innerText= inputs[i].value;
					}
					document.all.content.value =document.getElementById("allBody").innerHTML;//�������鴫����̨�����㷢���ʼ�
				}
				
				document.forms[0].submit();
			}
		}
		
		function isOrNotEdit(){
			if(<%= request.getAttribute("unEdit")%>=='1'){
			  document.getElementById("btnDiv").style.display="none";
			}
		}
		function print(){
			var id = document.getElementById("id").value;
			var url = "<%=basePath%>zfxxgkDealaction.do?method=addSjhc";
			var isOrNotPrint = "print";
			wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
			window.open(wholeURL,'');
		}
		function a(){
			window.location='<%=path %>/tbGovInfoPubMain.do?method=view&id=<%=id%>&disply=<%=disply%>&status=<%=status%>&receipt=yes'
		}
	</script>
  </head>

<body onload="isOrNotEdit();">
<html:form action="/zfxxgkDealaction.do?method=addOrEditSaveSjhc">
<div align="center" id="allBody">
<table width="560" border="0" align="center">
  <tr class="trHeight">
    <td align="center" width="100%" ><span class="titleTop" style="font-size:18.0pt;font-family:SimSun;">������Ϣ���������ռ���ִ</span></td>
  </tr>
  <tr class="trHeight">
    <td align="right" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��ˮ������(${year })��<input type="text" name="no" value="${no }" class="UNDERLINE35"/><span ></span>��</td>
  </tr>
  <tr class="trHeight">
    <td align="left" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" name="applicant" value="${applicant }" readonly="true" class="UNDERLINE150"/><span ></span>��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="center" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;�����أ���������<%=sqTime.substring(0,4) %>��<%=sqTime.substring(5,7) %>��<%=sqTime.substring(8,10) %>���յ���������λ�����</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">Ҫ���ȡ<input type="text" size="40" name="applyManner" value="${applyManner }" readonly="true" class="UNDERLINE320"/><span ></span>�����롣</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��</td>
  </tr>
  <tr class="trHeight">
    <td align="right"></td>
  </tr>
  <tr class="trHeight">
    <td align="right"></td>
  </tr>
   <tr class="trHeight">
    <td align="right"></td>
  </tr>
  <tr>
    <td align="right" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" size="8" name="year" value="<%=dfTime.equals("")?"":dfTime.substring(0,4) %>" class="lineInput1"/><span ></span>��<input type="text" size="6" name="month" value="<%=dfTime.equals("")?"":dfTime.substring(5,7) %>" class="lineInput1"/><span ></span>��<input type="text" size="6" name="date"  value="<%=dfTime.equals("")?"":dfTime.substring(8,10) %>" class="lineInput1"/><span ></span>��</td>
  </tr>
  <tr class="trHeight">
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhu">&nbsp;&nbsp;&nbsp;&nbsp;ʹ��ָ�ϣ�</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhuCon">1�����ı��������������ض����������������Ϣ���������������Ϊ��</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhuCon">2�����ݹ���ʵ����Ҫ���������ؿ���ֱ�ӳ���������Ϣ�����������</td>
  </tr>
  <input type="hidden" name="infoId" value="<%=infoId%>" />
  <input type="hidden" name="lsNo" value="<%=year +""+ no%>" />
  <input type="hidden" name="sqTime" value="<%=sqTime%>" />
  <input type="hidden" name="dfTime" />
  <input type="hidden" id="id" name="id"  value="${id }"/>
  <input type="hidden" name="attr1" value="${attr1}"/>
  <input type="hidden" name="unEdit" value="${unEdit}"/>
  <input type="hidden" name="URL" value=<%=url%>>
  <input type="hidden" name="content" id="content">
   <input type="hidden" name="passWay" value=<%=passWay%>>
   <input type="hidden" name="email" value=<%=email%>>
  <tr>
    <td align="center" id="hidBtn"><button id= "btnDiv" onclick="javascript:submitValue()"/>ȷ ��</button><button onclick="print();">�� ӡ</button><button onclick="history.back();">�� ��</button></td>
  </tr>
</table>
</div>
</html:form>
</body>
</html>
