<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbCommonalityComm" />
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/index-css.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=path%>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<script src="<%=path%>/javascript/validate.js"></script>
		<script type="text/javascript" src="<%=path%>/javascript/calendar.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-setup.js"></script>
		<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		
		<script type='text/javascript' src='<%=strpath%>/dwr/interface/commonalityComm.js'></script>

	</head>

	<%
		TbCommonalityComm parentObj = (TbCommonalityComm)request.getAttribute("parentObj");
	%>

	<body>
		<html:form action="/commonalityCommAction.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="5%" align="center" valign="middle">&nbsp;</td>
              <td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
              <td width="84%" class="table2_topic">����ͨѶ��</td>
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
                  <th width="94%" height="30" align="right" valign="bottom"><img src="<%=path%>/images/fh.gif" width="46" height="25" border="0"  onclick="returnlist();" onmouseover="this.style.cursor='hand'"/></th>
                  <th width="6%" valign="bottom"></th>
                </tr>
			
			<tr>
                  <td colspan="2" align="center" valign="top"><table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
					<tr>
						<td align="center" nowrap height="25" width="100" class="bg-zwbt">
							�ϼ���
						</td>
						<td colspan="2">
							<html:hidden property="parentId" value="<%=parentObj.getId() %>"/>
							<input type="hidden" name="typeT" value="<%=parentObj.getAttr1() %>"/>
							<%=parentObj.getName() %>
						</td>

					</tr>
					<tr>
						<td align="center" nowrap height="25"width="100" class="bg-zwbt">
							������
						</td>
						<td colspan="2">
							<html:text property="name" maxlength="200" styleClass="shuruk4" onblur="chk('name','fname',200),commonalityCommCheck();"></html:text><font color="red">*</font>
							<font color="red"><span id="fname"></span><span id="cname"></span></font>
						</td>

					</tr>
					<tr>
						<td align="center" nowrap height="25"width="100" class="bg-zwbt">
							�Ƿ�����
						</td>
						<td>
							<html:radio property="inuse" value="1" >��</html:radio>
							<html:radio property="inuse" value="0" >��</html:radio>
						</td>
					</tr>

					<tr>
						<td align="center" nowrap width="100" class="bg-zwbt">
							��ע
						</td>
						<td colspan="2">
							<html:textarea property="remark" styleClass="shuruk5" cols="60" rows="5" onblur="chk('remark','fremark',200)"></html:textarea>
							<font color="red">*</font><font color="red"> <span id="fremark"></span> </font>
						</td>

					</tr>

				
					<tr>
						<td colspan="3" align="center">
							<a onclick="checkForm();" onmouseover="this.style.cursor='hand'"><img
									src="<%=path%>/imagine/tj.gif" width="52" height="23">
							</a>&nbsp;&nbsp;
						</td>
					</tr>
			</table></td>
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

			<input type="hidden" name="action" />
			<input type="hidden" name="method" />

			<html:hidden property="id" />



		</html:form>
		<script language="javascript" type="text/javascript">
		<!--
			//�ǿպͳ�����֤
			function chk(id,fid,len)
			{
				if( document.getElementById(id).value == "")
				{
					document.getElementById(fid).innerHTML = "����Ϊ��";
					return false;	
				}
				else
				{
				    if(getLen(document.getElementById(id).value) > len)
				    {
						document.getElementById(fid).innerHTML = "���Ȳ��ܴ���"+len+"���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�";
						return false;
					}
					else
					{
						document.getElementById(fid).innerHTML = "";
					}									
				}
			}
			
			//�ύ��ʱ��֤
			function checkForm()
			{
				var name = document.getElementById("name").value;
		    	var remark = document.getElementById("remark").value;
				if( name == ''||remark == '')
				{
					alert("�������벻����");
					return false;
				}
				if( getLen(name) > 200||getLen(remark) > 200)
				{
					alert("�����������");
					return false;
				}
				if(this.commonalityCommNameFlag=="false")
				{
					alert("���������ظ�"); 
					return false;
				}
								
				if(document.all.id.value=='')
				{
					document.all.method.value='add';
				}
				else
				{
					document.all.method.value='modify';
				}
				document.all.action.value='submit';
				document.forms[0].submit();
				return true;
			}	
			
			//�����б�ҳ��		
			function returnlist()
			{		
				window.location.replace("<%=path%>/commonalityCommAction.do?method=list&parentid=<%=parentObj.getId()%>");
			}
		//-->			
		</script>
	</body>
</html>
