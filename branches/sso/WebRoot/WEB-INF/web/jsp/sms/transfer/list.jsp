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
		<title>����ת�������պ���</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="description" content="����ת�������պ���">
		<link href="images/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function submitForm(){
	if(smsTransferListForm.senderIds.value==""){
		if(smsTransferListForm.receiveId.value==""){
			alert("��ѡ��ת������!");
			return false;
		}
		if(smsTransferListForm.senderName.value==""){
			alert("����������!");
			return false;
		}
		if(smsTransferListForm.senderMobile.value==""){
			alert("�������ֻ�����!");
			return false;
		}
	}
	document.getElementById("method").value="add";
	smsTransferListForm.submit();
}
function clearForm(){
	document.getElementById("id").value="";
	document.getElementById("senderName").value="";
	document.getElementById("senderDept").value="";
	document.getElementById("senderMobile").value="";
	document.getElementById("senderIds").value="";
	document.getElementById("senderNames").value="";
}
function modify(listId){
	document.getElementById("method").value="input";
	document.getElementById("id").value=listId;
	smsTransferListForm.submit();
}
function deleteInfo(listId){
	document.getElementById("method").value="delete";
	document.getElementById("id").value=listId;
	smsTransferListForm.submit();
}
function query(){
	document.getElementById("method").value="input";
	document.getElementById("id").value="";
	document.getElementById("pageNum").value="1";
	smsTransferListForm.submit();
}
function clearSenders(){
	document.getElementById("senderIds").value="";
	document.getElementById("senderNames").value="";
	document.getElementById("senderMobiles").value="";
}

function addbookList(flag,tid,tname,tmb){
	//window.showModalDialog("<%=path%>/commonalityTree.do?method=input&idText="+tid+"&nameText="+tname+"&mobileText="+tmb+"&flag="+flag,window,'dialogwidth:450px;dialogheight:500px;help:0;center:yes;resizable:0;status:0;scroll:yes');
	window.open("<%=path%>/commonalityTree.do?method=input&idText="+tid+"&nameText="+tname+"&mobileText="+tmb+"&flag="+flag,"",'width=450px;height=500px;top=100, left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
}
function perPage(){
	var obj = document.getElementById("pageNum");
	n=parseInt(obj.value);
	if(n==1){
		return;
	}else{
		obj.value=""+(n-1);
		document.getElementById("method").value="input";
		smsTransferListForm.submit();
	}
}
function nextPage(){
	var obj = document.getElementById("pageNum");
	n=parseInt(obj.value);
	if(n*10>=${fn:length(list)}){
		return;
	}else{
		obj.value=""+(n+1);
		document.getElementById("method").value="input";
		smsTransferListForm.submit();
	}
}
</script>

	</head>

	<body>
		<html:form action="/smsTransferList" method="post">
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
              <td width="84%" class="table2_topic">����ת�������պ���</td>
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
			<html:hidden property="id"/>
			<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
				<thead>
					<tr>
						<th height="23">ת������</th>
						<td><html:select property="receiveId">
						<html:options collection="receiveList" labelProperty="receiveName" property="id"/>
						</html:select></td>
						<th>����</th>
						<td><html:text property="senderName" styleClass="tab_input" style="width:100"/></td>
						<th>����</th>
						<td><html:text property="senderDept" styleClass="tab_input" style="width:100"/></td>
						<th>�ƶ��绰</th>
						<td><html:text property="senderMobile" styleClass="tab_input" style="width:100"/></td>
					</tr>
					<tr>
					<th>����������Ա</th>
					<td colspan="7">
					<input type="hidden" name="senderIds"/>
					<input type="hidden" name="senderMobiles"/>
					<textarea name="senderNames" class="tabin_textarea2" cols="60" rows="5" readonly></textarea><br>
					<input type="button" class="button0" value="����ͨѶ¼" onclick="addbookList('','senderIds','senderNames','senderMobiles')"/>
					<input type="button" class="button0" value="�������" onclick="clearSenders()"/>
					</td>
					</tr>
					<tr>
						<td colspan="8" height="23">
						<input type="button" class="button0" value="�ύ" onclick="submitForm()">
						<input type="button" class="button0" value="ȡ��" onclick="clearForm()">
						</td>
					</tr>
				</thead>
			</table>
<br><br>
			<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
				<thead>
				<tr>
				<td colspan="4" height="23">
			������<input type="text" name="queryName" value="${param.queryName}" class="tab_input" style="width:100">
			�绰��<input type="text" name="queryMobile" value="${param.queryMobile}" class="tab_input" style="width:100">
			ת����Ա��<html:select property="queryReceivers">
				<html:option value=""></html:option>
				<html:options collection="receiveList" labelProperty="receiveName" property="id"/>
				</html:select>
			<input type="button" class="button0" value="��ѯ" onclick="query()">
				</td>
				</tr>
					<tr>
						<th>����</th>
						<th>����</th>
						<th>�ƶ��绰</th>
						<th>����</th>
					</tr>
<logic:present name="list">
<logic:iterate id="item" indexId="i" name="list" type="com.baosight.sms.mode.SmsTransferList" length="10" offset="${10*(param.pageNum-1)}">
					<tr>
						<td>${item.senderName}</td>
						<td>${item.senderDept}</td>
						<td>${item.senderMobile}</td>
						<td align="center">
						<input type="button" class="button0" value="�޸�" onclick="modify('${item.id}')">
						<input type="button" class="button0" value="ɾ��" onclick="deleteInfo('${item.id}')">
						</td>
					</tr>
</logic:iterate>
</logic:present>
					<tr>
						<td colspan="4" align="right">
						<a href="#" onclick="perPage();return false;">��һҳ</a>
						<a href="#" onclick="nextPage();return false;">��һҳ</a>
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
		<input type="hidden" name="pageNum" value="${param.pageNum==null?"1":param.pageNum}">
		</html:form>
	</body>
</html>
