<%@ page language="java" import="org.apache.struts.validator.DynaValidatorForm;" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
DynaValidatorForm form =(DynaValidatorForm)  request.getAttribute("form");
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
	<link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/govinfoform.css" rel="stylesheet" type="text/css">
    <script src="../../../../javascript/validate.js"></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>

  </head>
 <body lang=ZH-CN style='tab-interval:21.0pt;text-justify-trim:punctuation'>
  <html:form action="/obligeeOpinion.do">
<div class=Section1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='text-align:center;line-height:26.0pt;
mso-line-height-rule:exactly'><b><span style='font-size:18.0pt;font-family:
����'>Ȩ���������ѯ��</span></b><b><span lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:
12.0pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span></b><b><span
lang=EN-US style='font-size:18.0pt;font-family:����'><o:p></o:p></span></b></p>

<p class=MsoNormal align=right style='text-align:right;word-break:break-all'><span style='font-size:15.0pt;
font-family:����_GB2312;mso-bidi-font-weight:bold'>��ˮ����ѯ</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("year") %> </span></span><span style='font-size:
15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:
"Times New Roman"'>����</span><u><span lang=EN-US style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("autoNo") %> </span></span></u><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'> <span
style='mso-spacerun:yes'>&nbsp;</span></span><span lang=EN-US style='font-size:
15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:24.0pt;mso-line-height-rule:exactly'><u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'><%=form.get("consultName") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:24.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����أ��������ڴ���������Ϣ�������빤���У�����鷢�֣����빫���Ĺ���</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("contentMsg") %>
</span></span></u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��������</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'>
</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>Ϣ��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:24.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312'><html:checkbox property="involveMsg" value="1"></html:checkbox></span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�漰�����˵���Ϣ</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'>&nbsp; </span><span
style='mso-spacerun:yes'>&nbsp;</span></span><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312'><html:checkbox property="involveMsg" value="2"></html:checkbox></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>�漰����λ����Ϣ</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:24.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>���ݡ��л����񹲺͹�������Ϣ�����������ڶ�ʮ���������Ϻ���������Ϣ�����涨����ʮ�����ڶ���Ĺ涨��������������λ���������������λ��������ǣ�</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:24.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312'><html:checkbox property="opinion" value="1"></html:checkbox></span><span style='font-size:15.0pt;font-family:����_GB2312;
mso-bidi-font-weight:bold'>ͬ�����������ṩ<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><html:checkbox property="opinion" value="2"></html:checkbox></span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'>��ͬ�����������ṩ<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:24.0pt;mso-line-height-rule:
exactly'><span lang=EN-US style='font-size:15.0pt;font-family:����_GB2312;
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:15.0pt;mso-char-indent-count:1.0;
line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��������λ����</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("replyYear") %>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("replyMonth") %>&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("replyDay") %>&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��ǰ���Դ𸴣���������ʼ��������أ�������������ַ��</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("address") %>
</span><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>���������룺</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("postalcode") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>����</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:22.0pt;mso-line-height-rule:exactly'><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=right style='text-align:right;text-indent:86.25pt'><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("signYear") %>
</span></span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("signMonth") %>&nbsp;&nbsp; </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("signDay") %>&nbsp;&nbsp; </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
style='mso-bidi-font-size:10.5pt;font-family:����'>ʹ��ָ�ϣ�<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>���ı������ڡ��Ϻ���������Ϣ�����涨����ʮ�����ڶ�����ڡ����漰��ҵ���ܡ�������˽��������Ϣ����ѯȨ��������������Ρ�</span><b><span
lang=EN-US style='font-size:22.0pt;mso-bidi-font-size:12.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>
</div>
</html:form>
</body>
</html>

