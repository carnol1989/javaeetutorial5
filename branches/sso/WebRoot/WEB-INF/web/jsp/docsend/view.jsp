<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>���ĸ�ֽ���鿴��</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="description" content="���ĸ�ֽ���鿴��">
		<link href="images/style.css" rel="stylesheet" type="text/css">

		<script src="<%=path %>/javascript/validate.js"></script>

<script type="text/javascript">
<!--
function init(){
//ֻ��
	document.getElementById("divBtnAdd").style.display="none";
	document.getElementById("fileDate").onfocus="";
	inputs = document.getElementsByTagName("input");
	for(i=0;i<inputs.length;i++){
		if(inputs[i].type=="button" && inputs[i].value=="ɾ��"){
			inputs[i].style.display="none";
		}
	}
	checkFileType();
	alertError();
}
//-->
</script>
<script type="text/javascript">
function chk(){
}
function checkForm(form){
	var rs = true;

	var objInput=document.forms[0].getElementsByTagName("input"); 
	for (i=0;i<objInput.length;i++){ 
		if (objInput[i].type=="file"){
			var len=objInput[i].value.length;
			var filename=objInput[i].value.substr(len-4,len).toLowerCase();
			if(filename=='.exe'){
				alert("�����ϴ���ִ���ļ�");
				return false;
			}
		} 
	}
	return rs;
}
function submitForm(methodType){
	var form = docSendForm;
	if(checkForm(form)){
		form.method.value=methodType;
		form.submit();
	}
}
function turnback(){
	window.location.href="<%=path%>/docSendRelatedAction.do?method=docSendList&type=0";
}
</script>
<script language="javascript">
function changeDiv(showDiv,hideDiv){
	var showObj = document.getElementById(showDiv);
	var hideObj = document.getElementById(hideDiv);
	showObj.style.display="block";
	hideObj.style.display="none";
}
</script>
	</head>

	<body onload="init()">
		<html:form action="/docSendSign" enctype="multipart/form-data" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#e3eaf1">
  <tr>
    <td width="2" background="images/yy.gif"></td>
    <td align="center" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="5%" align="center" valign="middle">&nbsp;</td>
              <td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
              <td width="84%" class="table2_topic">���ĸ�ֽ���鿴��</td>
            </tr>
          </table></td>
          <td background="images/8-2.gif">&nbsp;</td>
        </tr>
      </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top"><table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
                <tr>
                  <th width="94%" height="30" align="right" valign="bottom"><img src="images/fh.gif" width="46" height="25" border="0" onclick="turnback()"  onmouseover="this.style.cursor='hand'"/></th>
                  <th width="6%" valign="bottom"></th>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="top">
<a href="#" class="bg-zw" onclick="changeDiv('dispose','checkChange');return false;">���Ĵ���</a> <span class="bg-zw">|</span>
<a href="#" class="bg-zw" onclick="changeDiv('checkChange','dispose');return false;">�����ת��</a>
		<div id="dispose">
			<jsp:include page="base_info.jsp"/>
		</div>
		<div id="checkChange" style="display:none">
		<jsp:include page="lcljd.jsp"/>
		</div>
                  </td>
                </tr>
                <tr>
                  <td height="20" colspan="2"></td>
                </tr>
                
              </table></td>
            </tr>
            <tr>
              <td height="10"></td>
            </tr>
          </table></td>
        </tr>
      </table>
</td>
  </tr>
</table>
		<input type="hidden" name="method" />

		</html:form>
	</body>
</html>