<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>
<html>
<%
 				String path = request.getContextPath();
				String basePath = request.getScheme() + "://"
						+ request.getServerName() + ":" + request.getServerPort()
						+ path + "/";
%>
	<head>

		<title>�Ϻ�ˮ��</title>	
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
	<SCRIPT LANGUAGE="JavaScript">   
		if   (top.frames.length!=0)   top.location=self.document.location;   
	</SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
<!--
document.documentElement.addBehavior("#default#userdata");

function  saveUserData(user,key,value){
  var ex; 
    if(!value){
        value = key;key=user;user="defaultUser"
    }
    with(document.documentElement)try {
    load(user);
    expires = new Date(new Date()-(-86400000)).toGMTString();
    setAttribute(key, value);
    save(user);
    return  getAttribute("value");
  }
  catch (ex){alert(ex)}
}

function loadUserData(user,key){
    if(!key){
        key=user;user="defaultUser";
    }
  var ex; 
    with(document.documentElement)try{
    load(user);
    return getAttribute(key);
  }
  catch (ex){alert(ex.message);return null;}
}

function  deleteUserData(user){
  var ex; 
    if(!user)user="defaultUser";
    with(document.documentElement)try{
      load(user);
    expires = new Date(new Date()-86400000).toGMTString();
    save(user);
  }
  catch (ex){alert(ex.message);}
} 

function chageDiv()
{
	deleteUserData("shanghaiwater");
	saveUserData("shanghaiwater","div1",document.getElementById("myID1").innerHTML)
	saveUserData("shanghaiwater","div2",document.getElementById("myID2").innerHTML)
	saveUserData("shanghaiwater","div3",document.getElementById("myID3").innerHTML)
	alert("����ɹ���");
}
function pagego(go)
{
   var link= document.getElementById("syhref");
   if(go==1)
   {
     link.src="<%=path%>/applyaction.do?method=wsbs";
      document.getElementById("deimage").background="../imagine/l-4-2.gif";  
	}

	if(go==2)
   {
     link.src="../zwzl/wsbs1.htm"; 
     document.getElementById("deimage").background="../imagine/2l-1.gif";
	}
}

function pagego1(go)
{
   var link= document.getElementById("syhref1");
   if(go==1)
   {
     link.src="<%=path%>/govern.do?method=zfxxgk"; 
     document.getElementById("deimage1").background="../imagine/1.jpg";
     document.getElementById("2").style.color="#2f475f";
     document.getElementById("1").style.color="#8a95a1";
	}

	if(go==2)
   {
     link.src="<%=path%>/infopubContentaction.do?method=gknb&code=gknb";  
     document.getElementById("deimage1").background="../imagine/3.jpg";
     document.getElementById("2").style.color="#8a95a1";
     document.getElementById("1").style.color="#2f475f";
	}
}
function pagego2(go)
{
   var link= document.getElementById("syhref2");
   if(go==1)
   {
     link.src="http://31.16.1.7/cljg_n_bak.jsp";
     document.getElementById("deimage2").background="../imagine/1.jpg"; 
     document.getElementById("4").style.color="#2f475f";
     document.getElementById("3").style.color="#8a95a1";
	}

	if(go==2)
   {
     link.src="http://31.16.1.7/cljg_n_bak.jsp";
     document.getElementById("deimage2").background="../imagine/3.jpg";
     document.getElementById("4").style.color="#8a95a1";
     document.getElementById("3").style.color="#2f475f";
	}
}

var baseDiv1 = "<!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg1.gif\"><tr class=\"dragTR\" ><td width=\"100%\" height=\"24\" align=\"center\"  valign=\"bottom\" class=\"tabl_atab\">&nbsp;&nbsp;������Ϣƽ̨</td></tr><tr><td align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\"><a href=\"http://31.16.1.74/website/shsw_webgis/viewer.htm\" onClick=\"\" target=\"_blank\"><img src=\"../imagine/pic.gif\" border=\"0\" width=\"270\" height=\"163\"  scrolling=\"no\" align=\"center\"></a></td></tr></table><!----><!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg1.gif\"><tr class=\"dragTR\"><td id=\"deimage\" width=\"100%\" height=\"24\" align=\"center\" valign=\"bottom\" class=\"tabl_atab\">&nbsp;&nbsp;&nbsp;&nbsp;���ϰ���</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe id=\"syhref\"src=\"<%=path%>/applyaction.do?method=wsbs\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/1.jpg\"><tr class=\"dragTR\"><td id=\"deimage1\" height=\"24\" align=\"center\" valign=\"bottom\" class=\"tabl_atabno\">&nbsp;&nbsp;<a href=\"#t\"onClick=\"pagego1(1);\"><font id=\"2\">������Ϣ����</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#y\" onClick=\"pagego1(2);\"><font id=\"1\" color=\"#8a95a1\">�����걨</font></a></td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe id=\"syhref1\" src=\"<%=path%>/govern.do?method=zfxxgk\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"335\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/1.jpg\"><tr class=\"dragTR\"><td id=\"deimage2\" width=\"100%\" height=\"24\" align=\"center\" valign=\"bottom\" class=\"tabl_atabno\"><B>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#i\" onClick=\"pagego2(1);\"><font id=\"4\">����챨</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#l\" onClick=\"pagego2(2);\"><font id=\"3\" color=\"#8a95a1\">������</font></a></td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe id=\"syhref2\" src=\"http://31.16.1.7/cljg_n_bak.jsp\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!---->";

var baseDiv2 = "<!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td  width=\"100%\" height=\"24\" align=\"center\" valign=\"bottom\" class=\"tab2_atab\">&nbsp;&nbsp;&nbsp;&nbsp;���²���</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"<%=path%>/infopubContentaction.do?method=zxbb&code=zxbb\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td height=\"24\" align=\"center\" valign=\"bottom\" class=\"tab2_atab\"><B>&nbsp;&nbsp;&nbsp;&nbsp;֪ͨͨ��</B></td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"<%=path%>/infopubContentaction.do?method=tztg&code=tongzhitonggao\" frameborder=\"0\" width=\"100%\" height=\"163\" scrolling=\"no\"></iframe></td></tr></table><!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\" ><tr class=\"dragTR\"><td height=\"24\" align=\"center\" valign=\"bottom\" class=\"tab2_atab\"><B>&nbsp;&nbsp;&nbsp;&nbsp;ˮ��̬</B></td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"<%=path%>/infopubContentaction.do?method=swdt&code=swdt\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"333\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td height=\"24\" align=\"center\" valign=\"bottom\" class=\"tab2_atab\"><B>&nbsp;&nbsp;&nbsp;&nbsp;��վ��̬</B></td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"<%=path%>/infopubContentaction.do?method=wzdt&code=wzdt\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!---->";

var baseDiv3 = "<!----><table width=\"335\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td  width=\"335\" height=\"24\" align=\"right\"  valign=\"bottom\" class=\"tab2_atab\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʾ</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"<%=path%>/infopubContentaction.do?method=gongshi&code=gongshi\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"335\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td height=\"24\" align=\"right\" valign=\"bottom\" class=\"tab2_atab\">&nbsp;&nbsp;&nbsp;&nbsp;������Ϣ</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"<%=path%>/infopubContentaction.do?method=information&code=cyxx\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"335\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td height=\"24\" align=\"center\" valign=\"bottom\" class=\"tab2_atab\">&nbsp;&nbsp;&nbsp;ͼ�����ݿ�</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"../index/pic.html\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!----><!----><table width=\"335\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" background=\"../imagine/xx_bg2.gif\"><tr class=\"dragTR\"><td height=\"24\" align=\"center\" valign=\"bottom\" class=\"tab2_atab\">&nbsp;&nbsp;&nbsp;&nbsp;���ϵ���</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"../zwzl/wsdc.htm\" frameborder=\"0\" width=\"100%\" height=\"163\"  scrolling=\"no\"></iframe></td></tr></table><!---->";

</SCRIPT>
</head>
<link href="<%=path %>/css/index-css.css;css/style1.css" rel="stylesheet" type="text/css">
<body  style='overflow:scroll;overflow-x:hidden' leftmargin="0" topmargin="2">
<jsp:include page="/index_top.jsp"></jsp:include>

<table width="1006" border="0" align="center" cellpadding="0" cellspacing="2" id="parentTable"  bgcolor="#ffffff">
  <tr>
    <td width="334" valign="top" id="myID1"></td>
    <td width="334" valign="top" id="myID2"></td>
    <td width="335" valign="top" id="myID3"></td>
	
  </tr>
</table>
     
<table width="1000" border="0" height="30" align="center" cellpadding="0" cellspacing="0" bgcolor="658deb" >
  <tr>
       <td align="center" valign="top">
<table width="1000" border="0" cellpadding="0" cellspacing="0" >
      
      <tr>
        <td  height="30" align="center">
         <select  
                              onchange="javascript:window.open(this.options[this.selectedIndex].value)" 
                              name="select2">
          <option selected="selected">����ʡ��ˮ������</option>
          <option value="http://www.bjwater.gov.cn"/>
          ������
          <option value="http://www.shanghaiwater.gov.cn"/>
          �Ϻ���
          <option value="http://www.tjwcb.gov.cn"/>
          �����
          <option value="http://www.cqwater.gov.cn"/>
          ������
          <option 
                                value="http://www.water.hebnet.gov.cn"/>
          
          
          
      
        
              �ӱ�ʡ
              
        
      
      
          
          <option 
                                value="http://www.sxwater.gov.cn"/>
          
          
          
      
        
              ɽ��ʡ
              
        
      
      
          
          <option 
                                value="http://www.dwr.ln.gov.cn"/>
          
          
          
      
        
              ����ʡ
              
        
      
      
          
          <option value="http://slt.jl.gov.cn"/>
          
          
          
      
        
              ����ʡ
              
        
      
      
          
          <option 
                                value="http://www.e-gov.hl.cn/agriculture/shuili">������ʡ </option>
          <option 
                                value="http://www.jswater.gov.cn"/>
          
          
          
      
        
              ����ʡ
              
        
      
      
          
          <option 
                                value="http://www.zjwater.com"/>
          
          
          
      
        
              �㽭ʡ
              
        
      
      
          
          <option 
                                value=" http://www.ahsl.gov.cn/   ">����ʡ</option>
          <option 
                                value="http://www.fjwater.gov.cn"/>
          
          
          
      
        
              ����ʡ
              
        
      
      
          
          <option 
                                value="http://www.jxfx.gov.cn/  ">����ʡ</option>
          <option 
                                value="http://www.hnsl.gov.cn/  ">����ʡ</option>
          <option 
                                value="http://www.hubeiwater.gov.cn"/>
          
          
          
      
        
              ����ʡ
              
        
      
      
          
          <option 
                                value="http://www.hnwr.gov.cn"/>
          
          
          
      
        
              ����ʡ
              
        
      
      
          
          <option 
                                value="http://www.slt.gd.gov.cn"/>
          
          
          
      
        
              �㶫ʡ
              
        
      
      
          
          <option 
                                value="http://202.100.218.58/gov/jshuili/sljzy.htm">����ʡ</option>
          <option 
                                value="http://www.scwater.net/  ">�Ĵ�ʡ</option>
          <option 
                                value="http://www.gzmwr.gov.cn/ ">����ʡ</option>
          <option 
                                value="http://www.wcb.yn.gov.cn/ ">����ʡ</option>
          <option 
                                value="http://www.xzwater.gov.cn/  ">����������</option>
          <option 
                                value="http://210.83.3.18/  ">����ʡ</option>
          <option 
                                value="http://www.gssl.gov.cn/  ">����ʡ</option>
          <option 
                                value="http://www.nxsl.gov.cn/default.asp">����</option>
          <option 
                                value="http://www.qhsl.gov.cn/  ">�ຣʡ</option>
          <option 
                                value="http://www.info.gov.hk/wsd/index.htm  ">���</option>
        </select></td>
        <td><select   style="WIDTH: 135px;
                              id="menu4" 
                              onchange="javascript:window.open(this.options[this.selectedIndex].value)" 
                              name="select3">
          <option selected="selected">�����м�ˮ������</option>
         <option value="http://www.shanghaiwater.gov.cn"/>
          �Ϻ�
          <option 
                                value="http://www.gzwater.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.szwrb.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.swj.dl.gov.cn"/>
          
              
          
      
        
              ����
              
        
          <option 
                                value="http://www.jnwater.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://slsd.wztelecom.zj.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.sysl.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://sanfang.nanhai.gov.cn"/>
          
          
      
        
              �Ϻ�
              
        
      
      
          <option 
                                value="http://www.zhanjiang.gov.cn/zjsl"/>
          
              
          
      
        
              տ��
              
        
          <option 
                                value="http://www.huainan.gov.cn/shuili/index.htm">����</option>
          <option 
                                value="http://www.gygov.gov.cn/shuidianjv/shuilijv.htm">����</option>
          <option 
                                value="http://www.jqwater.net"/>
          
              
          
      
        
              ��Ȫ
              
        
          <option value="http://202.98.242.42"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.yqs-slj.zj001.net"/>
          
              
          
      
        
              ����
              
        
          <option 
                                value="http://www.gm.fswater.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.dh.jl.gov.cn/shuiliju/jzzc.htm">�ػ�</option>
          <option 
                                value="http://www.shuili.cangzhou.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.ycsl.gov.cn"/>
          
              
          
      
        
              �˲�
              
        
          <option 
                                value="http://www.xfwater.com"/>
          
              
          
      
        
              �差
              
        
      
          <option 
                                value="http://www.qzwater.com"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://jjsl.nease.net/2001zjh/2001zjh.htm">����</option>
          <option 
                                value="http://szszys.sosoo.net"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.cndx.net/cnslj/index.htm">����</option>
          <option 
                                value="http://www.yzsl.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.jszjsl.gov.cn"/>
          
              
          
      
        
              ��
              
        
      
          <option 
                                value="http://www.tzwater.com"/>
          
              
          
      
        
              ̩��
              
        
          <option 
                                value="http://www.wxwater.gov.cn"/>
          
              
          
      
        
              ����
              
        
          <option value="http://xntf.wx-e.com"/>
          
          
      
        
              ����
              
        
          <option 
                                value="http://www.zqwater.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option 
                                value="http://hsslj.heshan.net"/>
          
              
          
      
        
              ��ɽ
              
        
          <option value="http://www.njslw.com"/>
          
              
          
      
        
              ����
              
        
      
      
          <option 
                                value="http://www.shlj.sjz.net.cn"/>
          
              
          
      
        
              ʯ��ׯ
              
        
      
          <option 
                                value="http://www.hsswj.gov.cn/hsswj/index.jsp">��ˮ</option>
          <option 
                                value="http://bzwater.533.net"/>
          
              
          
      
        
              ����
              
        
          <option 
                                value="http://www.lzsl.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option value="http://www.cqrcsl.com"/>
          
              
          
      
        
              �ٲ�
              
        
      
          <option value="http://www.cqlpsl.com"/>
          
              
          
      
        
              ��ƽ
              
        
      
          <option value="http://www.cqtnsl.com"/>
          
              
          
      
        
              ����
              
        
      
      
          <option value="http://www.cqtlsl.com"/>
          
              
          
      
        
              ͭ��
              
        
      
          <option value="http://www.cqbssl.com"/>
          
              
          
      
        
              ��ɽ
              
        
      
          <option value="http://www.cqkxsl.com"/>
          
              
          
      
        
              ����
              
        
          <option 
                                value="http://www.cqddksl.com"/>
          
              
          
      
        
              ��ɿ�
              
        
      
          <option value="http://www.cqwssl.com"/>
          
          
      
        
              ��ʢ
              
        
          <option value="http://www.cqwzsl.com"/>
          
          
      
        

              ����
              
        
      
          <option value="http://www.cqpssl.com"/>
          
              
          
      
        
              ��ˮ
              
        
          <option value="http://www.cqxssl.com"/>
          
              
          
      
        
              ��ɽ
              
        
          <option 
                                value="http://www.yywr.gov.cn"/>
          
              
          
      
        
              ����

              
        
      
          <option 
                                value="http://www.hhsl.gov.cn"/>
          
          
      
        
              ���
              
        
      
          <option 
                                value="http://slj.liuzhou.gov.cn"/>
          
              
          
      
        
              ����
              
        
      
          <option value="http://www.lljj.com"/>
          
          
      
        
              ����
              
        
      
          <option 
                                value="http://www.fswater.gov.cn"/>
          
              
          
      
        
              ��ɽ
              
        
      
      
          <option 
                                value="http://slj.lyg.gov.cn"/>
          
              
          
      
        
              ���Ƹ�
              
        
      
          <option 
                                value="http://www.qzsdj.gov.cn"/>
          
              
          
      
        
              Ȫ��
              
        
      
        </select></td>
        <td><select  
                              style="WIDTH: 140px; HEIGHT: 20px" 
                              onchange="javascript:window.open(this.options[this.selectedIndex].value)" 
                              name="select">
          <option selected="selected">ҵ����վ</option>
		  <option 
                                value="http://www.shhes.org.cn"/>
          
          
          
      
        
              �Ϻ���ˮ��ѧ��
          <option 
                                value="http://www.cjw.com.cn"/>
          
          
          
      
        
              ˮ��������ˮ��ίԱ��
              
        
      
      
          
          <option 
                                value="http://www.yellowriver.gov.cn"/>
          
          
          
      
        
              ˮ�����ƺ�ˮ��ίԱ��
              
        
      
      
          
          <option 
                                value="http://www.hu.mwr.gov.cn/ ">ˮ��������ˮ��ίԱ��</option>
          <option 
                                value="http://www.hwcc.gov.cn"/>
          
          
          
      
        
              ˮ��������ˮ��ίԱ��
              
        
      
      
          
          <option 
                                value="http://www.pearlwater.gov.cn/ ">ˮ�����齭ˮ��ίԱ��</option>
          <option 
                                value=" http://www.slwr.gov.cn/">ˮ��������ˮ��ίԱ��</option>
          <option 
                                value=" http://www.tba.gov.cn/  ">ˮ����̫����������</option>
          <option 
                                value="http://rencai.chinawater.net.cn"/>
          
          
          
      
        
              ˮ�����˲���Դ��������
              
        
      
      
          
          <option 
                                value=" http://www.waterinfo.com.cn/  ">ˮ������չ�о�����</option>
          <option 
                                value="http://www.ccwm.com.cn"/>
          
          
          
      
        
              �й�ˮ���г���
              
        
      
      
          
          <option 
                                value="http://www.water-sh.com"/>
          
          
          
      
        
              �Ϻ�������ˮ�������޹�˾
              
        
      
      
          
          <option 
                                value="http://www.shanghaiwater.com"/>
          
          
      
        
              �Ϻ�������ˮ�б����޹�˾
              
        
      
      
          
          <option 
                                value="http://www.minhangwater.com/index.asp">�Ϻ�������ˮ�������޹�˾</option>
          <option 
                                value=" http://www.pudongwater.com/index.asp">�Ϻ��ֶ�����������ˮ���޹�˾</option>
          <option 
                                value="http://www.swec.net"/>
          
          
          
      
        
              �Ϻ�ˮ�����������޹�˾
              
        
      
      
          
          <option 
                                value="http://www.ssrcc.com/"/>
          
          
      
        
              �Ϻ������ݺ��ۺ����ν������޹�˾
              
        
      
      
          
          <option 
                                value="http://www.swcc.org.cn"/>
          
          
      
        
              ˮ��������̬����������
              
        
      
      
          
          <option 
                                value="http://www.giwp.org.cn"/>
          
          
          
      
        
              ˮ��ˮ���滮�����Ժ
              
        
      
      
          
          <option 
                                value=" http://www.hydroinfo.gov.cn/">�й�ˮ����Ϣ��</option>
          <option 
                                value=" http://www.irrigate.com.cn/    ">�й��Ź���Ϣ��</option>
          <option 
                                value="http://www.chinawater.net.cn"/>
          
          
          
      
        
              �й�ˮ���Ƽ���Ϣ��
              
        
      
      
          
          <option 
                                value="http://www.shuiwang.com/   ">ˮ��</option>
          <option 
                                value="http://www.h2o-china.com"/>
          
          
      
        
              �й�ˮ��
              
        
      
      
          
          <option 
                                value="http://www.e-water.com.cn/  ">����ˮ��</option>
          <option 
                                value="http://www.waterwaswater.com"/>
          
          
          
      
        
              ��ˮ��ˮ
              
        
      
      
          
          <option 
                                value="http://www.gpszx.com"/>
          
          
          
      
        
              ����ˮ����
              
        
      
      
          
          <option 
                                value="http://www.chinawater.net/  ">�й���ˮ��ˮ</option>
          <option 
                                value="http://www.h2o-china.com/general/index-g.asp">��ˮ���������</option>
          <option 
                                value="http://www.cnwaternews.com"/>
          
          
      
        
              �й�ˮ����
              
        
      
      
          
          <option 
                                value="http://www.c-water.com.cn/  ">�й�ˮ��ҵ��</option>
          <option 
                                value="http://www.chinasewage.com"/>
          
          
          
      
        
              �й���ˮ��
              
        
      
      
          
          <option 
                                value="http://www.chinawater.com.cn/ ">�й�ˮ������</option>
          <option 
                                value=" http://jhe.ches.org.cn/  ">ˮ��ѧ��</option>
          <option 
                                value="http://www.waterpub.com.cn"/>
          
          
          
      
        
              �й�ˮ��ˮ�������
              
        
      
      
          
          <option 
                                value=" http://www.nceib.iwhr.com/">���ҽ�ˮ��ȱ������̼����о�����</option>
          <option 
                                value="http://www.bjwatergroup.com"/>
          
          
          
      
        
              ����������ˮ�����������ι�˾
              
        
      
      
          
          <option 
                                value="http://www.pdswater.com"/>
          
          
          
      
        
              ƽ��ɽ������ˮ��˾
              
        
      
      
          
          <option 
                                value=" http://www.ytkfqwater.com.cn/">��̨���ü�������������ˮ��˾</option>
          <option 
                                value="http://www.zibowater.com"/>
          
          
          
      
        
              �Ͳ�������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.whwater.com"/>
          
          
          
      
        
              �人������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.xfgs.com.cn"/>
          
          
          
      
        
              �差��ˮ�ܹ�˾
              
        
      
      
          
          <option 
                                value="http://www.tianjinwater.com.cn"/>
          
          
          
      
        
              �������ˮ�������޹�˾
              
        
      
      
          
          <option 
                                value="http://www.supplywater.com"/>
          
          
          
      
        
              ��ɳ������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.chinacity.net/zgcs/liaoning/shenyang/shen35/shen58.htm">����������ˮ�ܹ�˾</option>
          <option 
                                value="http://www.waterchina.com"/>
          
          
          
      
        
              ������ˮ�񣨼��ţ����޹�˾
              
        
      
      
          
          <option 
                                value="http://www.ddzwater.com.cn"/>
          
          
          
      
        
              �������ü�������������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.fswater.com"/>
          
          
      
        
              ��ɽˮ˾
              
        
      
      
          
          <option 
                                value="http://www.qqhrwater.com"/>
          
          
          
      
        
              �������������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.chwater.com"/>
          
          
          
      
        
              �κ�������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.ntws.com.cn"/>
          
          
          
      
        
              ��ͨ������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.wuwater.com"/>
          
          
          
      
        
              ����������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://jingtai.363.net/index.htm">����������ˮ��˾</option>
          <option 
                                value="http://www.tysy.com.cn"/>
          
          
          
      
        
              ��������ˮҵ�����ţ���˾
              
        
      
      
          
          <option 
                                value="http://www.xiamenwater.com"/>
          
          
          
      
        
              ����������ˮ�������޹�˾
              
        
      
      
          
          <option 
                                value="http://www.viewchina.org/qzss"/>
          
          
      
        
              Ȫ��������ˮ��˾
              
        
      
      
          
          <option 
                                value="http://www.jnwater.com.cn"/>
          
          
          
      
        
              ����������ˮ��˾
              
        
      
      
          
        </select></td>
        <td><select  
                              style="WIDTH: 105px; HEIGHT: 20px" 
                              onchange="javascript:window.open(this.options[this.selectedIndex].value)" 
                              name="select">
          <option selected="selected">����ˮ�����</option>
          <option value="http://www.wef.org"/>
          
          
      
        
              Water 
                                Environment Federation
              
        
      
      
          
          <option 
                                value="http://www.awt.org"/>
          
          
          
      
        
              Association of water 
                                Technologies
              
        
      
      
          
          <option 
                                value="http://www.awwa.org"/>
          
          
          
      
        
              Americian Water Works 
                                Association
              
        
      
      
          
          <option 
                                value="http://www.water4people.org"/>
          
          
          
      
        
              Water for 
                                People
              
        
      
      
          
          <option 
                                value="http://www.givewater.org"/>
          
          
          
      
        
              Give 
                                Water
              
        
      
      
          
          <option 
                                value="http://www.worldwater.org"/>
          
          
          
      
        
              The World`s 
                                Water
              
        
      
      
          
          <option 
                                value="http://www.waterwiser.org"/>
          
          
      
        
              Water 
                                Wiser
              
        
      
      
          
          <option 
                                value="http://www.iwahq.org.uk"/>
          
          
      
        
              International 
                                Water Association
              
        
      
      
          
          <option 
                                value="http://www.cleanwateraction.org"/>
          
          
      
        
              Clean 
                                Water Action
              
        
      
      
          
          <option 
                                value="http://www.water.org.uk"/>
          
          
          
      
        
              Water UK
              
        
      
      
          
          <option 
                                value="http://www.w-ww.com"/>
          
          
          
      
        
              Water-Wastewater 
                                Web
              
        
      
      
          
          <option 
                                value=" http://www.wateronline.com/content/homepage/default.asp">Water 
            online</option>
          <option 
                                value="http://water.usgs.gov"/>
          
          
          
      
        
              Water Resources of 
                                the United States
              
        
      
      
          
          <option 
                                value="http://ga.water.usgs.gov/edu"/>
          
          
          
      
        
              Water 
                                Science for Schools
              
        
      
      
          
          <option 
                                value="http://www.thames-water.com"/>
          
          
          
      
        
              Thames 
                                Water
              
        
      
      
          
          <option 
                                value="http://www.uswaternews.com/homepage.htm">U.S. 
            Water News</option>
          <option 
                                value="http://wow.nrri.umn.edu/wow"/>
          
          
          
      
        
              Water on the 
                                Web
              
        
      
      

          
          <option 
                                value="http://www.thewaterpage.com"/>
          
          
          
      
        
              The Water 
                                Page
              
        
      
      
          
          <option 
                                value="http://www.state.nv.us/cnr/ndwp/dict-1/waterwds.htm">Water 
            Words Dictionary</option>
          <option 
                                value="http://www.nal.usda.gov/wqic">Water Quality 
            Information Center</option>
          <option 
                                value="http://www.bottledwaterweb.com"/>
          
          
      
        
              Bottled 
                                Water Web
              
        
      
      
          
          <option 
                                value="http://www.wcc.nrcs.usda.gov"/>
          
          
          
      
        
              National 
                                Water and Climate Center
              
        
      
      
          
          <option 
                                value="http://www.water-technology.net"/>
          
          
          
      
        
              Water 
                                Technology
              
        
      
      
          
          <option 
                                value="http://www.cleanwater.gov"/>
          
          
      
        
              Cleanwater.gov
              
        
      
      
          
          <option 
                                value="http://www.southernwater.co.uk"/>
          
          
      
        
              Southern 
                                Water
              
        
      
      
          
          <option 
                                value="http://www.fi.edu/city/water">Water in The 
            City</option>
          <option 
                                value="http://www.anglianwater.co.uk"/>
          
          
          
      
        
              Anglian 
                                Water
              
        
      
      
          
          <option 
                                value="http://www.sydneywater.com.au"/>
          
          
          
      
        
              Sydney 
                                Water
              
        
      
      
          
          <option 
                                value="http://www.unesco.org/water"/>
          
          
          
      
        
              United 
                                Nations Educational Scientific and Cultural 
                                Organization Water
              
        
      
      
          
          <option 
                                value="http://www.wcp.net"/>
          
          
      
        
              Water Conditioning and 
                                Pur?9ification Magazine
              
        
      
      
          
          <option 
                                value="http://www.epa.gov/water">U.S. 
            Environmental Protection Agency &gt; 
            water</option>
          <option 
                                value="http://www.wsscc.org"/>
          
          
      
        
              Water Supply &amp; 
                                Sanitation Collaborative 
                            Council
              
        
      
      
          
        </select></td>
        <td><select class="tx1" 
                              style="WIDTH: 120px" 
                              onchange="javascript:window.open(this.options[this.selectedIndex].value) " 
                              name="select">
          <option selected="selected">�������š���λ</option>
		  <option 
                                value="http://61.151.248.163">�Ϻ��з�Ѵ��Ϣ������</option>
          <option 
                                value="http://www.shswyouth.com">�Ϻ���ˮ��������</option>
          <option 
                                value="http://www.shsl.org.cn"/>
          
          
      
        
              �Ϻ���ˮ������

              
        
      
      
          
          <option 
                                value="http://www.wsa.gov.cn"/>
          
          
      
        
              �Ϻ��й�ˮ����
              
        
      
      
          
          <!--option 
                                value="http://paishui.shanghaiwater.gov.cn"/>
          
          
      
        
              �Ϻ�����ˮ����-->
              
        
      
      
          
          <option 
                                value="http://www.hydrology.sh.cn"/>
          
          
      
        
              �Ϻ���ˮ����վ
              
        
      
      
          
          <option 
                                value="http://www.shanghaiwater.org"/>
          
          
      
        
              �Ϻ��з�Ѵ��Ϣ���ģ��Ϻ���ˮ����Ϣ���ģ�
              
        
      
      
          
          <option 
                                value="http://www.shwaterplan.com"/>
          
          
      
        
              �Ϻ���ˮ��滮���Ժ
              
        
      
      
          
          <option 
                                value="http://www.swedri.com"/>
          
          
      
        
              �Ϻ���ˮ�񹤳�����о�Ժ���޹�˾
			  <option 
                                value="http://www.shhb.com.cn"/>
          
      
        
              �Ϻ��겨������ѯ�������޹�˾
              
        
				<option 
                                value="http://www.sscrpho.org"/>
          
      
        
              �Ϻ����ݺӻ����ۺ������쵼С��칫��
      
          
        </select></td>
        <td><select class="tx1" 
                              style="WIDTH: 120px" 
                              onchange="javascript:window.open(this.options[this.selectedIndex].value) " 
                              name="select">
          <option selected="selected">����(��)��Ѵ��</option>

          <option 
                                value="http://211.144.95.130:9080/website/index.jsp">�ֶ�������Ѵ��</option>
		  <option 
                                value="http://31.16.1.9/shfx/jiuzai/xuhui.htm"/>�������Ѵ��</option>
		  <option 
                                value="http://31.16.1.9/shfx/jiuzai/changnin.htm"/>��������Ѵ��</option>
 		  <option 
                                value="http://172.1.5.1/"/>��������Ѵ��</option>
 		  <option 
                                value="http://172.12.1.100/"/>բ������Ѵ��</option>
 		  <option 
                                value="http://31.16.1.9/shfx/jiuzai/hongke.htm"/>�������Ѵ��</option>
 		  <option 
                                value="http://192.168.2.98/ypfx"/>��������Ѵ��</option>
 		  <option 
                                value="http://31.16.1.9/shfx/jiuzai/huangpu.htm"/>��������Ѵ��</option>
 		  <option 
                                value="http://31.16.1.9/shfx/jiuzai/luwan.htm"/>¬������Ѵ��</option>
 		  <option 
                                value="http://172.9.1.100/"/>��������Ѵ��</option>
 		  <option 
                                value="http://172.13.1.1/"/>��ɽ����Ѵ��</option>
 		  <option 
                                value="http://172.7.1.100/"/>��������Ѵ��</option>
		  <option 
                                value="http://www.jdwater.gov.cn/">�ζ�����Ѵ��</option>
          <option 
                                value="http://172.8.1.1/"/>�ɽ�����Ѵ��</option>
		  <option 
                                value="http://192.69.1.1/"/>��ɽ����Ѵ��</option>
          <option 
                                value="http://www.nanhui.gov.cn/nhsw/default.jsp">�ϻ�����Ѵ��</option>
          <option 
                                value="http://222.72.135.140/fxsw_new/index.asp">��������Ѵ��</option>
          <option 
                                value="http://192.1.8.100/"/>��������Ѵ��</option>
          <option 
                                value="http://www.cmwater.gov.cn">�����ط�Ѵ��</option>
        </select></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30" align="center">2007-2010 �Ϻ���ˮ��� ��Ȩ����</td>
  </tr>
</table>

</body>
</html>
<SCRIPT LANGUAGE="JavaScript">


var cDiv1 = loadUserData("shanghaiwater","div1");
if (cDiv1!=null){
	document.getElementById("myID1").innerHTML = cDiv1;
}else{
	divInit();
}
var cDiv2 = loadUserData("shanghaiwater","div2");
if (cDiv2!=null){
	document.getElementById("myID2").innerHTML = cDiv2;
}


var cDiv3 = loadUserData("shanghaiwater","div3");
if (cDiv3!=null){
	document.getElementById("myID3").innerHTML = cDiv3;
}

function divInit(){

	document.getElementById("myID1").innerHTML = baseDiv1;
	document.getElementById("myID2").innerHTML = baseDiv2;
	document.getElementById("myID3").innerHTML = baseDiv3;
}


</SCRIPT>

<script src="../js/scripts.js" language="javascript"></script>
<script defer src="../js/init.js" language="javascript"></script>
