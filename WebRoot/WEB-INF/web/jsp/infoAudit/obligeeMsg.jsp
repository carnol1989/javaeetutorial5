<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id = request.getParameter("id");
String disply=request.getParameter("disply");
String status=request.getParameter("status");

String url=path+"/tbGovInfoPubMain.do?method=view&id="+id+"&disply="+disply+"&status="+status;

String passWay = request.getParameter("passWay");
String email=request.getParameter("email");
String flag=request.getParameter("flag");
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
  <html:form action="/obligeeMsg.do">
   <div align="center"  id="allBody">
   	 <table width="570" border="0" align="center">
		<tr class="trHeight">
			<td align="center" width="100%" ><span class="titleTop" style="font-size:18.0pt;font-family:SimSun;">����Ȩ������Ϣ��֪��</span>
			</td>
		</tr>
		<tr class="trHeight">
			<td align="right" class="content" width="100%" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			 ��ˮ��Ȩ�棨<html:text property="year" styleClass="lineInput1" style="width:40px;" readonly="true"></html:text><span></span>����<html:text property="autoNo" styleClass="UNDERLINE35" style="width:60px;" readonly="true"></html:text><span></span>��  
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<html:text property="obligeeName" styleClass="UNDERLINE150" style="width:200px;"></html:text><span></span>:
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�����أ���������������Ϣ���������У�����鷢�֣�����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<html:text property="contentMsg" styleClass="lineInput" style="width:350px;" ></html:text> <span></span>��������Ϣ��
			</td>
		</tr>
		<tr class="trHeight" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<input type="checkbox" name="involveMsg1" id="involveMsg1" value="1" onclick="selInvolveMsg(1);"/><span></span>&nbsp;�漰�����˵���Ϣ&nbsp;
			<input type="checkbox" name="involveMsg2" id="involveMsg2" value="2" onclick="selInvolveMsg(2);"/><span></span>&nbsp;�漰����λ����Ϣ
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			����飬�����أ���������Ϊ������Ϣ���������ܶԹ�����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			������ش�Ӱ�죬���ݡ��Ϻ���������Ϣ�����涨����ʮ������
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			����Ĺ涨���������Թ�����
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			��Ա��𸴲������������յ�����֮����60�������Ϻ���
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�������������л����񹲺͹�ˮ���������������飬������3��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			����������Ժ�����������ϡ�
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�ش˸�֪��
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content"  style="text-indent: 30pt;font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			�����������������˹�������Ϣ�ľ������
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content">
			&nbsp;
			</td>
		</tr>
		<tr class="trHeight">
			<td width="100%" class="content" align="right" style="font-size:15.0pt;mso-char-indent-count:2.0;mso-bidi-font-size:12.0pt;">
			<html:text property="signYear" styleClass="lineInput1" style="width:60px;" ></html:text><span></span>��  
			<html:text property="signMonth" styleClass="lineInput1" style="width:30px;"></html:text><span></span>��  
			<html:text property="signDay" styleClass="lineInput1" style="width:30px;"></html:text><span></span>��
			</td>
		</tr>
		<tr>
			<td height="22"  valign="middle" class="BeiZhu" style="text-indent: 20pt;">
			<strong>ʹ��ָ�ϣ�</strong>
			</td>
		</tr>
		<tr>
			<td height="22"   valign="middle" class="BeiZhuCon" style="text-indent: 20pt;">
			���ı������������������������漰��ҵ���ܡ�������˽��������Ϣ���Լ����ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��ߣ���Ĺ涨���򹫹�������Ҫ�����������漰��ҵ���ܡ�������˽��������Ϣ����֪Ȩ���˹��������ݺ����ɵ����Ρ�
			</td>
		</tr>
		<tr>
			<td height="28"  valign="middle" align="center" id="hidBtn">
			<input type="hidden" name="method" id="method"/>
			<input type="hidden" name="unEdit" id="unEdit"/>
			<input type="hidden" id="id" name="id"  value="${id }"/>
			<html:hidden property="involveMsg"/>
			<input type="hidden" name="content" id="content">
  			<input type="hidden" name="passWay" value=<%=passWay%>>
  			<input type="hidden" name="email" value=<%=email%>>
  			<input type="hidden" name="flag" value=<%=flag%>>
			<input id="btnDiv" type="button" value="ȷ ��" onclick="subForm();"/><input type="button" value="�� ӡ" onclick="print();"/><input type="button" value="�� ��" onclick="window.location='<%=url %>'"/>	
			</td>
		</tr>	
	</table>
	</div>
   </html:form>
  </body>
<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0
		id=wb name=wb width=0></OBJECT>
</html>
<script type="text/javascript">
		//�ύҳ��
		function subForm(){
			//��֤
			var obligeeName = document.getElementById("obligeeName").value;
			var	contentMsg = document.getElementById("contentMsg").value;
			var	involveMsg = document.getElementById("involveMsg").value;
			var signYear = document.getElementById("signYear").value;
			var signMonth = document.getElementById("signMonth").value;
			var signDay = document.getElementById("signDay").value;
			
			if(""==obligeeName){
				alert("δ��д����");
				return false;
			}
			if(""==contentMsg){
				alert("δ��д����");
				return false;
			}
			if(involveMsg != 1 && involveMsg != 2){
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
			document.all.method.value='saveObligeeMsg';
			
			//�����ʼ�������
				if(<%=flag %>=='1'){
					document.getElementById("hidBtn").style.display="none";//�ύǰ��ť���أ����㷢���ʼ�������
					var inputs = document.getElementsByTagName("input");
					var spans = document.getElementsByTagName("span");
					for (i=0;i<9;i++){
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
			var involveMsg = document.getElementById("involveMsg").value;
			if(involveMsg != ""){
				selInvolveMsg(involveMsg);
			}else{
				selInvolveMsg(0);
			}
		}
		function selInvolveMsg(str){
			if(str == 1){	
				document.getElementById("involveMsg1").checked=true;
				document.getElementById("involveMsg2").checked=false;
				document.getElementById("involveMsg").value = document.getElementById("involveMsg1").value;
			}
			if(str == 2){	
				document.getElementById("involveMsg1").checked=false;
				document.getElementById("involveMsg2").checked=true;
				document.getElementById("involveMsg").value = document.getElementById("involveMsg2").value;
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
				var url = "<%=basePath%>obligeeMsg.do?method=obligeeMsgList";
				var isOrNotPrint = "print";
				//window.location="<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
				window.open(wholeURL,'');
			}
		}
	</script>