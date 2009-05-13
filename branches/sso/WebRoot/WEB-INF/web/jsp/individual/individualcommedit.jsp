<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<jsp:directive.page import="com.baosight.mode.TbUser"/>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String groupname=(String)request.getAttribute("groupname");
	TbUser user = (TbUser)session.getAttribute("SYSTEM_USER_SESSION");
String userid = user.getId();
System.out.println(strpath);

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
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/index-css.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
		<script src="../../../../javascript/validate.js"></script>
		<script type='text/javascript' src='<%=strpath%>/dwr/interface/individualcomm.js'></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
	</head>
	
	<body>
		<html:form action="/individualcommaction.do">
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
			    		<td nowrap width="100" height="25"align="center" class="bg-zwbt">������</td>
			    		<td colspan="2"><html:text property="name" maxlength="32" styleClass="shuruk4" onkeydown="notNull();" onblur="chk(),individualcommNameCheck();"/><font color="red">*</font>
			    		<font color="red">
    		            <span id="fname"></span>
    		            <span id="individualcommNameCheck"></span>
    		            </font>
			    		</td>
			    		
			    	</tr>
			    	<tr>
			    		<td nowrap width="100" height="25" align="center" class="bg-zwbt">�Ƿ�����</td>
			    		<td nowrap colspan="2">
			    			<html:radio property="inuse" value="0">������</html:radio>
			    			<html:radio property="inuse" value="1">����</html:radio>
			    		</td>
			    		
			    		
			    	</tr>
			    	
			    	<tr>
			    		<td nowrap width="100" align="center" class="bg-zwbt">��ע</td>
			    		<td colspan="2"><html:textarea property="remark" styleClass="shuruk5" cols="70" rows="12"  onkeydown="notNull();" onblur="chk();"/><font color="red">*</font>
			    		<font color="red">
    		            <span id="fremark"></span>
    		            </font>
			    		</td>
			    		
			    	</tr>
				
			    	
			    	
				
					<tr>

							<td colspan="3" align="center">
								<a onclick="CheckForm();"
    		 		onmouseover="this.style.cursor='hand'"><img src="<%=path%>/imagine/tj.gif" width="52" height="23"></a>&nbsp;&nbsp;
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
            <input type="hidden" name="groupname" value="<%=groupname %>"/>
            <input type="hidden" name="userid" value="<%=userid %>"/>
			<html:hidden property="id" />


		
		</html:form>
	</body>
</html>
<script  language="javascript">
	function chk(){
		var name = document.getElementById("name").value;
		var remark = document.getElementById("remark").value;
		 
		if(name == ""){
			document.getElementById("fname").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
			//document.getElementById("name").focus();
			return false;	
				
		}else{
			if(getLen(document.getElementById("name").value) > 32){
				document.getElementById("fname").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���32���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
				//document.getElementById("name").focus();
				return false;	
			}
			else{document.getElementById("fname").innerHTML = "";}
		}
		
		if(remark == ""){
				document.getElementById("fremark").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				//document.getElementById("remark").focus();
				return false;	
				
			}else{
				if(getLen(document.getElementById("remark").value) > 200){
					document.getElementById("fremark").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���200���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					//document.getElementById("remark").focus();
					return false;
				}
				else{document.getElementById("fremark").innerHTML = "";}
			}
			
	}
		

	function CheckForm(){
	
		var name = document.getElementById("name").value;
		var remark = document.getElementById("remark").value;
		    
		if(name == ""){alert("�������벻����"); return false;}
		if(getLen(document.getElementById("name").value) > 32){alert("�ַ��������"); return false;}
			
		if(remark == ""){alert("�������벻����"); return false;}
		if(getLen(document.getElementById("remark").value) > 200){alert("�ַ��������"); return false;}
			
		individualcommNameCheck();
           
        if(this.individualcommNameflag=="false"){alert("���������ظ�"); return false;}
			
		if(document.all.id.value==''){document.all.method.value='add'}
			else{document.all.method.value='modify'};
			document.all.action.value='submit';
			document.forms[0].submit();
			return  true;
				
			}
				
				function onlyNum() 
				{ 
				if(!(event.keyCode==46)&&!(event.keyCode==8)&&!(event.keyCode==37)&&!(event.keyCode==39)) 
				if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105))) 
				event.returnValue=false; 
				} 
				
			function returnlist(){

            window.location.replace("<%=path%>/individualcommaction.do?method=listSelect&groupname=<%=groupname%>");
            
			}

</script>


