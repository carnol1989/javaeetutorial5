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
<html:form action="/obligeeMsg.do">
<div class=Section1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='text-align:center;line-height:18.0pt;
mso-line-height-rule:exactly'><b><span style='font-size:18.0pt;font-family:
����'>����Ȩ������Ϣ��֪��<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=right style='text-align:right;
line-height:18.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
font-family:����_GB2312;mso-bidi-font-weight:bold'>��<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span></span>��ˮ��Ȩ��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("year") %> </span></span><span style='font-size:
15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:
"Times New Roman"'>����</span><u><span lang=EN-US style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("autoNo") %> </span></span></u><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
lang=EN-US style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:
bold'><span style='mso-spacerun:yes'>&nbsp; </span></span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:26.0pt;mso-line-height-rule:exactly'><u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'><%=form.get("obligeeName") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:26.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����أ���������������Ϣ���������У�����鷢��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'>������</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'>
</span></span></u><span lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:
12.0pt;font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:26.0pt;mso-line-height-rule:exactly'><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("contentMsg") %>
</span></span></u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��������Ϣ��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:26.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'><html:checkbox property="involveMsg" value="1"></html:checkbox>�漰�����˵���Ϣ</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'><html:checkbox property="involveMsg" value="2"></html:checkbox>�漰����λ����Ϣ</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:26.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>����飬�����أ���������Ϊ������Ϣ���������ܶԹ�����������ش�Ӱ�죬���ݡ��Ϻ���������Ϣ�����涨����ʮ�����ڶ���Ĺ涨���������Թ�����</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:25.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��Ա��𸴲������������յ�����֮����</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'>60</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�������Ϻ�����������</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'>
</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����л����񹲺͹�ˮ���������������飬������</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'>3</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>������������Ժ�����������ϡ�</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:26.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
font-family:����_GB2312;mso-bidi-font-weight:bold'>�ش˸�֪��<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:26.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312'>�����������������˹�������Ϣ�ľ������<span
lang=EN-US><o:p></o:p></span></span></p>

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

<p class=MsoNormal><span lang=EN-US style='mso-bidi-font-size:10.5pt;
font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
style='mso-bidi-font-size:10.5pt;font-family:����'>ʹ��ָ�ϣ�<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>���ı������������������������漰��ҵ���ܡ�������˽��������Ϣ���Լ����ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��ߣ���Ĺ涨���򹫹�������Ҫ�����������漰��ҵ���ܡ�������˽��������Ϣ����֪Ȩ���˹��������ݺ����ɵ����Ρ�<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
lang=EN-US style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>
</html:form>
</body>

</html>

