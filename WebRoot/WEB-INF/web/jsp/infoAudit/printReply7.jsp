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
<html:form action="/reply7.do">
<div class=Section1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='text-align:center;line-height:18.0pt;
mso-line-height-rule:exactly'><b><span style='font-size:18.0pt;font-family:
����'>������Ϣ����������飨�ߣ�<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=right style='text-align:right;
line-height:18.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
font-family:����_GB2312;mso-bidi-font-weight:bold'>��<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span></span>��ˮ������</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("year") %> </span></span><span style='font-size:
15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:
"Times New Roman"'>����</span><u><span lang=EN-US style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("applyNo") %> </span></span></u><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
lang=EN-US style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:
bold'><span style='mso-spacerun:yes'>&nbsp; </span></span><span lang=EN-US
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:18.0pt;mso-line-height-rule:exactly'><u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'><%=form.get("applicant") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span></u><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></u></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:18.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����أ���������</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("applyYear") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("applyMonth") %>&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("applyDay") %>&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>���յ���������λ��Ҫ���ȡ</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("applyTitle") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����롣</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:18.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312'>����飬������λ��Ҫ���ȡ��������Ϣ�漰<html:checkbox property="attr3" value="1"></html:checkbox>��ҵ����<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span><html:checkbox property="attr3" value="2"></html:checkbox>������˽��<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:18.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:
bold'>���ݡ��л����񹲺͹�������Ϣ�����������ڶ�ʮ���������Ϻ���</span><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>������Ϣ�����涨����ʮ�����ڶ���</span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'>�Ĺ涨���ִ����£�</span><b><span
lang=EN-US style='font-size:22.0pt;mso-bidi-font-size:12.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:18.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312'><html:checkbox property="replyType" value="1"></html:checkbox>������</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>Ȩ�����������ͬ�⹫����</span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'>�����أ�������������Թ���</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:18.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'><html:checkbox property="replyType" value="2"></html:checkbox>Ȩ���˲�ͬ�⹫����</span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'>�����أ���������˲��蹫��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:18.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'><html:checkbox property="replyType" value="3"></html:checkbox>Ȩ����δ�ڹ涨�����������𸴣�</span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'>�����أ���������˲��蹫��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:18.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312'><html:checkbox property="replyType" value="4"></html:checkbox>�����أ���������Ϊ���������ܶԹ�����������ش�Ӱ�죬</span><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�������Թ�����</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:18.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'><input type="checkbox" disabled>���ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����Ĺ涨</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'>�����ؽ�</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>ͨ��</span><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312'><html:checkbox property="offerWay" value="1"></html:checkbox>�����ṩ<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp; </span></span><html:checkbox property="offerWay" value="2"></html:checkbox>�����ʼ� <span
style='mso-spacerun:yes'>&nbsp;</span><html:checkbox property="offerWay" value="3"></html:checkbox>�ʼ�<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp; </span></span>��ʽ</span><span style='font-size:
15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:
"Times New Roman"'>�����ṩ��</span><span lang=EN-US style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

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
line-height:18.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�ش˸�֪��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-right:148.0pt'><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

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
style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ��ߣ�����ڡ�Ȩ����ͬ�⹫���漰��ҵ���ܡ�������˽��������Ϣ���Լ�����������Ϊ���������ܶԹ�����������ش�Ӱ�족���εĴ𸴡�<span
lang=EN-US><span style='mso-spacerun:yes'>&nbsp; </span><o:p></o:p></span></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>
</html:form>
</body>

</html>

