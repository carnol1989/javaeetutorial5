<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id = request.getParameter("id");
String disply=request.getParameter("disply");
String status=request.getParameter("status");
String passWay = request.getParameter("passWay");
String email=request.getParameter("email");
String docNum=request.getParameter("docNum");
String url=path+"/obligeeOpinion.do?method=obligeeOpinionList&id="+id+"&disply="+disply+"&status="+status+"&docNum="+docNum+"&passWay="+passWay+"&email="+email;
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
	
  </head>
  
  <body onload="isOrNotEdit();">
  <div align="center" id="allBody">
  <html:form action="/reply7.do">
   	<div align="center">
   	<table width="570" border="0">
		<tr class="trHeight">
			<td align="center" width="100%" ><span class="titleTop">������Ϣ����������飨�ߣ�</span>
			</td>
		</tr>
		<tr class="trHeight">
			<td align="right" class="content" width="100%">
			 ��ˮ�񲿴�<html:text property="year" styleClass="lineInput1"  readonly="true"></html:text><span ></span>����<html:text property="applyNo" styleClass="UNDERLINE35" style="width:60px;" readonly="true"></html:text><span ></span>��  
			</td>
		</tr>
		<tr class="trHeight">
			<td class="content" width="100%">
			<html:text property="applicant" styleClass="UNDERLINE150" style="width:200px;" readonly="true"></html:text><span ></span>:
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			�����أ���������<html:text property="applyYear" styleClass="UNDERLINE35" style="width:60px;" readonly="true"></html:text><span ></span>��  
			<html:text property="applyMonth" styleClass="UNDERLINE35" style="width:30px;" readonly="true"></html:text><span ></span>��  
			<html:text property="applyDay" styleClass="UNDERLINE35" style="width:30px;" readonly="true"></html:text><span ></span>���յ���������λ��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			Ҫ���ȡ<html:text property="applyTitle" styleClass="UNDERLINE320" style="width:434px;" readonly="true"></html:text><span ></span> ����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			�롣
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			����飬������λ��Ҫ���ȡ��������Ϣ�漰 <input type="checkbox" name="attr31" id="attr31" value="1" onclick="selAttr3(1);"/><span></span>&nbsp;�������� 
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			<input type="checkbox" name="attr32" id="attr32" value="2" onclick="selAttr3(2);"/><span></span>&nbsp;������˽ 
			</td>
		</tr>
		
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			���ݡ��л����񹲺͹�������Ϣ�����������ڶ�ʮ������
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			���Ϻ���������Ϣ�����涨����ʮ�����ڶ���Ĺ涨���ִ���
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			�£�
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			<input type="checkbox" name="replyType1" id="replyType1" value="1" onclick="selReplyType(1);"/><span></span>&nbsp;������Ȩ�����������ͬ�⹫���������أ����������
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			���Թ�����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			<input type="checkbox" name="replyType2" id="replyType2" value="2" onclick="selReplyType(2);"/><span></span>&nbsp;Ȩ���˲�ͬ�⹫���������أ���������˲��蹫����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			<input type="checkbox" name="replyType3" id="replyType3" value="3" onclick="selReplyType(3);"/><span></span>&nbsp;Ȩ����δ�ڹ涨�����������𸴣������أ����������
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			���蹫����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			<input type="checkbox" name="replyType4" id="replyType4" value="4" onclick="selReplyType(4);"/><span></span>&nbsp;�����أ���������Ϊ���������ܶԹ�����������ش�Ӱ
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			�죬�������Թ�����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			<input type="checkbox" disabled>���ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����Ĺ涨����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			�ؽ�ͨ��<input type="checkbox" name="offerWay1" id="offerWay1" value="1" onclick="selOfferWay(1);"/><span></span>�����ṩ  
			<input type="checkbox" name="offerWay2" id="offerWay2" value="2" onclick="selOfferWay(2);"/><span></span>�����ʼ�
			<input type="checkbox" name="offerWay3" id="offerWay3" value="3" onclick="selOfferWay(3);"/><span></span>�ʼ� ��ʽ�����ṩ��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			��Ա��𸴲������������յ�����֮����60�������Ϻ���
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			�������������л����񹲺͹�ˮ���������������飬������3��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			����������Ժ�����������ϡ�
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;">
			�ش˸�֪��
			</td>
		</tr>
		
		<tr class="trHeight">
			<td width="100%" class="content">
			&nbsp;
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  align="right">
			 <html:text property="signYear" styleClass="lineInput1" style="width:60px;" ></html:text>��  
			<html:text property="signMonth" styleClass="lineInput1" style="width:30px;"></html:text>��  
			<html:text property="signDay" styleClass="lineInput1" style="width:30px;"></html:text>��
			</td>
		</tr>
		<tr>
			<td height="22"  valign="middle" class="BeiZhu" style="text-indent: 20pt;">
			<strong>ʹ��ָ�ϣ�</strong>
			</td>
		</tr>
		<tr>
			<td height="22"   valign="middle" class="BeiZhuCon" style="text-indent: 20pt;">
			���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ���������ڡ���
			</td>
		</tr>
		<tr>
			<td height="22"   valign="middle" class="BeiZhuCon" >
			�в�Ӧ�����������ݣ����ܹ����ִ���Ӧ�����ָ�֪�����ˣ��Բ��蹫���ģ�
			</td>
		</tr>
		<tr>
			<td height="22"   valign="middle" class="BeiZhuCon" >
			Ӧ��˵�����ɵġ����εĴ𸴡�
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" align="center" id="hidBtn">
			<input type="hidden" name="method" id="method"/>
			<input type="hidden" name="unEdit" id="unEdit"/>
			<input type="hidden" id="id" name="id"  value="${id }"/>
			<input type="hidden" name="content" id="content">
			  <input type="hidden" name="passWay" value=<%=passWay%>>
			  <input type="hidden" name="email" value=<%=email%>>
			  <input type="hidden" name="docNum" value=<%=docNum%>>
			<html:hidden property="offerWay"/>
			<html:hidden property="attr3"/>
			<html:hidden property="replyType"/>
			<input id="btnDiv" type="button" value="ȷ ��" onclick="subForm();"/><input type="button" value="�� ӡ" onclick="print();"/><input type="button" value="�� ��" onclick="window.location='<%=url %>'"/>
			</td>
		</tr>	
	</table>
   </html:form>
   </div>
  </body>
</html>
<script type="text/javascript">
		//�ύҳ��
		function subForm(){
			//��֤
			var replyType = document.getElementById("replyType").value;
			var	offerWay = document.getElementById("offerWay").value;
			var	attr3 = document.getElementById("attr3").value;
			
			var signYear = document.getElementById("signYear").value;
			var signMonth = document.getElementById("signMonth").value;
			var signDay = document.getElementById("signDay").value;
			if(attr3 != 1 && attr3 != 2){
				alert("δ��д����");
				return false;
			}
			if(replyType!=1 && replyType!=2 && replyType!=3 && replyType!=4){
			 	alert("δ��д����");
				return false;
			}
			
			if(offerWay!=1 && offerWay!=2 && offerWay!=3){
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
			//�ύ
			document.all.method.value='saveReply7';
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
			//���ø�ѡ��ѡ������
			var offerWay = document.getElementById("offerWay").value;
			var attr3 = document.getElementById("attr3").value;
			var replyType = document.getElementById("replyType").value;
			if(attr3!=""){
				selAttr3(attr3);
			}else{
				selAttr3(0);
			}
			if(replyType!=""){
				selReplyType(replyType);
			}else{
				selReplyType(0);
			}
			if(offerWay!=""){
				selOfferWay(offerWay);
			}else{
				selOfferWay(0);
			}
		}
		
		//����checkbox��ѡ��
		function selOfferWay(str){
			// ������Ϣ�ĵ��ṩ��ʽ
			var offerWay=str;
			if(str == 1){	
				document.getElementById("offerWay1").checked=true;
				document.getElementById("offerWay2").checked=false;
				document.getElementById("offerWay3").checked=false;
				document.getElementById("offerWay").value = document.getElementById("offerWay1").value;
			}
			if(str == 2){	
				document.getElementById("offerWay1").checked=false;
				document.getElementById("offerWay2").checked=true;
				document.getElementById("offerWay3").checked=false;
				document.getElementById("offerWay").value = document.getElementById("offerWay2").value;
			}
			if(str == 3){	
				document.getElementById("offerWay1").checked=false;
				document.getElementById("offerWay2").checked=false;
				document.getElementById("offerWay3").checked=true;
				document.getElementById("offerWay").value = document.getElementById("offerWay3").value;
			}
		}
		
		function selAttr3(str){
			var attr3=str;
			if(str == 1){	
				document.getElementById("attr31").checked=true;
				document.getElementById("attr32").checked=false;
				document.getElementById("attr3").value = document.getElementById("attr31").value;
			}
			if(str == 2){	
				document.getElementById("attr31").checked=false;
				document.getElementById("attr32").checked=true;
				document.getElementById("attr3").value = document.getElementById("attr32").value;
			}
		}
		
		function selReplyType(str){
			var replyType=str;
			if(str == 1){	
				document.getElementById("replyType1").checked = true;
				document.getElementById("replyType2").checked = false;
				document.getElementById("replyType3").checked = false;
				document.getElementById("replyType4").checked = false;
				document.getElementById("replyType").value = document.getElementById("replyType1").value;
			}
			if(str == 2){	
				document.getElementById("replyType1").checked=false;
				document.getElementById("replyType2").checked=true;
				document.getElementById("replyType3").checked=false;
				document.getElementById("replyType4").checked=false;
				document.getElementById("replyType").value = document.getElementById("replyType2").value;
			}
			if(str == 3){	
				document.getElementById("replyType1").checked=false;
				document.getElementById("replyType2").checked=false;
				document.getElementById("replyType3").checked=true;
				document.getElementById("replyType4").checked=false;
				document.getElementById("replyType").value = document.getElementById("replyType3").value;
			}
			if(str == 4){	
				document.getElementById("replyType1").checked=false;
				document.getElementById("replyType2").checked=false;
				document.getElementById("replyType3").checked=false;
				document.getElementById("replyType4").checked=true;
				document.getElementById("replyType").value = document.getElementById("replyType4").value;
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
				var url = "<%=basePath%>reply7.do?method=reply7List";
				var isOrNotPrint = "print";
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>