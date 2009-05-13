<%
/**	名称：eWebEditor在线文本编辑器--飞鱼修改版
*  	作者：飞鱼
* 	日期：2004.11.30
*   网址：http://www.fiyu.net
*/
%>
<%
/**
┌─ 深度学习之IT学习网  ───────  www.ITstudy.cn  ────┐
│ 
│  名称：eWebEditor在线文本编辑器--飞鱼修改版 
│  作者：吕海鹏      2006/12/5
│  说明：此程序修改于eWebEditor在线文本编辑器--飞鱼修改版
│			原作者：飞鱼		网址：http://www.fiyu.net
│   
│     
│  本代码完全公开和免费，你可以任意复制、传播、修改和使用，
│  但不得公开发表代码 不得用做商业用途，不得向其他使用者收费。 
│  
│  使用时，保留此段信息，谢谢配合      
│                                            
│ 
│ 
└──────────────────  www.DeepTeach.com  ───┘
*/
%>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="net.fiyu.edit.EditWebhelper,net.fiyu.edit.EditBean"%>
<%
	String 	from,
			sUploadFilePath,
			sContentID,
        	sStyleID,
        	sFullScreen,
        	sStyleName,
              	sStyleDir,
            	sStyleCSS,
              	sStyleUploadDir,
              	nStateFlag,
              	sDetectFromWord,
              	sInitMode,
              	sBaseUrl,
              	sVersion,
              	sReleaseDate,
		sAutoRemote,
              	sToolBar;

EditWebhelper web = new EditWebhelper();
//初始化处理bean
web.filename = config.getServletContext().getRealPath("/")+"WEB-INF/style.xml";
web.filename2 = config.getServletContext().getRealPath("/")+"WEB-INF/button.xml";
web.getInstance();
//初始化输出bean
EditBean bean = web.InitPara();
sVersion = bean.getSVersion();
sReleaseDate = bean.getSReleaseDate();
sStyleName = bean.getSStyleName();
sStyleDir = bean.getSStyleDir();
//sStyleUploadDir = bean.getSStyleUploadDir();
//<add code start>
//图片显示路径设置
//此处设置上传文件保存路径,注意路径要由ROOT开始===3处======================
//修改此处需修改WEB-INF/Style.xml文件对应处<suploaddir>/UploadFile/</suploaddir>=========
//修改此处需修改eWebEditor.jsp文件对应处 =====www.ITstudy.cn=========
//修改此处需修改upload.jsp文件对应处 =====www.ITstudy.cn=========
from=request.getParameter("from");
if ("govInfoPub".equals(from)||"outsidenetinfopub".equals(from)){
	sUploadFilePath="GovInfoUploadFile/";
	}
else {
	sUploadFilePath="UploadFile/";
	}
String sStyleNameAdd;
Calendar calendar = Calendar.getInstance();
	sStyleNameAdd=config.getServletContext().getRealPath("/")+ sUploadFilePath +calendar.get(Calendar.YEAR) + 
	"/"+ (calendar.get(Calendar.MONTH)+1) +"/"+ calendar.get(Calendar.DAY_OF_MONTH)+"/";
	//图片日期同步,并且将图片存放在UPLOAD下面
	//动态的创建UPLOAD目录
	           File picStoreDir=new File(sStyleNameAdd);
			   //do java.io.File.mkdirs()
				picStoreDir.mkdirs();
				//output sStyleNameAdd path
				//out.println(sStyleNameAdd);
//此处设置上传文件保存路径,注意路径要由ROOT开始=========================
sStyleUploadDir ="/sso/"+sUploadFilePath+calendar.get(Calendar.YEAR) + 
	"/"+ (calendar.get(Calendar.MONTH)+1) +"/"+ calendar.get(Calendar.DAY_OF_MONTH)+"/";
//sStyleUploadDir = bean.getSStyleUploadDir();
//<add core end>
sInitMode = bean.getSInitMode();
sDetectFromWord = bean.getSDetectFromWord();
sBaseUrl = bean.getSBaseUrl();
sAutoRemote = bean.getSAutoRemote();
sToolBar = bean.getSToolBar();
nStateFlag = bean.getNStateFlag();
		//设置颜色样式
		sStyleCSS = request.getParameter("color");
                if (sStyleCSS == null)
                	sStyleCSS = "CoolBlue";
                else
                sStyleCSS = request.getParameter("color").trim();
                //设置全屏幕选项
                sFullScreen = request.getParameter("fullscreen");
                if (sFullScreen == null)
                	sFullScreen = "0";
                else
                sFullScreen = request.getParameter("fullscreen").trim();
                //设置内容选项
                sContentID = request.getParameter("id");
                if (sContentID == null)
                	sContentID = "content1";
                else
                sContentID = request.getParameter("id").trim();
                //设置样式
                sStyleName = request.getParameter("style");
                if (sStyleName == null)
                	sStyleName = "standard";
                else
                sStyleName = request.getParameter("style").trim();
 %>
<html>
<head>
<title>eWebEditor - eWebSoft在线文本编辑器</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/<%=sStyleCSS%>/Editor.css" type="text/css" rel="stylesheet">

<Script Language=Javascript>
var sPath = document.location.pathname;
sPath = sPath.substr(0, sPath.length-14);

var sLinkFieldName = "<%=sContentID%>" ;

// 全局设置对象
var config = new Object() ;
config.Version = "<%=sVersion%>" ;
config.ReleaseDate = "<%=sReleaseDate%>" ;
config.StyleName = "<%=sStyleName%>";
config.StyleEditorHeader = "<head><link href=\""+sPath+"css/<%=sStyleCSS%>/EditorArea.css\" type=\"text/css\" rel=\"stylesheet\"></head><body MONOSPACE>" ;
config.StyleMenuHeader = "<head><link href=\""+sPath+"css/<%=sStyleCSS%>/MenuArea.css\" type=\"text/css\" rel=\"stylesheet\"></head><body scroll=\"no\" onConTextMenu=\"event.returnValue=false;\">";
config.StyleDir = "<%=sStyleDir%>";
config.StyleUploadDir = "<%=sStyleUploadDir%>";
config.InitMode = "<%=sInitMode%>";
config.AutoDetectPasteFromWord = <%=sDetectFromWord%>;
config.BaseUrl = <%=sBaseUrl%>;
config.AutoRemote = <%=sAutoRemote%>;
config.From = "<%=from%>";
</Script>
<Script Language=Javascript src="include/editor.js"></Script>
<Script Language=Javascript src="include/table.js"></Script>
<Script Language=Javascript src="include/menu.js"></Script>

<script language="javascript" event="onerror(msg, url, line)" for="window">
//return true ;	 // 隐藏错误
</script>

</head>

<body SCROLLING=no onConTextMenu="event.returnValue=false;" onfocus="VerifyFocus()">

<table border=0 cellpadding=0 cellspacing=0 width='100%' height='100%'>
<tr><td>
	<%=sToolBar%>
</td></tr>
<tr><td height='100%'>

	<table border=0 cellpadding=0 cellspacing=0 width='100%' height='100%'>
	<tr><td height='100%'>
	<input type="hidden" ID="ContentEdit" value="">
	<input type="hidden" ID="ContentLoad" value="">
	<input type="hidden" ID="ContentFlag" value="0">
	<iframe class="Composition" ID="eWebEditor" MARGINHEIGHT="1" MARGINWIDTH="1" width="100%" height="100%" scrolling="yes">
	</iframe>
	</td></tr>
	</table>

</td></tr>

<% if(nStateFlag.equals("1")){ %>
<tr><td height=25>

	<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%" class=StatusBar height=25>
	<TR valign=middle>
	<td>
		<table border=0 cellpadding=0 cellspacing=0 height=20>
		<tr>
		<td width=10></td>
		<td class=StatusBarBtnOff id=eWebEditor_CODE onclick="setMode('CODE')"><img border=0 src="buttonimage/<%=sStyleDir%>/modecode.gif" width=50 height=15 align=absmiddle></td>
		<td width=5></td>
		<td class=StatusBarBtnOff id=eWebEditor_EDIT onclick="setMode('EDIT')"><img border=0 src="buttonimage/<%=sStyleDir%>/modeedit.gif" width=50 height=15 align=absmiddle></td>
		<td width=5></td>
		<td class=StatusBarBtnOff id=eWebEditor_VIEW onclick="setMode('VIEW')"><img border=0 src="buttonimage/<%=sStyleDir%>/modepreview.gif" width=50 height=15 align=absmiddle></td>
		</tr>
		</table>
	</td>
	<td align=right>
		<table border=0 cellpadding=0 cellspacing=0 height=20>
		<tr>
		<td style="cursor:pointer;" onclick="sizeChange(300)"><img border=0 SRC="buttonimage/<%=sStyleDir%>/sizeplus.gif" width=20 height=20 alt="增高编辑区"></td>
		<td width=5></td>
		<td style="cursor:pointer;" onclick="sizeChange(-300)"><img border=0 SRC="buttonimage/<%=sStyleDir%>/sizeminus.gif" width=20 height=20 alt="减小编辑区"></td>
		<td width=40></td>
		</tr>
		</table>
	</td>
	</TR>
	</Table>

</td></tr>
<% } %>

</table>

<div id="eWebEditor_Temp_HTML" style="VISIBILITY: hidden; OVERFLOW: hidden; POSITION: absolute; WIDTH: 1px; HEIGHT: 1px"></div>

<form id="eWebEditor_UploadForm" action="upload.jsp?action=remote&type=remote&style=<%=sStyleName%>" method="post" target="eWebEditor_UploadTarget">
<input type="hidden" name="eWebEditor_UploadText">
<input type="hidden" name="from" value="<%=from %>">
</form>
<iframe name="eWebEditor_UploadTarget" width=0 height=0></iframe>
<div id=divProcessing style="width:200px;height:30px;position:absolute;display:none">
<table border=0 cellpadding=0 cellspacing=1 bgcolor="#000000" width="100%" height="100%"><tr><td bgcolor=#3A6EA5><marquee align="middle" behavior="alternate" scrollamount="5" style="font-size:9pt"><font color=#FFFFFF>...远程文件收集中...请等待...</font></marquee></td></tr></table>
</div>

</body>
</html>
