<%@ page language="java" import="java.util.*;import com.baosight.mode.TbGovInfoPub;import java.text.DateFormat;import java.text.SimpleDateFormat;" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TbGovInfoPub record =(TbGovInfoPub)  request.getAttribute("record");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'printGovInfoPubMainView.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">

	</script>
  </head>
   <body  lang=ZH-CN style='tab-interval:21.0pt;text-justify-trim:punctuation'>

<div class=Section1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:18.0pt;font-family:����'>������Ϣ���������<span lang=EN-US><o:p></o:p></span></span></b></p>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=648
 style='width:486.0pt;margin-left:-30.6pt;border-collapse:collapse;border:none;
 mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
 mso-border-insideh:.5pt solid windowtext;mso-border-insidev:.5pt solid windowtext'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;page-break-inside:avoid'>
  <td width=180 style='width:135.0pt;border:solid windowtext 1.0pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;mso-margin-bottom-alt:
  auto;text-align:center;line-height:24.0pt;mso-line-height-rule:exactly'><span
  style='font-size:14.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>�����ˣ����ˣ�����<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=468 colspan=5 style='width:351.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <%if (null!=record.getApplyType() && record.getApplyType().equals("10")){
  %><%=record.getApplicant()==null?"":record.getApplicant() %>
  <%} %>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;page-break-inside:avoid'>
  <td width=180 valign=top style='width:135.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>�����ˣ����˻���������֯������<span
  lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=264 colspan=3 style='width:198.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'> 
  <%if (null!=record.getApplyType() && record.getApplyType().equals("20")){
  %><%=record.getApplicant()==null?"":record.getApplicant() %>
  <%} %>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=108 style='width:81.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;mso-margin-bottom-alt:
  auto;text-align:center;line-height:24.0pt;mso-line-height-rule:exactly'><span
  style='font-size:14.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>����������</span><span lang=EN-US style='font-size:12.0pt;font-family:
  ����_GB2312;mso-hansi-font-family:����;color:black'><o:p></o:p></span></p>
  </td>
  <td width=96 style='width:72.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <%if (null!=record.getApplyType() && record.getApplyType().equals("20")){
  %><%=record.getAttr1()==null?"":record.getAttr1() %>
  <%} %>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2;page-break-inside:avoid'>
  <td width=180 rowspan=3 style='width:135.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>��ϵ��ʽ</span><span
  lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:
  ����;color:black'><o:p></o:p></span></p>
  </td>
  <td width=264 colspan=3 valign=top style='width:198.0pt;border:none;
  border-bottom:solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>��</span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>ͨ�ŵ�ַ��<span lang=EN-US><%=record.getApplyAddr()==null?"":record.getApplyAddr() %><o:p></o:p></span></span></p>
  </td>
  <td width=108 valign=top style='width:81.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;mso-margin-bottom-alt:
  auto;text-align:center;line-height:24.0pt;mso-line-height-rule:exactly'><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>��������<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=96 valign=top style='width:72.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p><%=record.getPostcode()==null?"":record.getPostcode()%></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3;page-break-inside:avoid'>
  <td width=208 colspan=2 valign=top style='width:156.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>��</span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>��ϵ�绰��<span lang=EN-US><%=record.getPhone()==null?"":record.getPhone()%><o:p></o:p></span></span></p>
  </td>
  <td width=260 colspan=3 valign=top style='width:195.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:12.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>��ϵ�ˣ�<span
  lang=EN-US>
  <%if (null!=record.getApplyType() && record.getApplyType().equals("10")){
  %><%=record.getApplicant()==null?"":record.getApplicant() %>
  <%} %>
   <%if (null!=record.getApplyType() && record.getApplyType().equals("20")){
  %><%=record.getAttr1()==null?"":record.getAttr1() %>
  <%} %>
  <o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;page-break-inside:avoid'>
  <td width=468 colspan=5 valign=top style='width:351.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>��</span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>�������䣺<span lang=EN-US><%=record.getEmail()==null?"":record.getEmail()%><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:5;page-break-inside:avoid'>
  <td width=252 colspan=2 style='width:189.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>������Ϣ����������أ�����������<span
  lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=396 colspan=4 style='width:297.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <%=record.getCompanyName()==null?"":record.getCompanyName()%>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:6;page-break-inside:avoid;height:26.05pt'>
  <td width=252 colspan=2 rowspan=2 style='width:189.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:26.05pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>�����������Ϣ<span
  lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=192 colspan=2 style='width:144.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.05pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:12.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>���ƣ�<span
  lang=EN-US><%=record.getDocName()==null?"":record.getDocName()%><o:p></o:p></span></span></p>
  </td>
  <td width=204 colspan=2 style='width:153.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.05pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:12.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>�ĺţ�<span
  lang=EN-US><%=record.getDocNum()==null?"":record.getDocNum()%><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:7;page-break-inside:avoid;height:42.1pt'>
  <td width=396 colspan=4 style='width:297.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:42.1pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:12.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>������������������<span
  lang=EN-US><%=record.getDescr()==null?"":record.getDescr()%><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:8;page-break-inside:avoid;height:27.15pt'>
  <td width=252 colspan=2 style='width:189.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:27.15pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>��ȡ������Ϣ�ķ�ʽ����ѡ��<span
  lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=396 colspan=4 style='width:297.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.15pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'>
  <span lang=EN-US style='font-size:12.0pt;font-family:
  ����;mso-ascii-font-family:����_GB2312;mso-fareast-font-family:����_GB2312;
  color:black'>
 <%if(null!=record.getPassWay() && record.getPassWay().equals("20")){%>
  	<input type="checkbox" name="passWay5" value="50" disabled="disabled" checked/>
  <% }else{ %>
  	 <input type="checkbox" name="passWay5" value="50" disabled="disabled"/>
  <%} %>
  </span><span style='font-size:12.0pt;font-family:����_GB2312;
  mso-hansi-font-family:����;color:black'>�����ʼ�<span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>
  <%if(null!=record.getPassWay() && record.getPassWay().equals("17")){%>
  	<input type="checkbox" name="passWay1" value="10" disabled="disabled" readonly="readonly" checked/>
  <% }else{ %>
  	 <input type="checkbox" name="passWay1" value="10" disabled="disabled" readonly="readonly"/>
  <%} %>
 </span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>�ʼ�<span lang=EN-US><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span
  lang=EN-US style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>
  <%if(null!=record.getPassWay() && record.getPassWay().equals("19")){%>
  	<input type="checkbox" name="passWay2" value="20" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="passWay2" value="20" disabled/>
  <%} %>
  </span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>����<br><span lang=EN-US><span
  style='mso-spacerun:yes'></span></span></span><span
  lang=EN-US style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>
  <%if(null!=record.getPassWay() && record.getPassWay().equals("21")){%>
  	<input type="checkbox" name="passWay3" value="30" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="passWay3" value="30" disabled/>
  <%} %>
  </span><span style='font-size:12.0pt;font-family:����_GB2312;
  mso-hansi-font-family:����;color:black'>������ȡ<span lang=EN-US><span style='mso-spacerun:yes'>
  </span></span></span><span lang=EN-US style='font-size:12.0pt;font-family:
  ����;mso-ascii-font-family:����_GB2312;mso-fareast-font-family:����_GB2312;
  color:black'>
 <%if(null!=record.getPassWay() && record.getPassWay().equals("18")){%>
  	<input type="checkbox" name="passWay4" value="40" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="passWay4" value="40" disabled/>
  <%} %>
  </span><span style='font-size:12.0pt;font-family:����_GB2312;
  mso-hansi-font-family:����;color:black'>�ֳ�����<span lang=EN-US><span style='mso-spacerun:yes'>&nbsp;
  </span></span></span><span lang=EN-US><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:9;page-break-inside:avoid;height:29.65pt'>
  <td width=252 colspan=2 style='width:189.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:29.65pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>������Ϣ��������ʽ����ѡ��<span
  lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=396 colspan=4 valign=top style='width:297.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.65pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312'>
  <%if(null!=record.getOfferWay() && record.getOfferWay().equals("10")){%>
  	<input type="checkbox" name="offerWay1" value="10" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="offerWay1" value="10" disabled/>
  <%} %>
  </span><span style='font-size:12.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����'>�����ʼ�<span style='color:red'> </span><span
  style='color:black'><span style='mso-spacerun:yes'>&nbsp;</span></span></span><span
  lang=EN-US style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>
   <%if(null!=record.getOfferWay() && record.getOfferWay().equals("20")){%>
  	<input type="checkbox" name="offerWay2" value="20" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="offerWay2" value="20" disabled/>
  <%} %>
  </span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>ֽ���ı�<span lang=EN-US><span style='mso-spacerun:yes'>&nbsp;
  </span><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:10;page-break-inside:avoid;height:28.1pt'>
  <td width=252 colspan=2 style='width:189.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>����������Ϣ����;<span
  lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=396 colspan=4 valign=top style='width:297.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
  <p class=MsoNormal style='line-height:24.0pt;mso-line-height-rule:exactly'><span
  lang=EN-US style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>
   <%if(null!=record.getAttr3() && (((record.getAttr3()+" ").split("10")).length-1)!=0){%>
  	<input type="checkbox" name="attr31" value="10" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="attr31" value="10" disabled/>
  <%} %>
  </span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>��������Ҫ<span lang=EN-US><span style='mso-spacerun:yes'>&nbsp;
  </span></span></span><span lang=EN-US style='font-size:12.0pt;font-family:
  ����;mso-ascii-font-family:����_GB2312;mso-fareast-font-family:����_GB2312;
  color:black'>
   <%
   if(null!=record.getAttr3() && (((record.getAttr3()+" ").split("20")).length-1)!=0){%>
  	<input type="checkbox" name="attr32" value="20" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="attr32" value="20" disabled/>
  <%} %>
  </span><span style='font-size:12.0pt;font-family:����_GB2312;
  mso-hansi-font-family:����;color:black'>�������Ҫ <br></span><span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>
   <%if(null!=record.getAttr3() && (((record.getAttr3()+" ").split("30")).length-1)!=0){%>
  	<input type="checkbox" name="attr33" value="30" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="attr33" value="30" disabled/>
  <%} %>
  </span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>���е���Ҫ</span><span lang=EN-US
  style='font-size:12.0pt;font-family:����;mso-ascii-font-family:����_GB2312;
  mso-fareast-font-family:����_GB2312;color:black'>&nbsp;
    <%if(null!=record.getAttr3() && (((record.getAttr3()+" ").split("40")).length-1)!=0){%>
  	<input type="checkbox" name="attr34" value="40" disabled checked/>
  <% }else{ %>
  	 <input type="checkbox" name="attr34" value="40" disabled/>
  <%} %>
  </span><span
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'>����������Ϣ<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:11;page-break-inside:avoid;height:53.15pt'>
  <td width=252 colspan=2 style='width:189.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:53.15pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>�ر���������������������շѣ���Ҫ����</span><span
  lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:
  ����;color:black'><o:p></o:p></span></p>
  </td>
  <td width=396 colspan=4 valign=top style='width:297.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:53.15pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:12.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����'>�����ʼ���ʽ�ݲ��շ�<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:12;mso-yfti-lastrow:yes;page-break-inside:avoid;
  height:30.6pt'>
  <td width=180 style='width:135.0pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:30.6pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>������ǩ�������£�</span><span
  lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:
  ����;color:black'><o:p></o:p></span></p>
  </td>
  <td width=264 colspan=3 style='width:198.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'> 
 &nbsp;
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p></o:p></span></p>
  </td>
  <td width=108 style='width:81.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.6pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span style='font-size:14.0pt;
  font-family:����_GB2312;mso-hansi-font-family:����;color:black'>����ʱ�䣺</span><span
  lang=EN-US style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:
  ����;color:black'><o:p></o:p></span></p>
  </td>
  <td width=96 style='width:72.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.6pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
  line-height:24.0pt;mso-line-height-rule:exactly'><span lang=EN-US
  style='font-size:12.0pt;font-family:����_GB2312;mso-hansi-font-family:����;
  color:black'><o:p>
  <%
  	DateFormat df= new SimpleDateFormat("yyyy-MM-dd");
  	String startTime = "";
  	if(null!=record.getStartTime()){
  	 startTime = df.format(record.getStartTime());
  	}
	
  %><%=startTime==null?"":startTime%></o:p></span></p>
  </td>
 </tr>
 <![if !supportMisalignedColumns]>
 <tr height=0>
  <td width=180 style='border:none'></td>
  <td width=72 style='border:none'></td>
  <td width=136 style='border:none'></td>
  <td width=56 style='border:none'></td>
  <td width=108 style='border:none'></td>
  <td width=96 style='border:none'></td>
 </tr>
 <![endif]>
</table>

<p class=MsoNormal><span lang=EN-US style='mso-bidi-font-size:10.5pt;
font-family:����'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='mso-bidi-font-size:10.5pt;font-family:����'>ʹ��ָ�ϣ�<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
lang=EN-US style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>1</span><span
style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>�����ı������ڹ��񡢷��˻���������֯���ݡ��л����񹲺͹�������Ϣ������������ʮ�������ڶ�ʮ�����ڶ�ʮ������һ��ڶ�ʮ������һ��Ĺ涨��������Ϣ����������������������Ϊ��</span></p>

<p class=MsoNormal style='text-indent:21.0pt;mso-char-indent-count:2.0'><span
lang=EN-US style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>2</span><span
style='mso-bidi-font-size:10.5pt;font-family:����_GB2312'>�����񡢷��˻���������֯���������������ṩ����������ص�˰�ѽ��ɡ���ᱣ�ϡ�ҽ��������������Ϣ�ģ�Ӧ����ʾ��Ч���֤������֤���ļ���<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal><span lang=EN-US style='mso-bidi-font-size:10.5pt;
font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='mso-bidi-font-size:10.5pt;
font-family:����_GB2312'><o:p>&nbsp;</o:p></span></p>

<p class=MsoTitle><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoTitle><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>
</html>
 
