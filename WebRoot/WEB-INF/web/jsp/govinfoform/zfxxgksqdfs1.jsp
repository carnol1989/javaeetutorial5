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

String url=path+"/tbGovInfoPubMain.do?method=view&id="+id+"&disply="+disply+"&status="+status;

String passWay = request.getParameter("passWay");
String email=request.getParameter("email");
String docNum=request.getParameter("docNum");
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
			var offer1 = document.getElementById("offer1").value;
			var offer2 = document.getElementById("offer2").value;
			
			if(offer1 !=1 && offer1 !=2 ){
				error=error+"���ݲ�������";
				alert(error);
				return false;
			}
			if(offer1 == 2 && offer2 !=1 && offer2 !=2 && offer2 !=3 && offer2 !=4){
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
			var error="";
			var offer1 = document.getElementById("offer1").value;
			var offer2 = document.getElementById("offer2").value;
			
			if(offer1 !=1 && offer1 !=2 ){
				error=error+"���ݲ�������";
				alert(error);
				return false;
			}
			if(offer1 == 2 && offer2 !=1 && offer2 !=2 && offer2 !=3 && offer2 !=4){
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
			document.all.dfTime.value = document.all.year.value+'-'+document.all.month.value+'-'+document.all.date.value;
			
			//�����ʼ�������
				if(<%=passWay %>=='17'){
					document.getElementById("hidBtn").style.display="none";//�ύǰ��ť���أ����㷢���ʼ�������
					var inputs = document.getElementsByTagName("input");
					var spans = document.getElementsByTagName("span");
					for (i=0;i<14;i++){
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
		
		function isOrNotEdit(){
			if(<%= request.getAttribute("unEdit")%>=='1'){
			  document.getElementById("btnDiv").style.display="none";
			  
			  var inputs=document.getElementsByTagName("input");
				for (i=0;i<inputs.length-2;i++){
					inputs[i].setAttribute('disabled',true);
				}
			}
			
			var offer1 = document.getElementById("offer1").value;
			if(offer1 != ""){
				selOffer1(offer1);
			}else{
				selOffer1(0);
			}
			
			var offer2 = document.getElementById("offer2").value;
			if(offer2 != ""){
				selOffer2(offer2);
			}else{
				selOffer2(0);
			}
		}
		
		function selOffer1(str){
			if(str == 1){	
				document.getElementById("offer11").checked=true;
				document.getElementById("offer12").checked=false;
				document.getElementById("offer21").checked=false;
				document.getElementById("offer22").checked=false;
				document.getElementById("offer23").checked=false;
				document.getElementById("offer1").value = '1';
				document.getElementById("offer2").value = '0';
			}
			if(str == 2){	
				document.getElementById("offer11").checked=false;
				document.getElementById("offer12").checked=true;
				document.getElementById("offer1").value = '2';
			}
		}
		
		function selOffer2(str){
			if(str == 1){	
				document.getElementById("offer21").checked=true;
				document.getElementById("offer22").checked=false;
				document.getElementById("offer23").checked=false;
				document.getElementById("offer11").checked=false;
				document.getElementById("offer12").checked=true;
				document.getElementById("offer1").value ='2';
				document.getElementById("offer2").value = document.getElementById("offer21").value;
			}
			if(str == 2){	
				document.getElementById("offer21").checked=false;
				document.getElementById("offer22").checked=true;
				document.getElementById("offer23").checked=false;
				document.getElementById("offer11").checked=false;
				document.getElementById("offer12").checked=true;
				document.getElementById("offer1").value ='2';
				document.getElementById("offer2").value = document.getElementById("offer22").value;
			}
			if(str == 3){	
				document.getElementById("offer21").checked=false;
				document.getElementById("offer22").checked=false;
				document.getElementById("offer23").checked=true;
				document.getElementById("offer11").checked=false;
				document.getElementById("offer12").checked=true;
				document.getElementById("offer1").value ='2';
				document.getElementById("offer2").value = document.getElementById("offer23").value;
			}
		}
		function print(){
			var flag=false;//flag ��ʾ���Ƿ���ȷ�ύ
			if(<%= request.getAttribute("unEdit")%>!='1'){
				if(submitValue()){
					flag=true;
				}
			}
			var flag=true;
			if(flag || <%= request.getAttribute("unEdit")%>=='1'){
				var id = document.getElementById("id").value;
				var url = "<%=basePath%>zfxxgkDealaction.do?method=addOne";
				var isOrNotPrint = "print";
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>
  </head>

<body onload="isOrNotEdit();">
<html:form action="/zfxxgkDealaction.do?method=addOrEditSaveOne">
<div align="center" id="allBody">
<table width="590" border="0" align="center">
  <tr class="trHeight">
    <td align="center" width="100%"><span class="titleTop" style="font-size:18.0pt;font-family:SimSun;">������Ϣ����������飨һ��</span></td>
  </tr>
  <tr class="trHeight">
    <td align="right" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��ˮ���Ŵ�(${year })��<input type="text" name="year1" value="${no }" class="UNDERLINE35"/><span></span>��</td>
  </tr>
  <tr class="trHeight">
    <td align="left" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" name="applicant" value="${applicant }" readonly="true" class="UNDERLINE150"/><span></span>��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;�����أ���������<input type="text" name="year1" value="<%=sqTime.substring(0,4) %>" class="UNDERLINE35"/>&nbsp;<span></span>��<input type="text" name="year1" value="<%=sqTime.substring(5,7) %>" class="UNDERLINE35"/>&nbsp;<span></span>��<input type="text" name="year1" value="<%=sqTime.substring(8,10) %>" class="UNDERLINE35"/>&nbsp;<span></span>���յ���������λ��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">Ҫ���ȡ<input type="text" name="applyManner" value="${applyManner }" readonly="true" class="UNDERLINE320"/><span></span>�����롣</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;����飬�ִ����£�</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="offer11" id="offer11" value="1" onclick="selOffer1(1);"/><span></span>&nbsp;������λ��Ҫ���ȡ����Ϣ���ڡ��л����񹲺͹�������</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">Ϣ�����������ھ��������Ϻ���������Ϣ�����涨����ʮһ����</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��������������������Ϣ��������λ������ͨ���Ϻ�ˮ����</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">��www.shanghaiwater.gov.cn)��ȡ��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="offer12" id="offer12" value="2" onclick="selOffer1(2);"/><span></span>&nbsp;&nbsp;������λ��Ҫ���ȡ����Ϣ���ڱ����أ������������빫</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">����������Ϣ�����ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ������</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">�涨��<input type="checkbox" name="offer21" id="offer21" value="1" onclick="selOffer2(1);"/><span></span>�����ؽ������ṩ  <input type="checkbox" name="offer22" id="offer22" value="2" onclick="selOffer2(2);"/><span></span>�����ؽ�ͨ�������ʼ� <input type="checkbox" name="offer23" id="offer23" value="3" onclick="selOffer2(3);"/><span></span>�ʼ� &nbsp;��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">ʽ�����ṩ��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content" align="left" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��</td>
  </tr>
 <tr class="trHeight">
    <td width="100%" class="content">&nbsp;</td>
  </tr>
  <tr class="trHeight">
    <td align="right" width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;"><input type="text" size="8" name="year" value="<%=dfTime.equals("")?"":dfTime.substring(0,4) %>" class="lineInput1"/><span></span>��<input type="text" size="8" name="month" value="<%=dfTime.equals("")?"":dfTime.substring(5,7) %>" class="lineInput1"/><span></span>��<input type="text" size="8" name="date" value="<%=dfTime.equals("")?"":dfTime.substring(8,10) %>" class="lineInput1"/><span></span>��</td>
  </tr>
  <tr class="trHeight">
    <td width="100%" class="content">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhu" align="left">&nbsp;&nbsp;&nbsp;&nbsp;ʹ��ָ�ϣ�</td>
  </tr>
  <tr>
    <td width="100%" class="BeiZhuCon" align="left">&nbsp;&nbsp;&nbsp;&nbsp;���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ���������ڶԡ�������������Ϣ��Χ���Ĵ𸴡�</td>
  </tr>
  <input type="hidden" name="infoId" value="<%=infoId%>" />
  <input type="hidden" name="lsNo" value="<%=year+""+no %>" />
  <input type="hidden" name="sqTime" value="<%=sqTime%>" />
  <input type="hidden" name="dfTime" />
  <input type="hidden" id="id" name="id"  value="${id }"/>
  <input type="hidden" name="offer1" value="${offer1 }"/>
  <input type="hidden" name="offer2" value="${offer2 }"/>
  <input type="hidden" name="attr1" value="${attr1}"/>
  <input type="hidden" name="unEdit" value="${unEdit}"/>
    <input type="hidden" name="content" id="content">
  <input type="hidden" name="passWay" value=<%=passWay%>>
  <input type="hidden" name="email" value=<%=email%>>
  <input type="hidden" name="docNum" value=<%=docNum%>>
  <tr>
    <td align="center" id="hidBtn"><button id="btnDiv" onclick="javascript:submitValue()"/>ȷ ��</button><button onclick="print();">�� ӡ</button><button onclick="window.location='<%=url%>'">�� ��</button></td>
  </tr>
</table>
</div>
</html:form>
</body>
</html>
