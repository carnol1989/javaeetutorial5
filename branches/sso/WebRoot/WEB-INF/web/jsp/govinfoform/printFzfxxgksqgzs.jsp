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
    
    <title>My JSP 'printFzfxxgksqgzs.jsp' starting page</title>
    
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
style='font-size:18.0pt;font-family:����'>��������Ϣ���������֪��<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=right style='text-align:right;'><span style='font-size:
15.0pt;font-family:����_GB2312;mso-bidi-font-weight:bold'>��ˮ�����棨<span
lang=EN-US><span style='mso-spacerun:yes'><%=lsNo.substring(0,4) %> </span></span>����<u><span
lang=EN-US><span style='mso-spacerun:yes'><%=lsNo.substring(4,lsNo.length()) %> </span></span></u>��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span style='mso-spacerun:yes'>&nbsp; </span></span><span
lang=EN-US style='font-size:15.0pt;font-family:����_GB2312;mso-bidi-font-weight:
bold'><o:p></o:p></span></p>

<p class=MsoNormal><u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'><%=form.get("applicant") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span></u><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></u></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0'><span
style='font-size:15.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�����أ���������</span><u><span
lang=EN-US style='font-size:15.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=sqTime.substring(0,4) %>&nbsp;&nbsp; </span></span></u><span
style='font-size:15.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><u><span
lang=EN-US style='font-size:15.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=sqTime.substring(5,7) %>&nbsp; </span></span></u><span style='font-size:
15.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>��</span><u><span
lang=EN-US style='font-size:15.0pt;mso-fareast-font-family:����_GB2312'><span
style='mso-spacerun:yes'><%=sqTime.substring(8,10) %>&nbsp; </span></span></u><span style='font-size:
15.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>���յ�������λ��ͨ��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312'><%if(null!=form.get("attr2") && form.get("attr2").equals("17")){ %><input type="checkbox" name="attr2" id="attr2" value="50" checked disabled="disabled"/><%}else { %><input type="checkbox" name="attr2" id="attr2" value="50" disabled="disabled"/><%} %>�����ʼ�<span
lang=EN-US><span style='mso-spacerun:yes'>&nbsp; </span></span><%if(null!=form.get("attr2") && form.get("attr2").equals("20")){ %><input type="checkbox" name="attr2" id="attr2" value="10" checked/><%}else { %><input type="checkbox" name="attr2" id="attr2" value="10" /><%} %>�ʼ�<span
lang=EN-US><span style='mso-spacerun:yes'>&nbsp; </span></span><%if(null!=form.get("attr2") && form.get("attr2").equals("19")){ %><input type="checkbox" name="attr2" id="attr2" value="20" checked/><%}else { %><input type="checkbox" name="attr2" id="attr2" value="20" /><%} %>����<span
lang=EN-US><span style='mso-spacerun:yes'>&nbsp; </span></span><%if(null!=form.get("attr2") && form.get("attr2").equals("21")){ %><input type="checkbox" name="attr2" id="attr2" value="30" checked/><%}else { %><input type="checkbox" name="attr2" id="attr2" value="30" /><%} %>������ȡ<span
lang=EN-US><span style='mso-spacerun:yes'>&nbsp; </span></span><%if(null!=form.get("attr2") && form.get("attr2").equals("18")){ %><input type="checkbox" name="attr2" id="attr2" value="40" checked/><%}else { %><input type="checkbox" name="attr2" id="attr2" value="40" /><%} %>��</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>���������Ҫ���ȡ<u><span
style='mso-spacerun:yes'><%=form.get("attr1") %>
</span>������</u><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;
font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�Ĳ��ϡ�</span></span><u><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></u></p>

<p class=MsoNormal style='text-indent:30.0pt;line-height:25.0pt;mso-line-height-rule:
exactly'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
����_GB2312;mso-ascii-font-family:"Times New Roman"'>����飬</span><span
style='font-size:15.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>���ύ�Ĳ��ϲ�����</span><span
style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:����_GB2312;
mso-ascii-font-family:"Times New Roman"'>���Ϻ���������Ϣ�����涨���ڶ�ʮһ���涨��������Ϣ����������Ҫ�󣬲������ڡ��Ϻ���������Ϣ�����涨���������ز��ٰ��ա��Ϻ���������Ϣ�����涨�������𸴡�</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:30.0pt;mso-char-indent-count:2.0;
line-height:25.0pt;mso-line-height-rule:exactly'><span style='font-size:15.0pt;
mso-bidi-font-size:12.0pt;font-family:����_GB2312;mso-ascii-font-family:"Times New Roman"'>�ش˸�֪��</span><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><o:p></o:p></span></p>

<p class=MsoNormal align=right style='text-align:right;word-break:break-all'><span
lang=EN-US style='font-size:15.0pt;mso-bidi-font-size:12.0pt;mso-fareast-font-family:
����_GB2312'><span
style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span
style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><o:p></o:p></span></p>

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

<p class=MsoNormal align=center style='text-align:center;text-indent:86.25pt'><span
lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;text-indent:86.25pt'><span
lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;text-indent:86.25pt'><span
lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-family:����'>ʹ��ָ�ϣ�<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
style='font-family:����_GB2312'>���ı������ڹ��񡢷��˻�������֯�ύ����������У�δ���ա��л����񹲺͹�������Ϣ�����������͡��Ϻ���������Ϣ�涨���Ĺ涨������κ�������Ϣ�����������</span></p>

<p class=MsoNormal><span lang=EN-US style='mso-bidi-font-size:10.5pt;
font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>

</html>
