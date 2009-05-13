<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String disply=request.getParameter("disply");
	
%>
<% %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>������Ϣ���������</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
		
		<script type="text/javascript" src="<%=path %>/javascript/calendar.js"></script>
	  	<script type="text/javascript" src="<%=path %>/javascript/calendar-zh.js"></script>
	  	<script type="text/javascript" src="<%=path %>/javascript/calendar-setup.js"></script>
		<script type="text/javascript" src="<%=path %>/js/common.js"></script>
</head>

<body>
		<h3>������Ϣ���������</h3>
	<html:form action="/tbGovInfoPubMain.do">
	<table height="491" border="2" align="center" cellpadding="0" cellspacing="0" bordercolor="black" class="tableborder">
		<tr>
			<td colspan="3">
				�����ˣ����ˣ�����
			</td>
			<td colspan="10" align="center">
			<c:if test="${govInfoPub.applyType==10 }">
				&nbsp;<c:out value="${govInfoPub.applicant }"></c:out>
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				�����ˣ����˻���������֯������
			</td>
			<td colspan="3">
			&nbsp;
			<c:if test="${govInfoPub.company_Name==20 }">
				<c:out value="${govInfoPub.company_Name }"></c:out>
			</c:if>
			</td>
			<td colspan="5">
				����������
			</td>
			<td colspan="2">
			<c:if test="${govInfoPub.company_Name==20 }">
				&nbsp;<c:out value="${govInfoPub.company_Name }"></c:out>
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" rowspan="3">
				��ϵ��ʽ
			</td>
			<td colspan="8">
				<input type="checkbox" />ͨ�ŵ�ַ:
				<c:out value="${govInfoPub.applyAddr }"></c:out>
			</td>
			<td colspan="2">
				��������:
			</td>
			<td width="625">
				&nbsp;<c:out value="${govInfoPub.postcode }"></c:out>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<input type="checkbox" />��ϵ�绰:
				<c:out value="${govInfoPub.phone }"></c:out>
			</td>
			<td colspan="6">
				��ϵ��:<c:out value="${govInfoPub.applicant }"></c:out>
			</td>
		</tr>
		<tr>
			<td colspan="11">
				<input type="checkbox" />��������:<c:out value="${govInfoPub.email }"></c:out>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				������Ϣ����������أ�����������:<c:out value="${govInfoPub.applicant }"></c:out>
			</td>
			<td colspan="9">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="4" rowspan="2">
				�����������Ϣ
			</td>
			<td colspan="4">
				����:<c:out value="${govInfoPub.doc_Name }"></c:out>
			</td>
			<td colspan="5">
				�ĺ�:<c:out value="${govInfoPub.doc_Num }"></c:out>
			</td>
		</tr>
		<tr>
			<td colspan="9">
				����������������:<c:out value="${govInfoPub.descr }"></c:out>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				��ȡ������Ϣ�ķ�ʽ
			</td>
			<td colspan="9">
			<c:if test="${govInfoPub.applyManner==null }">
				<input type="radio"  name="way"/>�ʼ�
				<input type="radio"  name="way" />����
				<input type="radio"  name="way"/>������ȡ
				<input type="radio"  name="way"/>�ֳ�����
			</c:if>	
			<c:if test="${govInfoPub.applyManner==10 }">
				<input type="radio" checked="checked" name="way"/>�ʼ�
				<input type="radio"  name="way" />����
				<input type="radio"  name="way"/>������ȡ
				<input type="radio"  name="way"/>�ֳ�����					
			</c:if>
			<c:if test="${govInfoPub.applyManner==20 }">
				<input type="radio"  name="way"/>�ʼ�
				<input type="radio" checked="checked" name="way" />����
			<input type="radio"  name="way"/>������ȡ
			<input type="radio"  name="way"/>�ֳ�����					
			</c:if>
			<c:if test="${govInfoPub.applyManner==30 }">
				<input type="radio"  name="way"/>�ʼ�
				<input type="radio"  name="way" />����					
				<input type="radio" checked="checked" name="way"/>������ȡ			
				<input type="radio"  name="way"/>�ֳ�����						
			</c:if>
			<c:if test="${govInfoPub.applyManner==40 }">
				<input type="radio"  name="way"/>�ʼ�
				<input type="radio"  name="way" />����
				<input type="radio"  name="way"/>������ȡ				
				<input type="radio" checked="checked" name="way"/>�ֳ�����
			</c:if>					
			</td>
		</tr>
		<tr>
			<td colspan="4">
				������Ϣ��������ʽ
			</td>
			<td colspan="9">
			<c:if test="${govInfoPub.offerWay==null }">
				<input type="radio" name="offerway"/>�����ʼ�
				<input type="radio" name="offerway"/>ֽ���ı�
			</c:if>
			<c:if test="${govInfoPub.offerWay==20 }">
				<input type="radio" name="offerway"/>ֽ���ı�
				<input type="radio" name="offerway" checked="checked"/>�����ʼ�
			</c:if>
			<c:if test="${govInfoPub.offerWay==10 }">
				<input type="radio" name="offerway"/>�����ʼ�
				<input type="radio" name="offerway" checked="checked"/>ֽ���ı�
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				����������Ϣ����;
			</td>
			<td colspan="9">
			<c:if test="${govInfoPub.reason==10 }"></c:if>
				<input type="checkbox" name="reason1"/>��������Ҫ<input type="checkbox" name="reason2"/>
				�������Ҫ <input type="checkbox" name="reason3"/>���е���Ҫ<input type="checkbox" name="reason4"/>����������Ϣ
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<strong>�ر�������</strong>��������������շѣ���Ҫ����
			</td>
			<td colspan="9">
				�����ݲ��շ�
			</td>
		</tr>
		<tr>
			<td width="121" height="51">
				������ǩ�������£�
			</td>
			<td colspan="4">
				&nbsp;<c:out value="${govInfoPub.applicant }"></c:out>
			</td>
			<td colspan="4">
				����ʱ��
			</td>
			<td colspan="4">
				<c:out value="${govInfoPub.startTime }"></c:out>
			</td>
		</tr>
	</table>
</html:form>
</body>
</html>
