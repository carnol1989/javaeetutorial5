<%@ page language="java" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbInfoPubContent" />

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ include file="/WEB-INF/web/jsp/infopublic/commJs.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String parentid = (String) request.getAttribute("parentid");
	String p_name = (String) request.getAttribute("p_name");
	String type = (String) request.getAttribute("type");
	String id = (String) request.getAttribute("id");
	String str = "";
	if ("dsh".equals(type))
		str = "���";
	else if ("bs".equals(type))
		str = "����";
	else
		str = "����";
	//addType��ʾ�������Ϣ������ ˮ����� ��Ҫ�ĸ� ���� �б� ��Ƭ ӰƬ ���� �õ�Ƭ��һ������
	String addType = request.getParameter("addType");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>infopubcontentview.jsp</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
	</head>

	<body onload="init('<%=addType%>')">
		<html:form action="/infopubContentaction.do">

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
								<td width="84%" class="table2_topic">
									<%=str%>
									��Ϣ
								</td>
							</tr>
						</table>
					</td>
					<td background="images/8-2.gif">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="1"
				bgcolor="#0e88b9">
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="table2bg">
							<tr>
								<td align="center" valign="top">
									<table width="98%" border="0" cellpadding="0" cellspacing="0"
										class="table2bgin">
										<tr>
											<th width="94%" height="30" align="right" valign="bottom"></th>
											<th width="6%" valign="bottom"></th>
										</tr>

										<tr>
											<td colspan="2" align="center" valign="top">
												<table width="99%" border="0" cellpadding="0"
													cellspacing="1" class="tabin1_in" style="border: 0px">
													<tr>
														<td width="20%" align="left" style="noswap">
															��Ŀ
														</td>
														<td valign="top">
															<html:text property="infoclas" styleClass="shuruk2"
																size="50" readonly="true" />
															<input type="button" class="button0" value="��Ŀѡ��"
																width="50" height="20"
																onclick="selectCla('more','infopub');" align="top">
														</td>

													</tr>
													<tr>
														<td width="20%" align="left" style="noswap">
															����
														</td>
														<td>
															<html:text property="title" size="50"
																styleClass="shuruk2" readonly="true" />
															<font color="red"> <span align="left" id="ftitle"></span>
																<span align="left" id="infocommNameCheck"></span> </font>
														</td>

													</tr>
													<tr>
														<td width="20%" align="left" style="noswap">
															����
														</td>
														<td>
															<html:text property="authorName" size="50"
																styleClass="shuruk2" readonly="true" />
														</td>
													</tr>
													<tr>
														<td width="20%" align="left" nowrap>
															����ʱ��
														</td>
														<td colspan="1">
															<html:text property="createTime" styleClass="shuruk2"
																size="50" readonly="true" />
														</td>
													</tr>
													<tr>
														<td width="10%" align="left" nowrap>
															�ؼ���
														</td>
														<td width="90%">
															<table>
																<tr>
																	<td nowrap>
																		��һ��
																	</td>
																	<td nowrap>
																		<html:select property="keyword1"
																			styleClass="bot_select" disabled="true">
																			<html:option value=""></html:option>
																			<html:option value="1">�滮</html:option>
																			<html:option value="2">����</html:option>
																			<html:option value="3">����</html:option>
																			<html:option value="4">�ĸ�</html:option>
																		</html:select>
																	</td>
																	<td nowrap>
																		�ڶ���
																	</td>
																	<td nowrap>
																		<html:select property="keyword2"
																			styleClass="bot_select" disabled="true">
																			<html:option value=""></html:option>
																			<html:option value="1">ˮ��ȫ</html:option>
																			<html:option value="2">ˮ��Դ</html:option>
																			<html:option value="3">ˮ����</html:option>
																			<html:option value="4">ˮ����</html:option>
																		</html:select>
																	</td>
																</tr>
																<tr>
																	<td nowrap>
																		�����ࣨ���
																	</td>
																	<td nowrap>
																		<html:select property="keyword3"
																			styleClass="bot_select" disabled="true">
																			<html:option value=""></html:option>
																			<html:option value="1">�����쵼</html:option>
																			<html:option value="2">ʡ���������쵼</html:option>
																			<html:option value="3">���쵼</html:option>
																			<html:option value="4">���쵼</html:option>
																			<html:option value="5">ר��</html:option>
																			<html:option value="6">��ģ</html:option>
																			<html:option value="7">�Ŷ�</html:option>
																			<html:option value="8">����</html:option>
																		</html:select>
																	</td>
																	<td nowrap>
																		�����ࣨ�¼���
																	</td>
																	<td style="border-bottom: 0px">
																		<html:select property="keyword4"
																			styleClass="bot_select" disabled="true">
																			<html:option value=""></html:option>
																			<html:option value="1">ˮ����ʩ</html:option>
																			<html:option value="2">��ˮ��ʩ</html:option>
																			<html:option value="3">��ˮ��ʩ</html:option>
																			<html:option value="4">���Ӻ���</html:option>
																			<html:option value="5">����</html:option>
																		</html:select>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
												<div id="xw" style="display:none;position:relative;">
													<table width="99%" border="0" cellpadding="0"
														cellspacing="1" class="tabin1_in" style="border:0px">
														<tr>
															<td width="20%" align="left" nowrap>
																��Ҫ����
															</td>
															<td>
																<html:text property="summaryTitle" size="50"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td width="20%" align="left" nowrap>
																������ɫ
															</td>
															<td valign="top">
																<html:text property="titleColor" size="50"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td width="20%" align="left" nowrap>
																�ö�ʱ��
															</td>
															<td>
																<html:text property="topTime" size="50"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td width="20%" align="left" nowrap>
																��Ϣ��Դ
															</td>
															<td>
																<html:text property="infoSource" size="50"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td width="20%" align="left" nowrap>
																�Ƿ��а�Ȩ
															</td>
															<td>
																<html:radio property="iscopyright" value="0"
																	disabled="true">��</html:radio>
																<html:radio property="iscopyright" value="1"
																	disabled="true">��</html:radio>
															</td>
														</tr>
													</table>
												</div>
												<div id="addType"
													style="display:none;position:relative; padding-top: 2px;padding-bottom: ">
													<table width="99%" border="0" cellpadding="0"
														cellspacing="1" class="tabin1_in" style="border: 0px">
														<tr>
															<td id="col0" width="20%"></td>
															<td id="col01" width="30%">
																<html:text property="col0V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
															<td id="col1" width="20%"></td>
															<td width="30%" id="col11">
																<html:text property="col1V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td id="col2"></td>
															<td id="col21">
																<html:text property="col2V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
															<td id="col3"></td>
															<td id="col31">
																<html:text property="col3V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td id="col4"></td>
															<td id="col41">
																<html:text property="col4V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
															<td id="col5"></td>
															<td id="col51">
																<html:text property="col5V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td id="col6"></td>
															<td id="col61">
																<html:text property="col6V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
															<td id="col7"></td>
															<td id="col71">
																<html:text property="col7V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td id="col8"></td>
															<td colspan="2" id="col81">
																<html:text property="col8V" size="25"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
													</table>
												</div>
												<div style="position:relative;">
													<table width="98%" border="0" cellpadding="0"
														cellspacing="1" class="tabin1_in" style="border: 0px">
														<tr>
															<td width="20%" align="left" nowrap>
																��Ϣ����
															</td>
															<td>
																<html:select property="infoType" styleClass="bot_select"
																	disabled="true">
																	<html:option value="11">�ۺ�����</html:option>
																	<html:option value="12">һ�仰����</html:option>
																	<html:option value="10">ˮ��Ҫ��</html:option>
																	<html:option value="40">����</html:option>
																	<html:option value="38">�Ƽ���̬</html:option>
																	<html:option value="13">����</html:option>
																</html:select>
															</td>
														</tr>
														<tr>
															<td width="20%" align="left" style="noswap">
																���
															</td>
															<td>
																<html:text property="summary" size="50"
																	styleClass="shuruk2" readonly="true" />
															</td>
														</tr>
														<tr>
															<td width="20%" align="left" style="noswap">
																����
															</td>
															<td>
																<html:select property="sendTo" styleClass="bot_select"
																	disabled="true">
																	<html:option value="1">�������</html:option>
																	<html:option value="2">�����</html:option>
																	<html:option value="3">����</html:option>
																</html:select>
															</td>
														</tr>
														<tr>
															<td width="100%" align="center" colspan="2"
																style="noswap">
																��Ϣ����
															</td>
														</tr>
														<tr>
															<td colspan="2" align="center" align="left">
																<IFRAME ID="eWebEditor1" name="content_html"
																	src="eWebEditor/eWebEditor.jsp?id=content&style=standard&from=<%=type%>"
																	frameborder="0" scrolling="no" width="667" height="350"></IFRAME>
																<html:hidden property="content" styleClass="shuruk2" />
															</td>
														</tr>
														<%--<tr>
			    		<td nowrap width="100%" align="center" class="bg-zwbt" colspan="2" style="noswap">������</td>
			    	</tr>
					<tr>
						<td width="100%" colspan="2">
						<textarea name="apparise" rows="5" cols="80" styleClass="shuruk2"></textarea>
						</td>
					</tr>
				--%>

														<%
														if ("dsh".equals(type)) {
														%>
														<tr>
															<td width="100%" align="center" colspan="2">
																<BUTTON ID="ofntColor" TITLE="���ͨ��" onclick="shenhe();"
																	onmouseover="this.style.cursor='hand'">
																	���ͨ��
																</BUTTON>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<BUTTON ID="a" TITLE="���" onclick="rollback();"
																	onmouseover="this.style.cursor='hand'">
																	���
																</BUTTON>
															</td>
														</tr>
														<%
														} else {
														%>
														<tr>
															<td width="100%" align="center" colspan="2">
																<BUTTON ID="ofntColor" TITLE="����ͨ��" onclick="shenhe();"
																	onmouseover="this.style.cursor='hand'">
																	����ͨ��
																</BUTTON>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<BUTTON ID="a" TITLE="���" onclick="rollback();"
																	onmouseover="this.style.cursor='hand'">
																	���
																</BUTTON>
															</td>
														</tr>
														<%
														}
														%>
													</table>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="10" colspan="2"></td>
							</tr>

						</table>
					</td>
				</tr>
				
			</table>
			
			<html:hidden property="clasel" />
			<!-- ����Ŀ -->
			<html:hidden property="infoclas" />
			<!-- ����Ŀ -->
			<input type="hidden" name="type" value="<%=type%>" />
			<input type="hidden" name="action" />
			<input type="hidden" name="method" value="shehedo" />
			<input type="hidden" name="p_name" value="<%=p_name%>" />
			<input type="hidden" name="parentid" value="<%=parentid%>" />
			<input type="hidden" name="id" value="<%=id%>" />
		</html:form>
	</body>
</html>

<script language="javascript">
function shenhe()
{
	document.forms[0].submit();
	return  true;
	//window.location.href="<%=path%>/infopubContentaction.do?method=shehedo&id=<%=id%>&parentid=<%=parentid%>&p_name=<%=p_name%>&type=<%=type%>";
}
function rollback()
{
	window.location.href="<%=path%>/infopubContentaction.do?method=rollbackdo&id=<%=id%>&parentid=<%=parentid%>&p_name=<%=p_name%>&type=<%=type%>";
}
function selectCla(oneormore,type){
	
			window.showModalDialog("<%=path%>/infopubclaaction.do?method=list&oneormore="+oneormore+"&type="+type+"&source=doubleClaPub",window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
		
	}
</script>
