<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>���гɹ�</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function init(){
	var readonly = "${param.readonly}";
	if(readonly=="true"){
		var inputs = document.getElementsByTagName("input");
		for(i in inputs){
			var obj = inputs[i];
			if(obj.type=="text"){
				obj.readOnly = true;
			}else if(obj.type=="button"){
				obj.style.display="none";
			}
		}
		var tas = document.getElementsByTagName("textarea");
		for(i in tas){
			tas[i].readOnly = true;
		}
		document.getElementById("discoureBtnAdd").style.display = "none";
		document.getElementById("techBtnAdd").style.display = "none";
		document.getElementById("manageBtnAdd").style.display = "none";
		document.getElementById("startTime").onfocus="";
		document.getElementById("endTime").onfocus="";
	}
}
</script>
	</head>
	<body onload="init()">
<script type="text/javascript" src="<%=path%>/js/calendar-dong.js"></script>
		<html:form action="/techResult" enctype="multipart/form-data" method="post">
			<html:hidden property="id"/>
			<input type="hidden" name="method" value="add"/>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="288" height="40" align="left" valign="middle"
									background="images/8-1.gif">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="5%" align="center" valign="middle">
												&nbsp;
											</td>
											<td width="11%" height="12" align="center" valign="middle">
												<img src="images/icon5.gif" width="7" height="7" />
											</td>
											<td width="84%" class="table2_topic" align="left">
												��ӿ��гɹ���Ϣ
											</td>
										</tr>
									</table>
								</td>
								<td background="images/8-2.gif">
									&nbsp;
								</td>
							</tr>
						</table>
						<table width="100%" align="center" border="0" cellpadding="0"
							cellspacing="1" bgcolor="#0e88b9">
							<tr>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="table2bg">
										<tr>
											<td align="center" valign="top">
												<table width="98%" border="0" cellpadding="0"
													cellspacing="0" class="table2bgin">
													<tr>
														<th height="10" valign="bottom"></th>
													</tr>
													<tr>
														<td align="center" valign="bottom">
															<table width="98%" border="0" cellpadding="0"
													cellspacing="0" >
													<tr><td align="right"><img src="<%=path %>/images/fh.gif" onclick="history.back();" onmouseover="this.style.cursor='hand'" /></td></tr>
													</table>
																<table width="99%" border="0" cellpadding="0"
																cellspacing="1" class="tabin_in">
																<tr>
																	<td align="center" class="bg-zw" width="20%">
																	��Ŀ����:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:text property="itemName" size="30" styleClass="shuruk1"></html:text>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	�е���λ:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:text property="bearUnit" size="30" styleClass="shuruk1"></html:text>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��Ŀ������:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:text property="itemPrincipal" size="30" styleClass="shuruk1"></html:text>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��Ŀ��ʼʱ��:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:text property="startTime" size="30" styleClass="shuruk1" readonly="true" onfocus="setday(this)"></html:text>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��Ŀ����ʱ��:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:text property="endTime" size="30" styleClass="shuruk1" readonly="true" onfocus="setday(this)"></html:text>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	����ͱ�Ҫ��:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="needSense" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	�о����ݼ���ؼ���:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="contentKey" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	�ƻ�����:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="plan" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	Ԥ��Ч��:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="expectEffect" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��Ŀ���Ա:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="itemFrom" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	����:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="together" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��Ŀ��Ͷ��:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="itemInvest" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��ĿԤ��:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="itemBudget" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	������չ:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="workHeadway" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>	
																	<td align="center" class="bg-zw">
																	��������:
																	</td>
																	<td class="bg-zw" align="left">
																	<html:textarea property="issuePaper" styleClass="shuruk2" cols="40" rows="5"></html:textarea>
																	</td>
																</tr>
																<tr>
																	<td align="center" class="bg-zw"> 
																		�������ĸ���
																	</td>
																	<td class="bg-zw" align="left">
<script type="text/javascript" charset="utf-8" src="<%=path%>/javascript/attach.js"></script>
<logic:present name="files1">	
<table>
	<logic:iterate id="Record" indexId="i" name="files1" type="com.baosight.mode.TbDocAttach" >
		<tr id="trdiscoure${i}">
			<td>
			<html:link page="/docAttach.do?method=download" paramId="id" paramName="Record" paramProperty="id">
				<bean:write name="Record" property="originallyName"/>
			</html:link>
			<input type="button" onclick="deleteFile('discoure${i}')" value="ɾ��" class="button0" />
			<input type="hidden" id="hiddiscoure${i}" value="${Record.id}" />
			<input type="hidden" id="fileNamediscoure${i}" value="${Record.originallyName}">
			<td>
		</tr>
	</logic:iterate>
</table>
</logic:present>
			<table id="discouretb" cellpadding="0" cellspacing="1"></table>
			<div id="discoureBtnAdd">
				<input type="button" value="��Ӹ���" onclick="_sFileName('discoure');additem('discouretb')" class="button0"/>
				<font color="red">�ϴ������ļ����ܴ���10M!</font>
			</div>
																	</td>
																</tr>
																<tr>
																	<td align="center" class="bg-zw"> 
																		�����ĵ�����
																	</td>
																	<td class="bg-zw" align="left">
<logic:present name="files2">	
<table>
	<logic:iterate id="Record" indexId="i" name="files2" type="com.baosight.mode.TbDocAttach" >
		<tr id="trtech${i}">
			<td>
			<html:link page="/docAttach.do?method=download" paramId="id" paramName="Record" paramProperty="id">
				<bean:write name="Record" property="originallyName"/>
			</html:link>
			<input type="button" onclick="deleteFile('tech${i}')" value="ɾ��" class="button0" />
			<input type="hidden" id="hidtech${i}" value="${Record.id}" />
			<input type="hidden" id="fileNametech${i}" value="${Record.originallyName}">
			<td>
		</tr>
	</logic:iterate>
</table>
</logic:present>
			<table id="techtb" cellpadding="0" cellspacing="1"></table>
			<div id="techBtnAdd">
				<input type="button" value="��Ӹ���" onclick="_sFileName('tech');additem('techtb')" class="button0"/>
				<font color="red">�ϴ������ļ����ܴ���10M!</font>
			</div>
																	</td>
																</tr>
																<tr>
																	<td align="center" class="bg-zw"> 
																		�����ĵ�����
																	</td>
																	<td class="bg-zw" align="left">
<logic:present name="files3">	
<table>
	<logic:iterate id="Record" indexId="i" name="files3" type="com.baosight.mode.TbDocAttach" >
		<tr id="trmanage${i}">
			<td>
			<html:link page="/docAttach.do?method=download" paramId="id" paramName="Record" paramProperty="id">
				<bean:write name="Record" property="originallyName"/>
			</html:link>
			<input type="button" onclick="deleteFile('manage${i}')" value="ɾ��" class="button0" />
			<input type="hidden" id="hidmanage${i}" value="${Record.id}" />
			<input type="hidden" id="fileNamemanage${i}" value="${Record.originallyName}">
			<td>
		</tr>
	</logic:iterate>
</table>
</logic:present>
			<table id="managetb" cellpadding="0" cellspacing="1"></table>
			<div id="manageBtnAdd">
				<input type="button" value="��Ӹ���" onclick="_sFileName('manage');additem('managetb')" class="button0"/>
				<font color="red">�ϴ������ļ����ܴ���10M!</font>
			</div>
																	</td>
																</tr>
																<tr>
																<td align="center" colspan="2" height="25">
																	<input type="button" class="button0" value="�ύ" onclick="document.forms[0].submit();"/>
																</td>
																</tr>
															</table>
															</td>
													</tr>
													<tr>
														<td height="10"></td>
													</tr>
												</table>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
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
					</td>
				</tr>
			</table>
		</html:form>
	</body>
</html>
