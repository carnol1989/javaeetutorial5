<%@ page language="java"  pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
    <script src="../../../../javascript/validate.js"></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>
	<script type="text/javascript">
		//�ύҳ��
		function subForm(){
			//��֤
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var day = document.getElementById("day").value;
			var year1 = document.getElementById("year1").value;
			var month1 = document.getElementById("month1").value;
			var day1 = document.getElementById("day1").value;
			
			var attr1 = document.getElementById("attr1").value;
			var	attr2 = document.getElementById("attr2").value;
			var	numb = document.getElementById("numb").value;
			var	consultedName = document.getElementById("consultedName").value;
			var	applicant = document.getElementById("applicant").value;
			var	cause = document.getElementById("cause").value;
			var	address = document.getElementById("address").value;
			var	postalcode = document.getElementById("postalcode").value;
			
			if(""==attr1){
				alert("����Ϊ��");return false;
			}
			if(""==attr2){
				alert("����Ϊ��");return false;
			}
			if(""==numb || !numb.match(/^[0-9]+$/)){
				alert("����Ų���Ϊ���ұ���������");return false;
			}
			if(""==consultedName){
				alert("����ѯ����������Ϊ��");return false;
			}
			if(""==year || getLen(year)!= 4 || !(year.match(/^[0-9]+$/))){
				document.getElementById("year")="";
				document.getElementById("year").focus();
				alert("�յ�������ݱ���Ϊ�ǿ�4λ����");return false;
			}
			if(""==month || getLen(month) > 2 || !(month.match(/^[0-9]+$/))){
				document.getElementById("month").value="";
				document.getElementById("month").focus();
				alert("�յ������·ݱ���Ϊ�ǿղ�����2λ������");return false;
			}
			if(""==day || getLen(day) > 2 || !(day.match(/^[0-9]+$/))){
				document.getElementById("day").value="";
				document.getElementById("day").focus();
				alert("�յ������ձ���Ϊ�ǿղ�����2λ������");return false;
			}
			if(""==applicant){
				alert("�����˲���Ϊ��");return false;
			}
			if(""==cause){
				alert("ԭ����Ϊ��");return false;
			}
			if(""==address ){
				alert("��ַ����Ϊ�գ�");return false;
			}
			if(""==postalcode || getLen(postalcode)!= 6 || !(postalcode.match(/^[0-9]+$/))){
				alert("�����������Ϊ�ǿ�6λ���֣�");return false;
			}
			if(""==year1 || getLen(year1)!= 4 || !(year1.match(/^[0-9]+$/))){
				document.getElementById("year1")="";
				document.getElementById("year1").focus();
				alert("���������ݱ���Ϊ�ǿ�4λ����");return false;
			}
			if(""==month1 || getLen(month1) > 2 || !(month1.match(/^[0-9]+$/))){
				document.getElementById("month1").value="";
				document.getElementById("month1").focus();
				alert("��������·ݱ���Ϊ�ǿղ�����2λ������");return false;
			}
			if(""==day1 || getLen(day1) > 2 || !(day1.match(/^[0-9]+$/))){
				document.getElementById("day1").value="";
				document.getElementById("day1").focus();
				alert("��������ձ���Ϊ�ǿղ�����2λ������");return false;
			}
			
			//�ύ
			document.all.method.value='saveOpinion';
				//document.all.id.value=1;
			document.forms[0].submit();   
		}
		
		//����ҳ�水ť����ʾ
		function hidBtn(){	
			btnDiv.style.display="none";   
		}
	
	</script>	
  </head>
  
  <body>
   <html:form action="/opinionConsult.do">
   	<table width="590" align="center" border="0" cellpadding="0" cellspacing="0"
				bordercolor="97cdda" class="tableborder">
		<tr>
			<td height="28"   align="center" valign="middle" >
				<strong>�����������ѯ��</strong>
			</td>
		</tr>
		<tr>
			<td height="28" align="right" valign="middle" style="letter-spacing:0.3em;">
			<html:text property="attr1" styleClass="lineInput" style="width:150px;"></html:text>��
			<html:text property="attr2" styleClass="lineInput" style="width:50px;"></html:text>����<html:text property="numb" styleClass="lineInput" style="width:50px;"></html:text>��-������
			</td>
		</tr>
		<tr>
			<td height="28" valign="middle" >
			<html:text property="consultedName" styleClass="lineInput" style="width:200px;"></html:text>
			</td>
		</tr>
		<tr>
			<td height="28" valign="middle" style="text-indent: 32pt;letter-spacing:0.3em;">
			��������
			<html:text property="year" styleClass="lineInput" style="width:60px;" ></html:text>��  
			<html:text property="month" styleClass="lineInput" style="width:30px;"></html:text>��  
			<html:text property="day" styleClass="lineInput" style="width:30px;"></html:text>���յ�<html:text property="applicant" styleClass="lineInput" style="width:200px;"></html:text> 
			</td>
		</tr>
		<tr >
			<td height="28"  valign="middle"  style="letter-spacing:0.3em;">
			���ݡ��Ϻ���������Ϣ�����涨�������������Ϣ�������루��
			</td>
		</tr>
		<tr>
			<td height="28" valign="middle" style="letter-spacing:0.3em;">
			��μ���������Ϣ���������顷���������������������Ϣ
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="text-indent: 32pt;letter-spacing:0.3em;">
			<html:radio property="cause" value="0"></html:radio>��������λ��ҵ���ܻ��߹������ܵ�������λ��ҵ���ܱ�
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="letter-spacing:0.3em;">
			й¶
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="text-indent: 32pt;letter-spacing:0.3em;">
			<html:radio property="cause" value="1"></html:radio>�������ĸ�����˽���߹������ܵ������ĸ�����˽Ȩ����
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="letter-spacing:0.3em;">
			�����ֺ�
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="text-indent: 32pt;letter-spacing:0.3em;">
			���ݡ��Ϻ���������Ϣ�����涨����ʮ�����涨����������
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="letter-spacing:0.3em;">
			��λ����ѯ�Ƿ�ͬ���ṩ��������Ϣ���������������ʼ�����
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="letter-spacing:0.3em;">
			<html:text property="address" styleClass="lineInput" style="width:300px;"></html:text>
			���������룺<html:text property="postalcode" styleClass="lineInput" style="width:100px;"></html:text>��
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="text-indent: 32pt;letter-spacing:0.3em;">
			���������λ�����յ�����ѯ��֮��10����������δ����
			</td>
		</tr>
		<tr>
			<td height="28" valign="middle" style="letter-spacing:0.3em;" >
			�𸴣�����Ϊ������λ����ͬ���ṩ������Ϣ��
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" align="right" style="letter-spacing:0.3em;">
			�����ظ��£�
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" align="right" style="letter-spacing:0.3em;">
			 <html:text property="year1" styleClass="lineInput" style="width:60px;"></html:text>��  
			<html:text property="month1" styleClass="lineInput" style="width:30px;"></html:text>��  
			<html:text property="day1" styleClass="lineInput" style="width:30px;"></html:text>��
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="letter-spacing:0.3em;">
			������
			</td>
		</tr>
		<tr>
			<td height="28"   valign="middle" style="letter-spacing:0.3em;">
			1��������Ϣ�������������������ժҪ
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" style="letter-spacing:0.3em;">
			2�������������ѯ��ִ
			</td>
		</tr>
		
		<tr>
			<td height="28"  valign="middle" align="center">
			<div id="btnDiv">
			<input type="button" value="ȷ ��" onclick="subForm();"/>
			<input type="button" value="�� ��" onclick="window.location='tbGovInfoPubMain.do?method=view&id=<%=request.getParameter("id")%>'"/>
			<input type="button" value="�� ӡ" onclick="hidBtn();"/>
			</div>
			<input type="hidden" name="method" id="method"/>
			<input type="hidden" name="action1" id="action1"/>
			<input type="hidden" name="id" id="id"/>
			<html:hidden property="action"/>
			<html:hidden property="govInfoId"/>
			<html:hidden property="id"/>
			</td>
		</tr>	
	</table>
   </html:form>
  </body>
</html>
