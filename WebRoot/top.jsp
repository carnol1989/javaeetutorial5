<%@ page language="java" import="java.util.*,java.lang.*,com.baosight.mode.TbUser,com.baosight.mode.TbUserdept"
	pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	String path = request.getContextPath();
    TbUser user=(TbUser)session.getAttribute("SYSTEM_USER_SESSION");
    System.out.println("top:"+user.getName());
    System.out.println("top:"+user.getUserAcc());
    String isfx = (String)request.getParameter("ISFXZHB");
    String commedName = request.getParameter("commedName");
 %>
<head>
	<script type="text/javascript">
function getXMLHTTPObj(){
	var xmlHttp = null;
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}else{
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	}
	return xmlHttp;
}

function logoutForums() {
	try{
		xmlHttp = getXMLHTTPObj();
		if( xmlHttp ){
			var url = "/JForum/user/logout.page";
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = new function(){};
			xmlHttp.send(null);
		}
	}catch (e){
	}
}

	function logout(){
		logoutForums();
		var path = document.getElementById("path").value;
		var loginType = document.getElementById("loginType").value;
		var url = path + "/loginoutAction.do?loginType="+loginType;
		window.open(url,"_self");
	}
function initMessage(){
	try{
		xmlHttp = getXMLHTTPObj();
		if( xmlHttp ){
			var url = "<%=path%>/messages.do?method=messageLogin";
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = doSetMessage;
			xmlHttp.send(null);
		}
	}catch (e){
	}
}
function doSetMessage(){
	if (xmlHttp.readyState == 4){
		var re = xmlHttp.responseText;
		//alert(re);
		if(re!="" && re.indexOf("</a>")<0){
			openMessage(re);
		}else if(re!=""){
			document.getElementById("newMessage").innerHTML = "�����µ���Ϣ��"+re;
		}
	}
}
function openMessage(mid){
	window.open ('<%=path%>/messages.do?method=lookupMessages&id='+mid+'&source=receivers&forwardFlag=messagelogin', '����Ϣ', 'height=240, width=400, top=100, left=100, toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
}
function modPassWord() {
	var pop = window.open ('<%=path%>/userpwdaction.do?method=passwdModReq','newwindow', 'left=0,height=160, width=360, top=100, left=100, toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
	//pop.moveTo((screen.width-360)/2,(screen.height-160)/2);
}
	</script>
	<!-- gclʵ�ֲ˵��л� -->
	<script type="text/javascript">
		function changeMenu(type){
			switch(type){
				case 'index':{
					document.getElementById('index').style.display="block";
					document.getElementById('zwzl').style.display="none";
					document.getElementById('fxzl').style.display="none";
					document.getElementById('szyzl').style.display="none";
					document.getElementById('bg').background="<%=path %>/images/top/center.png";
					break;
				}
				case 'zwzl':{
					document.getElementById('index').style.display="none";
					document.getElementById('zwzl').style.display="block";
					document.getElementById('fxzl').style.display="none";
					document.getElementById('szyzl').style.display="none";
					document.getElementById('bg').background="<%=path %>/images/top/center_zw.png";
					break;
				}
				case 'fxzl':{
					document.getElementById('index').style.display="none";
					document.getElementById('zwzl').style.display="none";
					document.getElementById('fxzl').style.display="block";
					document.getElementById('szyzl').style.display="none";
					document.getElementById('bg').background="<%=path %>/images/top/center_fx.png";
					break;
				}
				case 'szyzl':{
					document.getElementById('index').style.display="none";
					document.getElementById('zwzl').style.display="none";
					document.getElementById('fxzl').style.display="none";
					document.getElementById('szyzl').style.display="block";
					document.getElementById('bg').background="<%=path %>/images/top/center_szy.png";
					break;
				}
				default:{
					document.getElementById('index').style.display="block";
					document.getElementById('zwzl').style.display="none";
					document.getElementById('fxzl').style.display="none";
					document.getElementById('szyzl').style.display="none";
					document.getElementById('bg').background="<%=path %>/images/top/center.png";
					break;
				}
			}
			
		}
	</script>
	
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�Ϻ�ˮ��</title>
<link href="css/index-css.css;css/style1.css" rel="stylesheet"
		type="text/css">
		
				<style>
*{font-size:12px}
.dragTable{
    font-size:12px;
    border-top:1px solid #3366cc;
    margin-bottom: 10px;
    width:100%;
    background-color:#FFFFFF;
}
.dragTR{
    cursor:move;
    color:#7787cc;
   
}

#parentTable{
    border-collapse:collapse;
    letter-spacing:25px;
}
.tabl_atab{
	font-family: "����";
	font-size: 12px;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	text-decoration: none;
	color: #2f475f;
	background-image: url(imagine/xx_tab1.gif);
	
	background-repeat:no-repeat;	
}
.tabl_atabno{
	font-family: "����";
	font-size: 12px;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	text-decoration: none;
	color: #8a95a1;
	
}
.tab2_atab{
	font-family: "����";
	font-size: 12px;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	text-decoration: none;
	color: #2f475f;
	
	background-image: url(imagine/xx_tab2.gif);
	background-repeat: no-repeat;
}
.tab2_atabno{
	font-family: "����";
	font-size: 12px;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	text-decoration: none;
	color: #8a95a1;
	
}
.tab3_atab{
	font-family: "����";
	font-size: 12px;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	text-decoration: none;
	color: #2f475f;
	
	background-image: url(imagine/xx_tab3.gif);
	background-repeat: no-repeat;
	
}
.tab3_atabno{
	font-family: "����";
	font-size: 12px;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	text-decoration: none;
	color: #8a95a1;
	
	background-image: url(xx_tab3a.gif);
	background-repeat: no-repeat;
	
}

</style>

</head>
<%String pic="logo_sw.png";
String isShow=isfx;
if(isfx.equals("true")!=true){
	if("b205f4e34f4f4d2da5bd89e2e10af37a".equals(user.getUserdept())){
		pic="logo_sw.png";
	}else if("f410b42455464f8487ee4f86da49b571".equals(user.getUserdept())){
		pic="logo_slzx.png";
	}else if("ae5532af92f8488994fb632c62423759".equals(user.getUserdept())){
		pic="logo_swfx.png";
	}
}else{
	pic="logo_fx.png";
}

 %>
<script type="text/javascript">
var sw="b205f4e34f4f4d2da5bd89e2e10af37a";
var userDept="<%=user.getUserdept()%>";
function init(){
	if(<%=isShow%>!=true){
		if(userDept==sw){
			document.getElementById('index').style.display="block";
			document.getElementById('fxzl').style.display="none";
			document.getElementById('bg').background="<%=path %>/images/top/center.png";
		}
		else{
			document.getElementById('index').style.display="block";
			document.getElementById('fxzl').style.display="none";
			document.getElementById('bg').background="<%=path %>/images/top/center.png";
		}
	}else{
			document.getElementById('index').style.display="none";
			document.getElementById('fxzl').style.display="block";
			document.getElementById('bg').background="<%=path %>/images/top/center_fx.png";
	}
}
function showMenu(){
	document.getElementById('menu').style.display="block";
	document.getElementById('bgRight').background="<%=path %>/images/top/top_c.png";
}
function hideMenu(){
	document.getElementById('menu').style.display="none";
	document.getElementById('bgRight').background="<%=path %>/images/top/top_r.png";
}

</script>

<body leftmargin="0" topmargin="0" onload="init();">
    <input type="hidden" id="loginUser" value="<%=((TbUser) session.getAttribute("SYSTEM_USER_SESSION")).getUserAcc()%>"/>
	<input type="hidden" id="password" value="<%=((TbUser) session.getAttribute("SYSTEM_USER_SESSION")).getPwd()%>"/>
	<input type="hidden" id="path" value="<%=request.getContextPath() %>"/>
	<input type="hidden" id="loginType" value="<%=session.getAttribute("loginType") %>"/>
 <table width="1014" border="0" cellpadding="0" cellspacing="0"
			bgcolor="#FFFFFF" align="center">
			<tr>
				<td valign="top" height="140">
					<table width="1000" border="0" cellpadding="0" cellspacing="0" bordercolor="#0000FF">
  <tr>
    <td height="140"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="27" background="<%=path %>/images/top/top.png"><table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="820" height="27"><table width="820" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8" height="27">&nbsp;</td>
                <td width="75" valign="middle"><img src="<%=path %>/images/top/point.png" width="7" height="5" />&nbsp;<a href="http://www.shanghai.gov.cn" target="_Blank">�й��Ϻ�</a></td>
                <td width="88" valign="middle"><img src="<%=path %>/images/top/point.png" width="7" height="5" />&nbsp;<a href="#" target="_Blank">ˮ������վ</a></td>
                <td width="88" valign="middle"><img src="<%=path %>/images/top/point.png" width="7" height="5" />&nbsp;<a href="#" target="_Blank">���貿��վ</a></td>
                <td width="75" valign="middle"><img src="<%=path %>/images/top/point.png" width="7" height="5" />&nbsp;<a href="http://www.shanghaiwater.gov.cn:7300/web/homepage/index.jsp" target="_Blank">ˮ����վ</a></td>
                <td width="484" valign="middle" onmouseover="showMenu();" onmouseout="hideMenu();" onmousemove="showMenu();"><table width="484" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="4" height="18" background="<%=path %>/images/top/top_l.png"></td>
                    <td width="70" valign="middle" align="center" background="<%=path %>/images/top/top_c.png" >
                   		 <font color="#c14721">���Ի�����</font>
                    </td>
                    <td width="16" align="left" valign="middle" background="<%=path %>/images/top/top_c.png"><img src="<%=path %>/images/top/arrow.gif" width="14" height="11" /></td>
                    <td id="bgRight" width="5" background="<%=path %>/images/top/top_r.png"></td>
                    <td width="389" >
                    	<table id="menu" style="display:none" width="389" border="0" cellspacing="0" cellpadding="0" >
                    		<tr height="18">
                    		<td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/index.jsp" class="topmenu" onmouseover="changeMenu('index');" >�Ż���ҳ</td>
	                        <td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/zwzl/zwzl.jsp" class="topmenu" onmouseover="changeMenu('zwzl');">����ר��</a></td>
	                        <td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/fxzl/fxzl.jsp" class="topmenu" onmouseover="changeMenu('fxzl');">��Ѵר��</a></td>
	                        <td width="74" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/szyzl/szyzl.jsp" class="topmenu" onmouseover="changeMenu('szyzl');">ˮ��Դר��</a></td>
	                        <td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="#" class="topmenu">����ר��</a></td>
	                        <td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="http://31.16.1.74/website/shsw_webgis/viewer.htm" class="topmenu" target="_Blank">���ֵ�ͼ</a></td>
                    		<td width="5" background="<%=path %>/images/top/top_r.png"></td>
                    		</tr>
                    	</table>
                    </td>
                    </tr>
                   </table>
                 </td>
                <td width="5" align="center"></td>
              </tr>
            </table></td>
            <td><table width="180" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="90">
                    <input name="textfield" type="text" class="search" id="textfield" />                </td>
                <td valign="bottom">&nbsp;<img src="<%=path %>/images/top/search.png" width="73" height="17" onmouseover="this.style.cursor='hand'" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="89"><table width="1014" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="235" height="89" background="<%=path %>/images/top/<%=pic %>">&nbsp;</td>
            <td width="655"><table width="655" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="6" background="<%=path %>/images/top/top_m.png"></td>
              </tr>
              <tr>
                <td height="76" id="bg" background="<%=path %>/images/top/center.png" align="center">
                
                 <!-- �Ż���ҳ -->
                <table id="index"  style="display:block" width="600" border="0" cellpadding="0"
													cellspacing="0" >
													<tr  >
														<td width="60"  align="left" class="top_infor">
															<a class="toptablemeun"
																href="<%=path %>/index.jsp"
																target="_blank">&nbsp;&nbsp;�Ż���ҳ</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun"
																href="http://www.shanghaiwater.gov.cn/web/wsbsdefault.jsp"
																target="_blank">���ϰ���</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun"
																href="<%=path %>/infopubContentaction.do?method=fxdt_more&name=��Ѵ��̬&code=fxdt"
																target="_blank">��Ѵ��̬</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="http://31.16.1.7/fx/qxxx/default.jsp?id=6" target="_blank">������Ϣ</a>

														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun" href="http://31.16.1.41"
																target="_blank">ˮ����Ϣ </a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=szydt_more&name=ˮ��Դ��̬&code=szydt" target="_blank">ˮ��Դ��̬</a>
															
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun"
																href="http://31.16.1.138:7001/oademo/CAsoft.zip"
																target="_blank">������</a>
														</td>
														</tr><tr>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��������&code=xwzx" target="_blank">&nbsp;&nbsp;ˮ������</a>
														</td>
													<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left"> 
															<a class="toptablemeun"
																href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=��Ϣ����&code=xxgk"
																target="_blank">��Ϣ����</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun"
																href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=���ض�̬&code=qxdt"
																target="_blank">���ض�̬ </a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun"
																href="#"
																target="_blank">������Ϣ</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun"
																href="#"
																target="_blank">������Ϣ</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="62" class="top_infor" align="left">
															<a class="toptablemeun"
																href="#"
																target="_blank">ˮ��Դ���</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="#" target="_blank">��ѵ�ֲ�</a>
															
														</td>
														</tr><tr>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun"
																href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ�����&code=watersituation"
																target="_blank">&nbsp;&nbsp;ˮ�����</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=��վ��̬&code=wzdt"
																target="_blank">��վ��̬</a>
														</td>
													<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun"
																href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=Ѵ��ͨ��&code=xqtg"
																target="_blank">Ѵ��ͨ��</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="#"
																target="_blank">������Ϣ</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="#"
																target="_blank">������Ϣ </a>
														</td>
													<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun" href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=ˮ��ԴԤ��&code=szyyj"
																target="_blank">ˮ��ԴԤ��</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="#" target="_blank"></a>
															
														</td>
														</tr><tr>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��̬&code=swdt" target="_blank">&nbsp;&nbsp;ˮ��̬ </a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun" href="#" target="_blank">��Ϣ����̬</a>



															
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="64" class="top_infor" align="left">
															<a class="toptablemeun"
																href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��ͨ��&code=sqtb"
																target="_blank">ˮ��ͨ��</a>
														</td>
													<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left"> 
															<a class="toptablemeun"
																href="http://31.16.1.74/website/taifeng/viewer.htm"
																target="_blank">̨��·��</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left"> 
															<a class="toptablemeun"
																href="http://31.16.1.7/zqkb.jsp"
																target="_blank">������Ϣ</a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="60" class="top_infor" align="left">
															<a class="toptablemeun"
																href="#"
																target="_blank">ˮ��Դ���� </a>
														</td>
														<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
														<td width="54" class="top_infor" align="left">
															<a class="toptablemeun" href="#" target="_blank"></a>
															
														</td>
													</tr>

												</table>
                			<!-- ����ר�� -->
                 <table id="zwzl"  style="display:none" width="500" border="0" cellpadding="0" cellspacing="0" >
                                <tr> 
                                  <td  width="63" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��������&code=xwzx" target="_blank">ˮ������</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td  width="88" class="top_infor"><a class="toptablemeun" href="http://www.shanghaiwater.gov.cn/web/wsbsdefault.jsp" target="_blank">���ϰ���</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td  width="75" class="top_infor"><a class="toptablemeun" href="#" target="_blank">��Ϣ����̬</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td  width="92" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=fxdt_more&name=��Ѵ��̬&code=fxdt" target="_blank">��Ѵ��̬</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td  width="88" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ʷ־���&code=sznj" target="_blank">ʷ־���</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td width="68" class="top_infor"><a class="toptablemeun" href="#" target="_blank">�����з�</a></td>
                                  
                                </tr>
                                <tr> 
                                  <td  class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ�����&code=watersituation" target="_blank">ˮ�����</a></td>
                                 <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=��Ϣ����&code=xxgk" target="_blank">��Ϣ����</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��Դ��̬&code=szydt" target="_blank">ˮ��Դ��̬</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path%>/infopubContentaction.do?method=wzdt_more&name=Ѵ��ͨ��&code=xqtg" target="_blank">Ѵ��ͨ��</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=���¼�&code=dsj" target="_blank">���¼�</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��ʾ&code=gongshi" target="_blank">��ʾ</a></td>
                                  
                                </tr>
                                <tr> 
                                  <td  class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��̬&code=swdt" target="_blank">ˮ��̬</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��վ��̬&code=wzdt" target="_blank">��վ��̬</a></td>
                                 <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��Դ����&code=szygb" target="_blank">ˮ��Դ����</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��ͨ��&code=sqtb" target="_blank">ˮ��ͨ��</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ����־&code=swzz" target="_blank">ˮ����־</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=���ɷ���&code=law" target="_blank">���ɷ���</a></td>
                             </tr>
                            
                              </table>
                <!-- ��Ѵר�� -->
                	<table id="fxzl"  style="display:none" width="500" border="0" cellpadding="0"
																		cellspacing="0">
																		<tr>
																		<td width="55" nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.7/fx/news/list_ssxw.jsp"
																					target="_blank">��Ѵ��̬</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="54" nowrap class="top_infor">
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��Ҫ�ļ�&code=zywj"
																					target="_blank">��Ҫ�ļ�</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="55" nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.7/fx/qxxx/default.jsp?id=6"
																					target="_blank">���󱨸�</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="54" nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.41/"
																					target="_blank">ˮ����Ϣ</a>
																			</td>
																		<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="54" nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.7/fx/yuan/yuan.jsp"
																					target="_blank" onClick="">Ӧ��Ԥ��</a>
																			</td>
														</tr><tr>
																			<td width="54" nowrap class="top_infor">
																				
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=Ѵ��ͨ��&code=xqtg"
																					target="_blank">Ѵ��ͨ��</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="54" nowrap class="top_infor">
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=���ط�Ѵ&code=gdfx" 
																				target="_blank">���ط�Ѵ</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="54" nowrap class="top_infor">
																				<a class="toptablemeun" href="#" 
																				target="_blank">������Ϣ</a>
																			</td>
															
																			

																										<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																		<td width="53" nowrap class="top_infor">
																				<a class="toptablemeun" href="#" target="_blank">������Ϣ</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="53" nowrap class="top_infor">
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��Ѵ֪ʶ&code=fxzs"
																					target="_blank">��Ѵ֪ʶ</a>
																			</td>
														</tr><tr>
																			<td width="55" nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.41/"
																					target="_blank">ˮ����Ϣ</a>
																				
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td nowrap class="top_infor">
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��������&code=jljw"
																					target="_blank">��������</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="55" nowrap class="top_infor">
																				<a class="toptablemeun" href="#"
																					target="_blank">������Ϣ</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td nowrap class="top_infor">
																				<a class="toptablemeun" href="#"
																					target="_blank">������Ϣ</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.7/fx/zcfg//fxlc.jsp"
																					target="_blank">��Ѵ����</a>
																			</td>
															</tr><tr>
																			<td nowrap class="top_infor">
																					<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=���ض�̬&code=qxdt"
																					target="_blank">���ض�̬</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td nowrap class="top_infor">
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=�ش�&code=zdhd"
																					target="_blank">�ش�</a>
																			</td>
																		<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td nowrap class="top_infor">
																				<a class="toptablemeun"  href="http://31.16.1.74/website/taifeng/"
																					target="_blank">̨��·��</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="53" nowrap class="top_infor">
																				<a class="toptablemeun" href="http://31.16.1.7/zqkb.jsp"
																					target="_blank">������Ϣ</a>
																			</td>
																			<td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
																			<td width="53" nowrap class="top_infor">
																				<a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=���߷���&code=law"
																				target="_blank">���߷���</a>
																			</td>


																		</tr>
																		
																	</table>
							<!--ˮ��Դר�� -->
                		<table id="szyzl"  style="display:none" width="600" border="0" cellpadding="0" cellspacing="0">
                                <tr> 
                                  <td width="65" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��Դ��̬&code=szydt" target="_blank">ˮ��Դ��̬</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td width="66" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=����ԭˮ&code=cjys" target="_blank">����ԭˮ</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td width="59" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��ѹ��&code=scyl" target="_blank">ˮ��ѹ��</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td width="73" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=�Ǹɺӵ�ˮ��&code=gghdsz" target="_blank">�Ǹɺӵ�ˮ��</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td width="78" class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=������������&code=yljcpj" target="_blank">������������</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td width="119" class="top_infor"><a class="toptablemeun" href="#">������Ϣƽ̨</a></td>
                                  
                                </tr>
                                <tr> 
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��ԴԤ��&code=szyyj" target="_blank">ˮ��ԴԤ��</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=���ֽ�ԭˮ&code=hpjys" target="_blank">���ֽ�ԭˮ</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=��վѹ��&code=bzyl" target="_blank">��վѹ��</a></td>
                                 <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ���������&code=sgnqdb" target="_blank">ˮ���������</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮλ��������&code=swlypj" target="_blank">ˮλ��������</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��Դͳ�Ʊ���&code=syztjbb" target="_blank">ˮ��Դͳ�Ʊ���</a></td>
                                  
                                </tr>
                                <tr> 
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ��Դ����&code=szygb" target="_blank">ˮ��Դ����</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=������ˮ&code=syls" target="_blank">������ˮ</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=����ѹ��&code=gwyl" target="_blank">����ѹ��</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ������&code=szqs" target="_blank">ˮ������</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															|
														</td>
                                  <td class="top_infor"><a class="toptablemeun" href="<%=path %>/infopubContentaction.do?method=wzdt_more&name=ˮ����������&code=sllypj" target="_blank">ˮ����������</a></td>
                                  <td width="11" align="center" class="top_infor" style="color: #fff">
															
														</td>
                                  <td class="top_infor"></td>
                                </tr>
							  </table>
                					
                
                
                
                
                
                
                
                </td>
              </tr>
              <tr>
                <td height="7" background="<%=path %>/images/top/top_b.png">
                </td>
              </tr>
            </table></td>
            <td width="124" height="76" valign="middle" align="right" background="<%=path %>/images/top/right.png">
            <jsp:include flush="true" page="imagine/clock6.htm"></jsp:include>
            </td>
            </tr>
            </table>
        </td>
      </tr>
      <tr>
        <td height="24" valign="bottom"  background="<%=path %>/images/top/bottom_sy3.png">
 <table width="1014" border="0" cellspacing="0" cellpadding="0">
        <tr><td height="1" bgcolor="#dcdcdc"></td></tr>
          <tr>
            <td height="24" background="">
            <table width="100%" class="b" align="left" height="23"
							cellpadding="0" cellspacing="0">
							
							<tr>
								<td width="480" class="b">
									<table width="1000" class="b" align="left" height="23"
										cellpadding="0" cellspacing="0" >
												
													<tr>
														<td width="300" class="xb" nowrap="nowrap" align="center">
														��ӭ�� 
										<%
											if (commedName == null || "null".equals(commedName)) {%>
											<%=((TbUser) session.getAttribute("SYSTEM_USER_SESSION")).getName()%>
											<%}
											else {%><%=commedName+" ��"+((TbUser) session.getAttribute("SYSTEM_USER_SESSION")).getName()+"ί��"%><%}
										 %>
										 &nbsp;&nbsp;
										 <span onclick="javascript:modPassWord();" style="color:red" onmouseover="this.style.cursor='hand'">�޸�����</span>
										 &nbsp;&nbsp;
										 <a href="right.jsp" target="rightFrame" class="topmenu">���ص���ҳ��</a>
														</td>
														<td colspan="2" >
												<marquee behavior="scroll" direction="left" scrollamount="3"
													style="font-size: 12px;color: 2c6b9e;"
													onMouseOver="this.stop();" onMouseOut="this.start();">
													<span id="newMessage"></span>
												</marquee>
											</td>
									
														<td width="36" >
															<a href="#"><img src="images/tc.gif" width="50" height="19" onclick="logout();" border="0" onmouseover="this.style.cursor='hand'"></a>&nbsp;
														</td>
													</tr>
									
											
					
					</table></td></table>
						
						</td>
        </tr>
    </table></td>
  </tr>
</table>
					
					
					
					</td></tr></table>


</body>
<script>
initMessage();
</script>
</html>
