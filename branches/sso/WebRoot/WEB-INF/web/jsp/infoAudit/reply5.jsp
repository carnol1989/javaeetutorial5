<%@ page language="java"  pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/govinfoform.css" rel="stylesheet" type="text/css">
    <script src="../../../../javascript/validate.js"></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript">
		//�ύҳ��
		function subForm(){
			//��֤
			var department = document.getElementById("department").value;
			var	contactAddr = document.getElementById("contactAddr").value;
			
			var signYear = document.getElementById("signYear").value;
			var signMonth = document.getElementById("signMonth").value;
			var signDay = document.getElementById("signDay").value;
			
			if(""==department){
				alert("δ��д����");
				return false;
			}
			if(""==contactAddr){
				alert("δ��д����");
				return false;
			}
		
			if(""==signYear || getLen(signYear)!= 4 || !(signYear.match(/^[0-9]+$/))){
				document.getElementById("signYear").value="";
				document.getElementById("signYear").focus();
				alert("���������ݱ���Ϊ�ǿ�4λ����");return false;
			}
			if(""==signMonth || getLen(signMonth) > 2 || !(signMonth.match(/^[0-9]+$/))){
				document.getElementById("signMonth").value="";
				document.getElementById("signMonth").focus();
				alert("��������·ݱ���Ϊ�ǿղ�����2λ������");return false;
			}
			if(""==signDay || getLen(signDay) > 2 || !(signDay.match(/^[0-9]+$/))){
				document.getElementById("signDay").value="";
				document.getElementById("signDay").focus();
				alert("��������ձ���Ϊ�ǿղ�����2λ������");
				return false;
			}
			
			//�ύ
			document.all.method.value='saveReply5';
			
				//�����ʼ�������
				if(<%=passWay %>=='17'){
					document.getElementById("hidBtn").style.display="none";//�ύǰ��ť���أ����㷢���ʼ�������
					var inputs = document.getElementsByTagName("input");
					var spans = document.getElementsByTagName("span");
					for (i=0;i<12;i++){
						inputs[i].style.display="none"
						spans[i+1].innerText= inputs[i].value;
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
		}
		function print(){
			var flag=false;//flag ��ʾ���Ƿ���ȷ�ύ
			if(<%= request.getAttribute("unEdit")%>!='1'){
				if(subForm()){
					flag=true;
				}
			}
			if(flag || <%= request.getAttribute("unEdit")%>=='1'){
				var id = document.getElementById("id").value;
				var url = "<%=basePath%>reply5.do?method=reply5List";
				var isOrNotPrint = "print";
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				//window.location="<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>
  </head>
  
  <body onload="isOrNotEdit();">
  <html:form action="/reply5.do">
  <div align="center" id="allBody">
   	<table width="570" border="0" align="center">
		<tr>
			<td align="center" width="100%" ><span class="titleTop" style="font-size:18.0pt;font-family:SimSun;">������Ϣ����������飨�壩</span>
			</td>
		</tr>
		<tr class="trHeight">
			<td align="right" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			 ��ˮ�񲿴�<html:text property="year" styleClass="lineInput1" readonly="true"></html:text><span ></span>����<html:text property="applyNo" styleClass="UNDERLINE35" style="width:60px;" readonly="true"></html:text><span ></span>��  
			</td>
		</tr>
		<tr class="trHeight">
			<td class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<html:text property="applicant" styleClass="UNDERLINE150" style="width:200px;" readonly="true"></html:text><span ></span>:
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�����أ���������<html:text property="applyYear" styleClass="lineInput" style="width:60px;"  readonly="true"></html:text><span ></span>��  
			<html:text property="applyMonth" styleClass="lineInput" style="width:30px;"  readonly="true"></html:text><span ></span>��  
			<html:text property="applyDay" styleClass="lineInput" style="width:30px;"  readonly="true"></html:text><span ></span>���յ���������λ��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			Ҫ���ȡ<html:text property="applyTitle" styleClass="lineInput" style="width:434px;"  readonly="true"></html:text> <span ></span>����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�롣
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 32pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�����ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��壩��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�Ĺ涨�������£�
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 32pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			������λ��Ҫ���ȡ��������Ϣ�����ڱ����أ�����������
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			ְ��Ȩ�޷�Χ��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 32pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			����������λ����<html:text property="department" styleClass="lineInput" style="width:355px;" ></html:text><span ></span>
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			��ѯ����ϵ��ʽΪ<html:text property="contactAddr" styleClass="lineInput" style="width:200px;" ></html:text><span ></span>��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 32pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			��Ա��𸴲������������յ�����֮����60�������Ϻ�
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			���������������л����񹲺͹�ˮ���������������飬������3
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			������������Ժ�����������ϡ�
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 32pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�ش˸�֪��
			</td>
		</tr>
		
		<tr class="trHeight">
			<td width="100%" class="content">
			&nbsp;
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" align="right" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<html:text property="signYear" styleClass="lineInput1" size="4" ></html:text><span ></span>��  
			<html:text property="signMonth" styleClass="lineInput1" size="2"></html:text><span ></span>��  
			<html:text property="signDay" styleClass="lineInput1" size="2"></html:text><span ></span>��
			</td>
		</tr>
		<tr>
			<td height="22"  valign="middle" class="BeiZhu" style="text-indent: 20pt;">
			<strong>ʹ��ָ�ϣ�</strong>
			</td>
		</tr>
		<tr>
			<td height="22"   valign="middle" class="BeiZhuCon" style="text-indent: 20pt;">
			���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��壩����ڡ���
			</td>
		</tr>
		<tr>
			<td height="22"   valign="middle" class="BeiZhuCon" >
			���ڱ����ع���ְ��Ȩ�޷�Χ�����εĴ𸴡�
			</td>
		</tr>
		
		<tr>
			<td height="28"  valign="middle" align="center" id="hidBtn">
			<input type="hidden" name="method" id="method"/>
			<input type="hidden" name="unEdit" id="unEdit"/>
			
			<input type="hidden" id="id" name="id"  value="${id }"/>
			<input type="hidden" id="rem" name="rem"  value="${rem }"/>
			  <input type="hidden" name="content" id="content">
   			<input type="hidden" name="passWay" value=<%=passWay%>>
   			<input type="hidden" name="email" value=<%=email%>>
			<input id="btnDiv"  type="button" value="ȷ ��" onclick="subForm();"/><input type="button" value="�� ӡ" onclick="print();"/><input type="button" value="�� ��" onclick="window.location='<%=url %>'"/>
				
			
			</td>
		</tr>	
	</table>
	</div>
   </html:form>
  </body>
</html>