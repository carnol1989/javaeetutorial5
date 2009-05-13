<%@ page language="java" import="java.util.*,java.text.*,com.baosight.mode.TbUser" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String parentid=(String)request.getAttribute("parentid");
	String p_name=(String)request.getAttribute("p_name");
	String type = (String)request.getAttribute("type");
	String id = (String)request.getAttribute("id");
	String str = "";
	if ("dsh".equals(type))
		str = "���";
	else if ("bs".equals(type))
		str = "����";
	else
		str = "����";
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
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<script src="../../../../javascript/validate.js"></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<script type="text/javascript" src="<%=path %>/js/calendar.js"></script>
		
	</head>
	
	<body>
		<html:form action="/govinfopubContentaction.do">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="5%" align="center" valign="middle">&nbsp;</td>
                  <td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
                  <td width="84%" class="table2_topic">������Ϣ����</td>
                </tr>
            </table></td>
            <td background="images/8-2.gif">&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">
        <tr>
          <td>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top"><table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
                <tr>
                  <th height="30" valign="bottom"></th>
                </tr>
                <tr>
                  <td align="center" valign="top">
                  <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    	 <tr>
             				<td align="right">
							<img src="<%=path%>/images/fh.gif" width="46" height="25" border="0"  onclick="returnList();" onmouseover="this.style.cursor='hand'"/>
							
							&nbsp;&nbsp;</td>
          				</tr>
        			  </table> 
                  
  	    <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
				   <tr>
			    		<td width="10%" align="left" style="noswap">��������</td>
			    		<td colspan="3">
			    		<html:select property="publishType" styleClass="bot_select"> 
			    		<html:option value="10">����������Ϣ</html:option>
			    		<html:option value="20">���빫����Ϣ</html:option>
			    		<html:option value="30">���ڹ�����Ϣ</html:option>
			    		</html:select>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">��Ŀ</td>
			    		<td colspan="3"><html:text property="attr2" styleClass="shuruk1" readonly="true"/>
			    		<input  type="button" class="button0" value="��Ŀѡ��" width="50" height="20" onclick="selectCla('one','govinfopub');" align="top">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">����</td>
			    		<td colspan="3"><html:text property="title" styleClass="shuruk1" readonly="true"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">�ļ����</td>
			    		<td width="40%"><html:text property="fileCode" styleClass="shuruk1" readonly="true"/></td>
			    		<td width="10%" align="left" style="noswap">��������</td>
			    		<td width="40%"><html:text property="infoSource" styleClass="shuruk1" readonly="true"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">��ȡ��</td>
			    		<td width="40%"><html:text property="applyId" styleClass="shuruk1" readonly="true"/></td>
			    		<td width="10%" align="center" style="noswap">��������</td>
			    		<td width="40%">
			    		<html:select property="offerWay" styleClass="bot_select">
			    		<html:option value="10">ֽ�ư�</html:option>
			    		<html:option value="20">���Ӱ�</html:option>
			    		<html:option value="30">���̰�</html:option>
			    		<html:option value="40">���̰�</html:option>
			    		<html:option value="50">����</html:option>
			    		</html:select>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">�ؼ���</td>
			    		<td colspan="3"><html:text property="keyword" styleClass="shuruk1" readonly="true"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">����</td>
			    		<td width="40%">
			    		<html:select property="status" styleClass="bot_select">
			    		<html:option value="1">�������</html:option>
			    		<html:option value="2">�����</html:option>
			    		</html:select>
			    		</td>
			    		<td width="10%" align="left" style="noswap">����</td>
			    		<td width="40%"><html:text property="authorName" styleClass="shuruk1" readonly="true"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">����ʱ��</td>
			    		<td colspan="3"><html:text property="createTime" styleClass="shuruk1" readonly="true"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td width="10%" align="left" style="noswap">���</td>
			    		<td colspan="3"><html:text property="summary" styleClass="shuruk1" readonly="true"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td align="center" colspan="4" style="noswap">��Ϣ����</td>
			    	</tr>
			    	<tr>
						<td colspan="4">
						<IFRAME ID="eWebEditor1" name="content_html" src="eWebEditor/eWebEditor.jsp?id=content&style=standard" frameborder="0" scrolling="no" width="670" height="350"></IFRAME>
						<html:hidden property="content" styleClass="shuruk2"/>
						
						</td>
					</tr>
					
					<tr>
						<td width="100%" align="center" colspan="4">
							<BUTTON ID="ofntColor" TITLE="���ͨ��" onclick="shenhe();" onmouseover="this.style.cursor='hand'">���ͨ��</BUTTON>	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<BUTTON ID="a" TITLE="���" onclick="rollback();" onmouseover="this.style.cursor='hand'">���</BUTTON>					
					 	</td>
					</tr>
			</table>
			</td>
                </tr>
                <tr>
                  <td height="20"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="8"></td>
            </tr>
          </table>
          </td>
      </tr>
    </table>
      </td>
  </tr>
</table> 
			<input type="hidden" name="type" value="<%=type %>" />
			<input type="hidden" name="pubcominfo" /><!--������Ϣ��Ŀѡ�� -->
			<input type="hidden" name="action" />
			<input type="hidden" name="method" value="shehedo"/>
			<input type="hidden" name="p_name" value="<%=p_name %>" />
            <input type="hidden" name="parentid" value="<%=parentid %>"/>
			<input type="hidden" name="id" value="<%=id %>" />

<input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="6aa35341f25184fd996c4c918255c3ae">
		
		</html:form> 
        <OBJECT id="dlgHelper" CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px"></OBJECT> 	    	
	</body>
</html>
<script  language="javascript">
function shenhe()
{
	document.forms[0].submit();
	return  true;
	//window.location.href="<%=path %>/govinfopubContentaction.do?method=shehedo&id=<%=id %>&parentid=<%=parentid%>&p_name=<%=p_name%>&type=<%=type%>";
}
function returnList(){

      window.location.replace("<%=path%>/govinfopubContentaction.do?method=list&parentid=<%=parentid%>&p_name=<%=p_name%>");
      
	}
function selectCla(oneormore,type){
	
	window.showModalDialog("<%=path%>/infopubclaaction.do?method=list&oneormore="+oneormore+"&type="+type+"&source=doubleClaPub",window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
		
	}
</script>


