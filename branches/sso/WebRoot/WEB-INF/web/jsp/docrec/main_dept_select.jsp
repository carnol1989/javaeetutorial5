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
    
    <title>���첿��ѡ��Ťת</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="description" content="This is my page">
	<link href="images/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function selectuser(flag,argDeptOrUser,tid,tname){
	window.showModalDialog("<%=path%>/userTree.do?method=input&idText="+tid+"&nameText="+tname+"&rootId=${treeRootId==null?"":treeRootId}&flag="+flag,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
	
}
function checkForm(form){
	var radios = form.deptRadio;
	if(!radios[0].checked && !radios[1].checked && !radios[2].checked){
		alert("��ѡ�������");
		return false;
	}
	if(radios[2].checked && form.userId4.value==""){
		alert("��ѡ��������Ա��");
		return false;
	}
	return true;
}

function submitForm(methodType){
	var form = docRecBookForm;
	if(methodType=="back" || checkForm(form)){
		form.method.value=methodType;
		form.submit();
	}
}
</script>
  </head>

  <body>
    		<html:form action="/docRecMainDept" enctype="multipart/form-data" method="post">
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
              <td width="84%" class="table2_topic">�Ϻ���ˮ����Ϣ���Ĺ��Ĵ������쵼����</td>
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
                  <th width="94%" height="30" align="right" valign="bottom"><img src="images/fh.gif" width="46" height="25" border="0" onclick="submitForm('back')" onmouseover="this.style.cursor='hand'"/></th>
                  <th width="6%" valign="bottom"></th>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="top">
			<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
			<logic:equal name="hasSecendDept" value="true">
			<tr>
			<td><input type="radio" name="deptRadio" value="1"></td>
			<td colspan="2">Э��</td>
			</tr>
			</logic:equal>
			<logic:equal name="hasSecendDept" value="false">
			<tr>
			<td><input type="radio" name="deptRadio" value="2"></td>
			<td colspan="2">���������쵼</td>
			</tr>
			</logic:equal>
			<tr>
			<td><input type="radio" name="deptRadio" value="3"></td>
			<td colspan="2">ת����</td>
			</tr>
			<tr>
			<td><input type="radio" name="deptRadio" value="4"></td>
			<td>������Ա����</td>
			<td>
				<input type="hidden" id="userId4" name="userId4" value="" />
			    <input type="text" id="userName4" name="userName4" value="" class="tab_input" readonly/>
			    <input type="button" value="������Ա" onclick="selectuser('presider','user','userId4','userName4')" class="button0">
			</td>
			</tr>
			</table>
			<table width="99%" border="0" cellpadding="0" cellspacing="0">
				<thead>
				<tr>
                  <td height="10"></td>
                </tr>
					<tr>
						<td align="center">
						<input type="button" value="���" onclick="submitForm('addControl')" class="button0" />
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
          </table></td>
        </tr>
      </table>
</td>
  </tr>
</table>
		<input type="hidden" name="controlId" value="${controlId}">
		<input type="hidden" name="method" />
		</html:form>
  </body>
</html>
