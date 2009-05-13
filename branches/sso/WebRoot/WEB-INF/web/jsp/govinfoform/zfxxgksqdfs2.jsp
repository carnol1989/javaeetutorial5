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
String applyManner = (String)request.getAttribute("applyManner");
String attr1 = (String)request.getAttribute("attr1");
String dfTime = (String)request.getAttribute("dfTime");
//List statusList = (List)request.getAttribute("statusList");
//TbGovInfoPub tbGovInfoPub = (TbGovInfoPub)request.getAttribute("tbGovInfoPub");

String id = request.getParameter("id");
String disply=request.getParameter("disply");
String status=request.getParameter("status");
String passWay = request.getParameter("passWay");
String email=request.getParameter("email");

String url=path+"/xxgkAction.do?method=getGovInfoPub&id="+id+"&disply="+disply+"&status="+status+"&passWay="+passWay+"&email="+email;


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
			var inforank = document.getElementById("inforank").value;
			
			if(inforank !=1 && inforank !=2 && inforank !=3){
				error=error+"���ݲ�������";
				alert(error);
				return false;
			}
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
					for (i=0;i<12;i++){
						if(inputs[i].type == 'checkbox'){
							inputs[i].setAttribute('disabled',true);
						}else{
							inputs[i].style.display="none";
							spans[i+1].innerText= inputs[i].value;
						}
					}
					document.all.content.value =document.getElementById("allBody").innerHTML;//�������鴫����̨�����㷢���ʼ�
				}
				
				document.forms[0].submit();
				return true;
			}
		}
		
		function isOrNotEdit(){
			if(<%= request.getAttribute("unEdit")%>=='1'){
			  document.getElementById("btnDiv").style.display="none";
			  
			  var inputs=document.getElementsByTagName("input");
				for (i=0;i<inputs.length-2;i++){
					inputs[i].setAttribute('disabled',true);
				}
			}
			
			var inforank = document.getElementById("inforank").value;
			if(inforank != ""){
				selInforank(inforank);
			}else{
				selInforank(0);
			}
		}
		
		function selInforank(str){
			if(str == 1){	
				document.getElementById("inforank1").checked=true;
				document.getElementById("inforank2").checked=false;
				document.getElementById("inforank3").checked=false;
				document.getElementById("inforank").value = document.getElementById("inforank1").value;
			}
			if(str == 2){	
				document.getElementById("inforank1").checked=false;
				document.getElementById("inforank2").checked=true;
				document.getElementById("inforank3").checked=false;
				document.getElementById("inforank").value = document.getElementById("inforank2").value;
			}
			if(str == 3){	
				document.getElementById("inforank1").checked=false;
				document.getElementById("inforank2").checked=false;
				document.getElementById("inforank3").checked=true;
				document.getElementById("inforank").value = document.getElementById("inforank3").value;
			}
		}
		function print(){
			var flag=false;//flag ��ʾ���Ƿ���ȷ�ύ
			if(<%= request.getAttribute("unEdit")%>!='1'){
				if(submitValue()){
					flag=true;
				}
			}
			
			if(flag || <%= request.getAttribute("unEdit")%>=='1'){
				var id = document.getElementById("id").value;
				var url = "<%=basePath%>zfxxgkDealaction.do?method=addTwo";
				var isOrNotPrint = "print";
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>
  </head>

  <body onload="isOrNotEdit();">
<html:form action="/zfxxgkDealaction.do?method=addOrEditSaveTwo" >
<div align="center" id="allBody">
<table width="570" border="0" align="center">
  <tr class="trHeight">
    <td align="center" width="100%" ><span class="titleTop" style="font-size:18.0pt;font-family:SimSun;">������Ϣ����������飨����</span></td>
  </tr>
  <tr class="trHeight">
    <td align="right" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��ˮ���ش�(${year })��<input type="text" name="year1" value="${no }" class="UNDERLINE35"/><span></span>��</td>
  </tr>
  <tr class="trHeight">
    <td align="left" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" name="applicant" value="${applicant }" readonly="true" class="UNDERLINE150" /><span></span>��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="center" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">�����أ���������<input type="text" name="year1" value="<%=sqTime.substring(0,4) %>" class="UNDERLINE35"/><span></span>��<input type="text" name="year1" value="<%=sqTime.substring(5,7) %>" class="UNDERLINE35"/><span></span>��<input type="text" name="year1" value="<%=sqTime.substring(8,10) %>" class="UNDERLINE35"/><span></span>���յ���������λ��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">Ҫ���ȡ<input type="text" name="applyManner" value="${applyManner }" readonly="true" class="UNDERLINE320"/><span></span>�����롣</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;����飬������λ��Ҫ���ȡ��������Ϣ���ڡ��л�����</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">�͹�������Ϣ������������ʮ�������Ŀ���Ϻ���������Ϣ��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">���涨����ʮ������һ�����涨�ģ�</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="inforank1" id="inforank1" value="1" onclick="selInforank(1);"/><span></span>&nbsp;��������&nbsp;&nbsp;<input type="checkbox" name="inforank2" id="inforank2" value="2" onclick="selInforank(2);"/><span></span>&nbsp;��ҵ����&nbsp;&nbsp;<input type="checkbox" name="inforank3" id="inforank3" value="3" onclick="selInforank(3);"/><span></span>&nbsp;������˽��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹�������Ϣ�����������ڶ�ʮһ����</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">����������Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ�������</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">�Ĺ涨�������أ��������������蹫����</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;��Ա��𸴲������������յ�����֮����60�������Ϻ�</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">���������� �����л����񹲺͹�ˮ���������������飬������</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">3������������Ժ�����������ϡ�</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��</td>
  </tr>
  <tr class="trHeight">
    <td align="right" width="100%" class="content"></td>
  </tr>
  <tr class="trHeight">
    <td align="right" width="100%" class="content"></td>
  </tr>
  <tr class="trHeight">
    <td align="right" width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" size="8" name="year" value="<%=dfTime.equals("")?"":dfTime.substring(0,4) %>" class="lineInput1"/><span></span>��<input type="text" size="8" name="month" value="<%=dfTime.equals("")?"":dfTime.substring(5,7) %>" class="lineInput1"/><span></span>��<input type="text" size="8" name="date" value="<%=dfTime.equals("")?"":dfTime.substring(8,10) %>" class="lineInput1"/><span></span>��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ʹ��ָ�ϣ�</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhuCon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ���������ڡ�������Ϣ���ڲ��蹫����Χ�����εĴ𸴡�</td>
  </tr>
  <input type="hidden" name="infoId" value="<%=infoId%>" />
  <input type="hidden" name="lsNo" value="<%=year+""+no %>" />
  <input type="hidden" name="sqTime" value="<%=sqTime%>" />
  <input type="hidden" name="dfTime" />
  <input type="hidden" name="inforank" id="inforank" value="${inforank}"/>
  <input type="hidden" name="attr1" value="${attr1}"/>
  <input type="hidden" name="unEdit" value="${unEdit}"/>
  <input type="hidden" id="rem" name="rem"  value="${rem }"/>
  <input type="hidden" id="id" name="id"  value="${id }"/>
  <input type="hidden" name="content" id="content">
  <input type="hidden" name="passWay" value=<%=passWay%>>
  <input type="hidden" name="email" value=<%=email%>>
  <tr>
    <td align="center" width="100%" id="hidBtn"><button id="btnDiv" onclick="javascript:submitValue()"/>ȷ ��</button><button onclick="window.print();">�� ӡ</button><button onclick="window.location='<%=url %>'">�� ��</button></td>
  </tr>
</table>
</div>
</html:form>
</body>
<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0
		id=wb name=wb width=0></OBJECT>
</html>
