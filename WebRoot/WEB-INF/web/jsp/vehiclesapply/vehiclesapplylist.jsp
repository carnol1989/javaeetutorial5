<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
		
	String sessionID = "";
	int curPage = 0;
	long count=0;
	try{
	      sessionID = (String)request.getAttribute("sessionID");
	      curPage = (Integer)session.getAttribute(sessionID+"No");
	       count=(Long)session.getAttribute(sessionID+"Count");
	}catch(Exception ex){
		ex.printStackTrace();
	}
		
	int i=0;//���
	String license="";
	if(StringUtils.isNotBlank((String)request.getAttribute("license")))
		license=request.getAttribute("license").toString();
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/images/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		function selectByName(){
			var l=licenseNumber.value;
	        window.location.replace("<%=path%>/tbVehiclesApply.do?method=list&action=conditionSelect&license="+l);
		}
	</script>		
</head>
<body>
	<table width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
	     		<tr>
		            <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif">
		            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		                		<tr>
		                  			<td width="5%" align="center" valign="middle">&nbsp;</td>
	                  				<td width="11%" height="12" align="center" valign="middle">
	             	     				<img src="images/icon5.gif" width="7" height="7" />
	                  				</td>
									<td width="84%" class="table2_topic" align="right">��������</td>
	               				</tr>
		            		</table>
		            </td>
	            	<td background="images/8-2.gif">&nbsp;</td>
	       		</tr>
			</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9"><tr><td>
	        
	        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
        		<tr>
        		<td align="center" valign="top">
        		
					<table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
        				<tr><th height="30" valign="bottom"></th></tr>
				           
						<tr>
				        <td align="center" valign="bottom">
				        <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                      <td width="2%" height="24">&nbsp;</td> 
                      <td width="16%" class="tabin_atab"><a href="tbVehiclesApply.do?method=list&action=all">�ó�����</a></td>
                      <td width="16%" class="tabin_atabno"><a href="vehicles.do?method=findVehiclesList"><span class="bg-zw">��������</span></a></td>
                   <td width="90%">&nbsp;</td>
                   </table> 
				        	<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
				         		<tr>
	                       			<td width="100%" colspan="7" valign="middle"  bgcolor="#f7f7f7" align="left">
		            					<table width="100%" >
		            						<tr>
		            						<td valign="bottom">
		            							���ƺţ�&nbsp;<input class="shuruk1" type="text" id="licenseNumber" value="<%=license%>"/>
		            							<input name="Submit2" type="button" class="button0" value="�� ѯ" onclick="selectByName();" onmouseover="this.style.cursor='hand'"/>
		            						</td>
		            						<td align="right">
		            							<input name="Submit2" type="button" class="button0" value="�� ��" onclick="window.location='<%=path%>/tbVehiclesApply.do?method=add&action=add';" onmouseover="this.style.cursor='hand'"/>
											</td>
											</tr>
										</table>
	                       			</td>
	                       		</tr>
	                       				
	                       		<tr align="center">
									<th width="5%" align="center" height="25" >���</th>
									<th width="15%" align="center" >���ƺ�</th>
									<th width="20%" align="center" >����ʱ��</th>
									<th width="20%" align="center" >������</th>
									<th width="20%" align="center" >����״̬</th>
									<th width="20%" align="center" colspan="3">����</th>
								</tr>
										
								<logic:present name="curPageList">								
								<logic:iterate id="VehiclesApplyRecord" name="curPageList" type="com.baosight.mode.TbVehiclesApply" >
										
								<tr align="center">
									<td  align="center" height="25"><%=i + 1%><%i++; %></td>
									<td align="center"><bean:write name="VehiclesApplyRecord" property="license"/></td>
									<td align="center">
										<bean:write name="VehiclesApplyRecord" property="applyTime" format="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td align="center"><bean:write name="VehiclesApplyRecord" property="applyer"/></td>
									<td  align="center">
										<logic:equal value="1" name="VehiclesApplyRecord" property="status" >δ�ύ</logic:equal>	
										<logic:equal value="2" name="VehiclesApplyRecord" property="status" >���ύδ���</logic:equal>											
										<logic:equal value="4" name="VehiclesApplyRecord" property="status" >���ͨ��</logic:equal>
										<logic:equal value="8" name="VehiclesApplyRecord" property="status" >����</logic:equal>
									</td>
										
						            <td width="3%" align="center">
										<html:link page="/tbVehiclesApply.do?method=modify&action=view" 
											paramId="id" paramName="VehiclesApplyRecord" paramProperty="id">
											<img src="<%=path %>/images/icon10.gif" width="15" height="15" border="0" alt="�鿴">
										</html:link>
									</td>
						            <td width="3%" align="center">
										<html:link page="/tbVehiclesApply.do?method=modify" 
											paramId="id" paramName="VehiclesApplyRecord" paramProperty="id">
											<img src="<%=path %>/imagine/xg.gif" width="15" height="15" border="0" alt="�޸�">
										</html:link>
									</td>
									<td width="3%" align="center">
										<html:link page="/tbVehiclesApply.do?method=delete" 
											paramId="id" paramName="VehiclesApplyRecord" paramProperty="id" onclick="return confirm('�Ƿ�ȷ��ɾ��');">
											<img src="<%=path %>/imagine/sc.gif" width="16" height="15" border="0" alt="ɾ��">
										</html:link>
									</td>
								</tr>
									
								</logic:iterate>
								</logic:present>
									
				         	</table>
				         	
				         	<table width="99%" border="0" cellspacing="0" cellpadding="0">
							    <tr><td height="10"></td></tr>
							    <tr>
							        <td class="tabin_page">
										<a href="<%=path%>/tbVehiclesApply.do?method=movePage&moveTo=<%=curPage-1%>&sessionID=<%=sessionID %>"><span class="bg-zw">��һҳ</span></a>
										<a href="<%=path%>/tbVehiclesApply.do?method=movePage&moveTo=<%=curPage+1%>&sessionID=<%=sessionID %>"><span class="bg-zw">��һҳ</span></a>
										&nbsp;<span class="bg-zw">��<%=curPage+1%>ҳ</span>
										<span class="bg-zw">ÿҳ��ʾ</span>
										<a href="<%=path%>/tbVehiclesApply.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID %>"><span class="bg-zw">10</span></a>
										<a href="<%=path%>/tbVehiclesApply.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID %>"><span class="bg-zw">20</span></a>
										<a href="<%=path%>/tbVehiclesApply.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID %>"><span class="bg-zw">30</span></a>
										<span class="bg-zw">��</span> 
										<span class="bg-zw">��<%=count %>��</span>                        
									</td>
								</tr>
							</table>
				        </td>
						</tr>	
	        		</table>
	        	</td>
	        	</tr>
	        	
	        	<tr height="8"><td><td></tr>
	        </table>
</td></tr></table>	
		</td>
		</tr>
	</table>	
	
</body>
</html>
	
