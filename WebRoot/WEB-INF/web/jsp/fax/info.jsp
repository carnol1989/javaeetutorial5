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
		<title>���淢��</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="description" content="���淢��">
		<link href="images/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function submitForm(){
	document.getElementById("method").value="add";
	if(faxScheduleForm.fileUpload.value==""){
		alert("ѡ���ϴ��ļ���");
		return;
	}
	if(faxScheduleForm.faxNum.value==""){
		alert("���봫�����!");
		return;
	}
	faxScheduleForm.submit();
}
function clearForm(){
	faxScheduleForm.reset();
}
function addbookList(flag,tid,tname,tmb){
	//window.showModalDialog("<%=path%>/commonalityTree.do?method=input&idText="+tid+"&nameText="+tname+"&mobileText="+tmb+"&type=fax&flag="+flag,window,'dialogwidth:450px;dialogheight:500px;help:0;center:yes;resizable:0;status:0;scroll:yes');
	oo = window.open("<%=path%>/commonalityTree.do?method=input&idText="+tid+"&nameText="+tname+"&mobileText="+tmb+"&type=fax&flag="+flag,"",'width=450px;height=500px;top=100, left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
	window.setTimeout(function(){replaceTmb(tmb);},1000);
}
function replaceTmb(tmb){
	if(oo.closed){
		var obj = document.getElementById(tmb);
		obj.value = obj.value.replace(/\,/g,";");
		return;
	}
	window.setTimeout(function(){replaceTmb(tmb);},1000);
}
var num = 1;
function additem(id){
	var row,cell,str; 
	row = eval("document.all["+'"'+id+'"'+"]").insertRow();
	if(row != null ){
		cell = row.insertCell();
		str="<input type="+'"'+"file"+'"'+" name=uploadFile["+ num +"].file onkeydown="+'"'+"event.returnValue=false;"+'"'+" onpaste="+'"'+" return false"+'"'+"><input type="+'"'+"button"+'"'+" value="+'"'+"ɾ��"+'"'+" onclick='deleteitem(this,"+'"'+id+'"'+");' class='button0'>";
		cell.innerHTML=str;
	}
	num++;
}
function deleteitem(obj,id){
	var rowNum,curRow;
	curRow = obj.parentNode.parentNode;
	rowNum = eval("document.all."+id).rows.length - 1;
	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
}
</script>

	</head>

	<body>
		<html:form action="/faxSchedule" enctype="multipart/form-data" method="post">
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
              <td width="84%" class="table2_topic">���淢��</td>
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
                  <td colspan="2" align="center" valign="top">
			<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
				<thead>
					<tr>
						<th height="23" width="10%">�ļ��ϴ�</th>
						<td><input type="file" name="fileUpload" onkeydown="event.returnValue=false;"></td>
					</tr>
					<tr>
						<th height="23">����</th>
						<td><table id="tb" cellpadding="0" cellspacing="0"></table>
							<div id="divBtnAdd">
								<input type="button" name="btnAddFile" value="��Ӹ���" onclick="additem('tb')" class="button0"/>
								<font color="red">�ϴ������ļ����ܴ���10M!</font>
							</div>
						</td>
					</tr>
					<tr>
						<th height="23">��������</th>
						<td><textarea name="bodyContent" class="tabin_textarea2" cols="60" rows="5"></textarea></td>
					</tr>
					<tr>
						<th height="23">���Ͷ���</th>
						<td><textarea name="senderNames" class="tabin_textarea2" cols="60" rows="5" readonly></textarea><br>
							<input type="button" class="button0" value="����ͨѶ¼" onclick="addbookList('','senderIds','senderNames','faxNum')"/>
							<input type="button" class="button0" value="�������" onclick="clearSenders()"/>
							<input type="hidden" name="senderIds"/>
						</td>
					</tr>
					<tr>
						<th height="23">�������</th>
						<td><input type="text" name="faxNum" class="tab_input" /></td>
					</tr>
					<tr>
						<th height="23">&nbsp;</th>
						<td>(�粻ͨ��ͨѶ¼ѡ�˿�ֱ����д������룬�������֮���Էֺ�(;)�ָ������ܷ�����ش��棬�������ڴ������ǰ��"0"���ֻ�������"-"����.���磺����"052397000-6639;6654"���൱�������⴫�棬лл!)</td>
					</tr>
					<tr>
						<th height="23">&nbsp;</th>
						<td><input type="checkbox" name="sendContext" value="1"/>���ʹ�������&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="sendSM" value="1"/>����֪ͨ</td>
					</tr>
					<tr>
						<td colspan="10" height="23" align="center">
						<input type="button" class="button0" value="�ύ" onclick="submitForm()">
						<input type="button" class="button0" value="ȡ��" onclick="clearForm()">
						</td>
					</tr>
				</thead>
			</table>
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
