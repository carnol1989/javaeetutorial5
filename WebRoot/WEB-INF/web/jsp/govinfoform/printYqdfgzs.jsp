<%@ page language="java" import="org.apache.struts.validator.DynaValidatorForm;" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String infoId = request.getParameter("id");
String sqTime = (String)request.getAttribute("sqTime");
String dfTime = (String)request.getAttribute("dfTime");
String lsNo = (String)request.getAttribute("lsNo");
DynaValidatorForm form =(DynaValidatorForm)  request.getAttribute("form");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'printYqdfgzs.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body lang=ZH-CN link=blue vlink=purple style='tab-interval:21.0pt;text-justify-trim:
punctuation'>

<div class=Section1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='margin-right:15.0pt;text-align:center'><b><span
style='font-size:18.0pt;font-family:����'>���ڴ𸴸�֪��<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=right style='text-align:right'><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��ˮ���Ӵ��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'>
</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=lsNo.substring(0,4) %> </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>����</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=lsNo.substring(4,lsNo.length()) %> </span></span></u><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span><span
lang=EN-US style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:
bold'><span style='mso-spacerun:yes'>&nbsp;</span></span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal><u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'><%=form.get("applicant") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span></u><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></u></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0'><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>�����أ���������</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=sqTime.substring(0,4) %>&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=sqTime.substring(5,7) %>&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><u><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=sqTime.substring(8,10) %>&nbsp; </span></span></u><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>���յ���������λ��Ҫ���ȡ</span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%=form.get("attr1") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����롣</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0'><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>���ݡ��л����񹲺͹�������Ϣ�����������ڶ�ʮ�����ڶ�����Ϻ���������Ϣ�����涨���ڶ�ʮ������һ��Ĺ涨�������أ�������Ӧ����</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'>15</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>���������������𸴣�������޷����ڴ𸴣��������أ�������������Ϣ������������������ͬ�⣬������</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'>10</span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�������������𸴡�</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�ش˸�֪��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><o:p></o:p></span></p>

<p class=MsoNormal align=right style='text-align:right;text-indent:86.25pt'><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'><%="".equals(dfTime) ? "" :dfTime.substring(0,4)%>&nbsp;
</span></span><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'><%=dfTime.equals("")?"":dfTime.substring(5,7) %>&nbsp; </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=dfTime.equals("")?"":dfTime.substring(8,10) %>&nbsp; </span></span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>��</span><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:86.25pt'><span lang=EN-US
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:36.1pt;mso-para-margin-left:.01gd;
text-indent:-36.0pt;mso-char-indent-count:-3.0;line-height:24.0pt;mso-line-height-rule:
exactly'><span lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;
mso-hansi-font-family:����;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:36.1pt;mso-para-margin-left:.01gd;
text-indent:-36.0pt;mso-char-indent-count:-3.0;line-height:24.0pt;mso-line-height-rule:
exactly'><span lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;
mso-hansi-font-family:����;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-right:15.0pt;text-indent:21.0pt;mso-char-indent-count:
2.0'><span style='mso-bidi-font-size:10.5pt;font-family:����'>ʹ��ָ�ϣ�<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='margin-right:15.0pt;text-indent:21.0pt;mso-char-indent-count:
2.0'><span style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>���ı������ڡ��л����񹲺͹�������Ϣ�����������ڶ�ʮ�����ڶ���Լ����Ϻ���������Ϣ�����涨���ڶ�ʮ������һ����ڡ����ڴ�������Ϣ�������롱�����Ρ�<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:
12.0pt;mso-fareast-font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>
</html>
