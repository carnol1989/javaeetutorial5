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
<html:form action="/reply6.do"> 
<div class=Section1 style='layout-grid:15.6pt'>
<p class=MsoNormal align=center style='text-align:center;line-height:26.0pt;
mso-line-height-rule:exactly'><b><span style='font-size:18.0pt;font-family:
����'>������Ϣ����������飨����</span></b><b><span lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:
12.0pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span></b><b><span
lang=EN-US style='font-size:18.0pt;font-family:����'><o:p></o:p></span></b></p>


<p class=MsoNormal align=right style='text-align:right;
line-height:20.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
font-family:����_GB2312;mso-bidi-font-weight:bold'>�� ��ˮ�񲿴�</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("year") %> </span></span><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>����</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("applyNo") %> </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'><span
style='mso-spacerun:yes'>&nbsp; </span></span><span lang=EN-US
style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:20.0pt;mso-line-height-rule:exactly'><u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'><%=form.get("applicant") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span></u><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></u></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:20.0pt;mso-line-height-rule:
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
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:20.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>����飬������λ�������ȡ��������Ϣ���в�����������</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:20.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312'><html:checkbox property="type" value="1"></html:checkbox> ��������<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp; </span></span><html:checkbox property="type" value="2"></html:checkbox>��ҵ����<span lang=EN-US><span
style='mso-spacerun:yes'>&nbsp; </span></span><html:checkbox property="type" value="3"></html:checkbox>������˽ <html:checkbox property="type" value="4"></html:checkbox>���ɷ���涨�Ĳ��蹫������������<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:20.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>���ݡ��л����񹲺͹�������Ϣ�����������ڶ�ʮ���������Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ�������Ĺ涨�������أ��������Ըò�����Ϣ���蹫����������Ϣ���Թ�����</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:20.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����ڹ�����Χ��������Ϣ�����ݡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����Ĺ涨��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><html:checkbox property="sendWay" value="1"></html:checkbox>�����ؽ������ṩ
<span style='mso-spacerun:yes'>&nbsp;</span> <html:checkbox property="sendWay" value="2"></html:checkbox>ͨ�������ʼ� <html:checkbox property="sendWay" value="3"></html:checkbox>�ʼķ�ʽ </span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>�����ṩ��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

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

<p class=MsoNormal style='text-indent:30.0pt;line-height:20.0pt;mso-line-height-rule:
exactly'><span lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
mso-fareast-font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=right style='text-align:right;text-indent:86.25pt'><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("signYear") %>
</span></span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=form.get("signMonth") %> </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("signDay") %> </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0;
line-height:21.0pt;mso-line-height-rule:exactly'><span style='mso-bidi-font-size:
10.5pt;font-family:����'>ʹ��ָ�ϣ�<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>���ı������ڡ��Ϻ���������Ϣ�����涨���ڶ�ʮ�����ڣ���������ڡ����в�Ӧ�����������ݣ����ܹ����ִ���Ӧ�����ָ�֪�����ˣ��Բ��蹫���ģ�Ӧ��˵�����ɵġ����εĴ𸴡�<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
lang=EN-US style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:21.0pt;mso-line-height-rule:exactly'><b><span
lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:
��������'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>
</div>
</html:form>
</body>
</html>


