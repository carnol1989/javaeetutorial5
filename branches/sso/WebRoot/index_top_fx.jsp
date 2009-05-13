<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>
<%
 	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/"; 				
	String loginFlag = (request.getAttribute("loginFlag") != null) ? ((String) request.getAttribute("loginFlag")):("");
 	String url=request.getServletPath();
 %>

<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/caAuth.js'></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/ext/resources/css/ext-all.css" />
<script type="text/javascript" src="<%=path%>/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path%>/ext/ext-all.js"></script>
<script type="text/javascript">
function keyLogin(){
	var keyPassword = document.getElementById("keyPassword").value;
	if(!keyPassword || keyPassword=="null"){
		Ext.MessageBox.prompt("������ʾ��","������key����:",function(button,text){
			if(button=="ok"){
				keySubmit(text);
			}
		});
	}else{
		keySubmit(keyPassword);
	}
	//location.href="login.do?ca=true&cert="+parseInt(certId,16);
}
function keySubmit(keyPassword){
	if(!keyPassword || keyPassword=="null"){
		return false;
	}
	SafeEngineCtl.SEH_InitialSession(9,"com1", keyPassword, 0, 2, "", "");
	if(SafeEngineCtl.ErrorCode!=0){
		if((""+SafeEngineCtl.ErrorCode).match(/7069/)){
			var p = document.getElementById("keyPassword").value;
			if(p!="" && p!="null"){
				document.getElementById("keyPassword").value = "";
				keyLogin();
			}else{
				alert("�������");
			}
		}else{
			alert("�����key��");
		}
		SafeEngineCtl.SEH_ClearSession();
		return false;
	}
	var strCert = SafeEngineCtl.SEH_GetSelfCertificate(9, "com1", keyPassword);
	if(SafeEngineCtl.ErrorCode!=0){
		alert("SEH_GetSelfCertificate Error. Return:" + SafeEngineCtl.ErrorCode);
		SafeEngineCtl.SEH_ClearSession();
		return false;
	}
	var certId = SafeEngineCtl.SEH_GetCertDetail(strCert,2);
	if(SafeEngineCtl.ErrorCode!=0){
		alert("SEH_GetCertDetail Error. Return:" + SafeEngineCtl.ErrorCode);
		SafeEngineCtl.SEH_ClearSession();
		return false;
	}
	var frm = document.forms[0];
	frm.ca.value="true";
	frm.cert.value=""+parseInt(certId,16);
	frm.keyPassword.value = keyPassword;
	frm.submit();
}
</script>
<SCRIPT LANGUAGE="JavaScript">
var thisHref = location.href;
var httpsType = thisHref.split(":")[0];
var httpsIp = thisHref.split(":")[1].split("/")[2];
/**
var hasRangs = false;
for(var i=1;i<100;i++){
	try{
		var WshShell = new ActiveXObject("WScript.Shell");
		var s="HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range"+i+"\\:Range";
		var sNic = WshShell.RegRead(s); 
		if (sNic == httpsIp) {
			hasRangs = true;
			break;
		}
	}catch(e){
		break;
	}
}
*/
//alert(hasRangs);
//if (!hasRangs) {
	//�������վ��ip
//	WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range"+i+"\\", "");
//	WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range"+i+"\\"+httpsType, "2", "REG_DWORD");
//	WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range"+i+"\\:Range", httpsIp);
//}
</SCRIPT>
		<script language="JavaScript">
		function js_page(htmlurl) {
		  var newwin=window.open(htmlurl,"_blank","toolbar=no,location=no,directories=no,status=no,menubar=no,left=0,top=0,scrollbars=yes,resizable=no,width=1020,height=712");
		  newwin.focus();
		  return false;
		  }
		</script>
		<script language="JavaScript">
		function js_page_gongzhong(htmlurl) {
		  var newwin1=window.open(htmlurl,"_blank","toolbar=no,location=no,directories=no,status=no,menubar=no,left=0,top=0,scrollbars=yes,resizable=no,width=1020,height=712");
		  newwin1.focus();
		  return false;  
		}
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

		function loginin(loginUrl) {
			try{
				xmlHttp = getXMLHTTPObj();
				if( xmlHttp ){
					xmlHttp.open("GET", loginUrl, true);
					xmlHttp.onreadystatechange = new function(){};
					xmlHttp.send(null);
				}
			}catch (e){
			}
		}
		function submit1(){
			var loginUser = document.getElementById("loginUser").value;
			var password = document.getElementById("password").value;
			if(loginUser==""){
				alert("�û�������Ϊ��");
				document.getElementById("loginUser").focus();
				return false;
			}
			if(password==""){
				alert("���벻��Ϊ��");
				document.getElementById("password").focus();
				return false;
			}	
			var frm = document.forms[0];
			var goto = document.getElementById("goto").value;
			frm.action = frm.action+"?goto="+goto;
			var loginUrl = "<%=basePath%>login.do?loginUser="+loginUser+"&password="+password;
			//loginin(loginUrl);
			frm.submit();
		}
	</script>
	<SCRIPT LANGUAGE="JavaScript">   
		if   (top.frames.length!=0)   top.location=self.document.location;   
	</SCRIPT>

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
	background-image: url(<%=path%>/imagine/xx_tab1.gif);
	
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
	
	background-image: url(<%=path%>/imagine/xx_tab2.gif);
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
	
	background-image: url(<%=path%>/imagine/xx_tab3.gif);
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
	
	background-image: url(<%=path%>/imagine/xx_tab3a.gif);
	background-repeat: no-repeat;
	
}
</style>
<script language="JavaScript">
function submit1(){
	var loginUser = document.getElementById("loginUser").value;
	var password = document.getElementById("password").value;
	if(loginUser==""){
		alert("�û�������Ϊ��");
		document.getElementById("loginUser").focus();
		return false;
	}
	if(password==""){
		alert("���벻��Ϊ��");
		document.getElementById("password").focus();
		return false;
	}	
	var frm = document.forms[0];
	frm.submit();
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
		
function initMenu(){
	var menuCtl;
	var menuUrl="<%=url%>";
	if(menuUrl.indexOf('index')>0){
		document.getElementById('index').style.display="block";
		document.getElementById('zwzl').style.display="none";
		document.getElementById('fxzl').style.display="none";
		document.getElementById('szyzl').style.display="none";
		document.getElementById('bg').background="<%=path %>/images/top/center.png";
	}
	else if(menuUrl.indexOf('zwzl')>0){
		document.getElementById('index').style.display="none";
		document.getElementById('zwzl').style.display="block";
		document.getElementById('fxzl').style.display="none";
		document.getElementById('szyzl').style.display="none";
		document.getElementById('bg').background="<%=path %>/images/top/center_zw.png";
	}
	else if(menuUrl.indexOf('fxzl')>0){
		document.getElementById('index').style.display="none";
		document.getElementById('zwzl').style.display="none";
		document.getElementById('fxzl').style.display="block";
		document.getElementById('szyzl').style.display="none";
		document.getElementById('bg').background="<%=path %>/images/top/center_fx.png";
	}
	else if(menuUrl.indexOf('szyzl')>0){
		document.getElementById('index').style.display="none";
		document.getElementById('zwzl').style.display="none";
		document.getElementById('fxzl').style.display="none";
		document.getElementById('szyzl').style.display="block";
		document.getElementById('bg').background="<%=path %>/images/top/center_szy.png";
	}
	else{
		document.getElementById('index').style.display="block";
		document.getElementById('zwzl').style.display="none";
		document.getElementById('fxzl').style.display="none";
		document.getElementById('szyzl').style.display="none";
		document.getElementById('bg').background="<%=path %>/images/top/center.png";
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
<body onload="initMenu();">
<form name="form1" action="<%=path%>/login.do" method="post">
		<input type="hidden" name="ca" value="false">
		<input type="hidden" name="cert">
		<input type="hidden" name="keyPassword" value="${keyPassword}">
<table width="1000" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="b8b8b8" class="tableborder">
				<tr>
					<td width="1000" height="101" align="center" valign="top"
						background="<%=path %>/imagine/banner_xx.gif">
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
                <td width="484" valign="middle" height="18" onmouseover="showMenu();" onmouseout="hideMenu();" onmousemove="showMenu();" ><table  width="484" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="4" height="18" background="<%=path %>/images/top/top_l.png"></td>
                    <td width="70" valign="middle" align="center" background="<%=path %>/images/top/top_c.png" >
                   		 <font color="#c14721" >���Ի�����</font>
                    </td>
                    <td width="16" align="left" valign="middle" background="<%=path %>/images/top/top_c.png"><img src="<%=path %>/images/top/arrow.gif" width="14" height="11" /></td>
                    <td id="bgRight" width="5" background="<%=path %>/images/top/top_r.png"></td>
                    <td width="389">
                    	<table id="menu" style="display:none" height="18" width="389" border="0" cellspacing="0" cellpadding="0" >
                    		<tr >
                    		<td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/index_fx.jsp" class="topmenu" onmouseover="changeMenu('index');">�Ż���ҳ</a></td>
	                        <td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/zwzl/zwzl_fx.jsp" class="topmenu" onmouseover="changeMenu('zwzl');">����ר��</a></td>
	                        <td width="62" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/fxzl/fxzl_fx.jsp" class="topmenu" onmouseover="changeMenu('fxzl');">��Ѵר��</a></td>
	                        <td width="74" align="center" valign="middle" background="<%=path %>/images/top/top_c.png"><a href="<%=path %>/szyzl/szyzl_fx.jsp" class="topmenu" onmouseover="changeMenu('szyzl');">ˮ��Դר��</a></td>
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
        <td height="89"><table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="235" height="89" background="<%=path %>/images/top/logo_fx.png">&nbsp;</td>
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
																href="<%=path %>/index_fx.jsp"
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
            <td width="110" height="76" valign="middle" align="right" background="<%=path %>/images/top/right_b.png">
            <jsp:include flush="true" page="/imagine/clock6.htm"></jsp:include>
            </td>
            </tr>
            </table>
        </td>
      </tr>
      <tr>
        <td height="24" valign="bottom"  background="<%=path %>/images/top/bottom_sy2.png">
 <table width="98%" class="b" align="left" height="23"
							cellpadding="0" cellspacing="0">
							
							<tr>
								<td width="510" class="b">

									<table width="510" cellpadding="0" cellspacing="0">
										<tr>
											<td width="30" class="top_login" align="center" nowrap="nowrap">
												�û�
											</td>
											<td width="60">
												<input name="loginUser" type="text" value=""
													class="denglu1"  ondblclick="focus();select()" />
											</td>
											<td width="30" class="top_login" align="center" nowrap="nowrap">
												����
											</td>
											<td width="60">
												<input name="password" type="password" value="" class="denglu1"  ondblclick="focus();select()" />
											</td>
											<td width="60">
												&nbsp;<img src="<%=path%>/images/denglu.gif" width="50" height="19"
													onmouseover="this.style.cursor='hand'" onclick="submit1();">
											</td>
											<td width="50">
											&nbsp;<img src="<%=path%>/images/key1.gif"  height="19" 
													onmouseover="this.style.cursor='hand'" onclick="return keyLogin();" alt="��key��½">
											
											</td>
											
											<td width="200" >
									<%
											if (loginFlag != null) {
											if ("nameOrcodeError".equals(loginFlag)) {
									%>
									<font color="red" size="-1">��ʾ����������û������������</font>
									<%
											}
											if ("NoRight".equals(loginFlag)) {
									%>
									<font color="red" size="-1">��ʾ�������ǹ���Ա����Ȩ�޵�¼��</font>
									<%
											}
											if ("timeout".equals(loginFlag)) {
									%>
									<font color="red" size="-1"></font>
									<%
										}
										}
									%>
								</td>
											
										</tr>
									</table>
								</td>

								<td width="1">
									&nbsp;
								</td>
								<td colspan="2">
									<marquee behavior="scroll" direction="left" scrollamount="3"
										style="font-size: 12px;color: 2c6b9e;"
										onMouseOver="this.stop();" onMouseOut="this.start();">


									</marquee>
								</td>
							</tr>
						</table>
					</td>
            </tr>
        </table>
						
						</td>
        </tr>
    </table></td>
  </tr>
</table>
					</td>
            </tr>
            <input type="hidden" value="<%=request.getContextPath()%>" id="path" />
  			<input type="hidden" name="goto" id="goto" value="<%=request.getParameter("goto")%>" />
           
		<input type="hidden" value="" id="resultFlag" />
		<input type="hidden" value="" id="resultInfo" />
        </table>
        </form>
		<p align="center">
			<OBJECT ID="SafeEngineCtl"
				CLASSID="CLSID:B48B9648-E9F0-48A3-90A5-8C588CE0898F" width="0"
				height="0" border=0 codebase="SafeEngineCOM.cab#Version=1,2,0,0"></OBJECT>
		</p>
		</body>
<script type="text/javascript">
function loginOnkeydown(){   
	if(event.keyCode==13){
		submit1();
	}
}
document.getElementById("loginUser").onkeydown=loginOnkeydown;
document.getElementById("password").onkeydown=loginOnkeydown;
</script>