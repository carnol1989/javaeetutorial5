<%@ page language="java" import="com.baosight.tools.ChangeUtil" contentType="text/html; charset=GBK"%>
<%@ page import="com.baosight.mode.TbUser"%>
<%
  String path = request.getContextPath();
  TbUser user=(TbUser)session.getAttribute("SYSTEM_USER_SESSION");
  //String logName=user.getUserAcc();
  //String realityName=user.getName();
  String url=ChangeUtil.xzxkurl;
  String xzxkurl=url+"/stuffdaiban.do?method=daiban";
  //Map map = (Map)session.getAttribute("SYSTEM_USER_DBSY_AUDIT");
%>
<html>
<head>
<link href="../css/index-css.css" rel="stylesheet" type="text/css">

</head>
<body >
<form name="myForm" id="myForm">
<table width="219" height="163" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td align="center" valign="top">
			<table width="219" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center" valign="top">
						<table width="245" border="0" cellpadding="0" cellspacing="0">
							<tr id="receiveFile">
								<td width="38%" height="18" class="xb">
									[����]��
								</td>
								<td width="62%" height="18" class="zw">
									<a href="<%=path%>/docRecListAction.do?method=newReceiveList" target="rightFrame">����<span class="hs" id="receivefileWait">0</span>��</a>
									<a href="<%=path%>/docRecListAction.do?method=disposingList" target="rightFrame">�ڰ�<span class="hs" id="receivefileProcess">0</span>��</a>
								</td>
							</tr>
							<tr id="line1">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif">
								</td>
							</tr>
							<tr id="sendFile">
<%
String ud = user.getUserdept();
String docSendPath = null;
if("b205f4e34f4f4d2da5bd89e2e10af37a".equals(ud)){
	docSendPath = path+"/docSendRelatedAction.do?method=docSendList&type=";
}else{
	docSendPath = path+"/xdocSendRelatedAction.do?method=docSendList&type=";
}
%>
								<td height="18" class="xb">
									[����]��
								</td>
								<td height="18" class="zw">
									<a href="<%=docSendPath%>1" target="rightFrame">����<span class="hs" id="sendfileWait">0</span>��</a>
									<a href="<%=docSendPath%>2" target="rightFrame">�ڰ�<span class="hs" id="sendfileProcess">0</span>��</a>
								</td>
							</tr>
							<tr id="line2">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif">
								</td>
							</tr>
							<tr id="visit">
								<td height="18" class="xb" nowrap="nowrap">
									[���ʽӴ�]��
								</td>
								<td height="18" class="zw">
									����<span class="hs">0</span>��
									�ڰ�<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line3">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif">
								</td>
							</tr>
							<tr id="sign">
								<td height="18" class="xb" nowrap="nowrap">
									[ǩ��]��
								</td>
								<td height="18" class="zw">
									����<span class="hs">0</span>��
									����<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line4">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif">
								</td>
							</tr>
							<tr id="vehicle">
								<td height="18" class="xb">
									[����]��
								</td>
								<td height="18" class="zw" id="vehiclesApply">
									������<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line5">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif">
								</td>
							</tr>
							<tr id="meeting">
								<td height="18" class="xb" nowrap="nowrap">
									[�����Ҫ]��
								</td>
								<td height="18" class="zw">
									������<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line6">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif">
								</td>
							</tr>
							<tr id="govGrant">
								<td height="18" class="xb" nowrap="nowrap">
									[�������]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/checkKey.jsp?goto=<%=xzxkurl %>" target="rightFrame">����<span id="administrat"  class="hs">0</span>��</a>
								</td>
							</tr>
							<tr id="line7">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="myMail">
								<td height="18" class="xb" nowrap="nowrap">
									[�ҵ��ʼ�]��
								</td>
								<td height="18" class="zw" nowrap="nowrap">
									<a href="<%=path%>/mailAction.do?method=getMyMail" target="rightFrame">δ���ʼ�<span class="hs" id="mail">0</span>��</a>
								</td>
							</tr>
							<tr id="line8">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="msgWillPublish">
								<td height="18" class="xb" nowrap="nowrap" rowspan="2">
									[��Ϣ����]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/tbGovInfoPubMain.do?method=list&action=all&condition=willAudit" target="rightFrame">������<span class="hs" id="willAudit">${willAuditCount}</span>��</a>
									<a href="<%=path%>/infoAudit.do?method=findAuditList&condition=auditing" target="rightFrame">�����<span class="hs" id="auditing">${auditingCount }</span>��</a>
								</td>
							</tr>						
							<tr id="line9">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="fileTransmission">
								<td height="18" class="xb" nowrap="nowrap">
									[�ļ�����]��
								</td>
								<td height="18" class="zw" nowrap="nowrap" id="filesend">
									������<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line10">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="consultation">
								<td height="18" class="xb" nowrap="nowrap">
									[������ѯ]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/consultationSLWaitListAction.do?method=list" target="rightFrame"><span id="displyCounsult">������<span class="hs" id="counsultWait">0</span>��</span></a> 
									<a href="<%=path%>/consultationWaitListAction.do?method=list&type=20" target="rightFrame"><span id="displyCounsultZB">ת��<span class="hs" id="counsultZB">0</span>��</span></a>
									<a href="<%=path%>/consultationWaitListAction.do?method=list&type=10" target="rightFrame"><span id="displyCounsultLeadApprove">���쵼����<span class="hs" id="counsultLeadApprove">0</span>��</span></a>
								</td>
							</tr>
							<tr id="line11">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="appeal">
								<td height="18" class="xb" nowrap="nowrap">
									[����Ͷ��]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/appealSLWaitListAction.do?method=list" target="rightFrame"><span id="displyAppeal">������<span class="hs" id="appealWait">0</span>��</span></a> 
									<a href="<%=path%>/appealWaitListAction.do?method=list&type=20" target="rightFrame"><span id="displyAppealZB">ת��<span class="hs" id="appealZB">0</span>��</span></a>
									<a href="<%=path%>/appealWaitListAction.do?method=list&type=10" target="rightFrame"><span id="displyAppealLeadApprove">���쵼����<span class="hs" id="appealLeadApprove">0</span>��</span></a>
								</td>
							</tr>
							<tr id="line12">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
	 						<tr id="hotLine">
								<td height="18" class="xb" nowrap="nowrap">
									[ˮ������]��
								</td>
								<td height="18" class="zw">
									����<span class="hs">0</span>��
									��ת<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line13">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="msgResource">
								<td height="18" class="xb" nowrap="nowrap">
									[��Ϣ��Դ]��
								</td>
								<td height="18" class="zw">
									����<span class="hs">0</span>��
									��ת<span class="hs">0</span>��
								</td>
							</tr>
							<tr id="line14">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="mailBox">
								<td height="18" class="xb" nowrap="nowrap">
									[�ֳ�����]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/opinionSLWaitListAction.do?method=list" target="rightFrame"><span id="displyDirectorWait">����<span class="hs" id="directorWait">0</span>��</span></a>
									<a href="<%=path%>/opinionWaitListAction.do?method=list&type=20" target="rightFrame"><span id="displyDirectorZB">��ת<span class="hs" id="directorZB">0</span>��</span></a>
									<a href="<%=path%>/opinionWaitListAction.do?method=list&type=10" target="rightFrame"><span id="displyDirectorLeadApprove">���쵼����<span class="hs" id="directorLeadApprove">0</span>��</span></a>
								</td>
							</tr>
							<tr id="line15">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="archives">
								<td height="18" class="xb" nowrap="nowrap">
									[��������]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/auditListAction.do?method=auditList" target="rightFrame">������<span class="hs" id="archive">0</span>��</a>
								</td>
							</tr>
							<tr id="line16">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="note">
								<td height="18" class="xb" nowrap="nowrap">
									[�ҵĶ���]��
								</td>
								<td height="18" class="zw" nowrap="nowrap" id="mymessage">
									 δ������<span class="hs">0</span>��
								</td>
							</tr>						
							<tr id="line17">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>
							<tr id="XZXK_CC">
								<td height="18" class="xb" nowrap="nowrap">
									[����]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/checkKey.jsp?goto=<%=path%>/oademo/xzxkccaction.do?method=list" target="rightFrame">δ������<span class="hs" id="CC">0</span>��</a>
								</td>
							</tr>
							<tr id="line18">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>	
							<tr id="XZXK_Urger">
								<td height="18" class="xb" nowrap="nowrap">
									[�߰�]��
								</td>
								<td height="18" class="zw">
									<a href="<%=path%>/checkKey.jsp?goto=<%=path%>/oademo/xzxkmyurgeraction.do?method=list" target="rightFrame">δ���߰�<span class="hs" id="Urger">0</span>��</a>
								</td>
							</tr>
							<tr id="line19">
								<td height="1" colspan="2" background="../imagine/ddddd3.gif"></td>
							</tr>														
							<!-- </tr> -->
						</table>
					</td>
				</tr>

			</table>
</td></tr></table></form>	
</body>		
</html>
<script type="text/javascript">
function httpGet(sUrl){
	var sErrXML="<?xml version=\"1.0\" encoding=\"GBK\" ?><xml><msg>link error</msg><data></data></xml>";
	var activex=getXmlHttp();
	var oXML;
	try{
		activex.Open("GET",sUrl,false);
		activex.send();
		oXML=activex.responseXML.documentElement;
		if(oXML==null || !oXML.childNodes.length){throw "";}
	}catch(e){
		activex=getXmlDocument();
		activex.loadXML(sErrXML);
		oXML=activex.documentElement;
	}
	return oXML;
}

function getXmlHttp(){
	var activex;
	try{
		activex=new ActiveXObject("Microsoft.XMLHTTP");
		activex.abort();
	}catch(e){
		activex=new ActiveXObject("Msxml2.XMLHTTP");
	}
	return activex;
}

function getXmlDocument(){
	var activex=new ActiveXObject("Microsoft.XMLDOM");
	if (activex==null || activex.documentElement==null || activex.documentElement.childNodes==null){
   		activex=new ActiveXObject("Msxml2.DOMDocument");
  	}
	return activex;
}


/*���ظ��ִ���������begin */
 function creatReq() {
    var url="<%=path%>/mailAction.do?method=getUnReadMailCount"; 
    if(window.XMLHttpRequest){
      req=new XMLHttpRequest();
    }else if(window.ActiveXObject){
      req=new ActiveXObject("Microsoft.XMLHttp");
    }
    if(req) {
      req.open("GET",url,true); 
      req.onreadystatechange = getCount; 
      req.send(null); 
    }
}
        
function getCount() {
    if(req.readyState==4) {
       if(req.status==200) {
          Dispaly(); 
       }else{
          alert("����˷���״̬" + req.statusText);
       }
    }else {
      // document.getElementById ("mail").innerHTML ="���ݼ�����";
       //document.getElementById ("archive").innerHTML ="���ݼ�����";
      // document.getElementById ("filesend").innerHTML ="�յ�<span class='hs'> ���ݼ�����</span>������";
      // document.getElementById ("vehiclesApply").innerHTML ="�յ�<span class='hs'> ���ݼ�����</span>������";
      // document.getElementById ("mymessage").innerHTML ="�յ�<span class='hs'> ���ݼ�����</span>δ������";
      // document.getElementById ("auditing").innerHTML ="���ݼ�����";
      // document.getElementById ("willAudit").innerHTML ="���ݼ�����";
      // document.getElementById ("administrat").innerHTML ="���ݼ�����";
    }
}
function getObj(id){
	return document.getElementById(id);
}      
function Dispaly() {
	var xmldoc=req.responseXML;
	var newsItems = xmldoc.getElementsByTagName("message");
	var newsItem = newsItems[0]; 
	
	//����
	if(newsItem.getElementsByTagName("info")[14].text == 0 && newsItem.getElementsByTagName("info")[15].text == 0){
		getObj("receiveFile").style.display="none";
		getObj("line1").style.display="none";
	}else{
		getObj("receivefileWait").innerHTML = newsItem.getElementsByTagName("info")[14].text;
		getObj("receivefileProcess").innerHTML = newsItem.getElementsByTagName("info")[15].text;
	}
	//����
	if(newsItem.getElementsByTagName("info")[16].text == 0 && newsItem.getElementsByTagName("info")[17].text == 0){
		getObj("sendFile").style.display="none";
		getObj("line2").style.display="none";
	}else{
		getObj("sendfileWait").innerHTML = newsItem.getElementsByTagName("info")[16].text;
		getObj("sendfileProcess").innerHTML = newsItem.getElementsByTagName("info")[17].text;
	}
	//���ʽӴ�
	if(true){
		getObj("visit").style.display="none";
		getObj("line3").style.display="none";
	}
	//ǩ��
	if(true){
		getObj("sign").style.display="none";
		getObj("line4").style.display="none";
	}
	//����
	if(newsItem.getElementsByTagName("info")[3].text == 0){
		getObj("vehicle").style.display="none";
		getObj("line5").style.display="none";
	}else{
		getObj("vehiclesApply").innerHTML = '<a href="<%=path%>/tbVehiclesApplyApproval.do?method=list" target="rightFrame">������<span class="hs">'+newsItem.getElementsByTagName("info")[3].text +'</span>��</a>'; 
	}
	//�����Ҫ
	if(true){
		getObj("meeting").style.display="none";
		getObj("line6").style.display="none";
	}
	//�������
	if(newsItem.getElementsByTagName("info")[7].text == 0){
		getObj("govGrant").style.display="none";
		getObj("line7").style.display="none";
	}else{
		getObj("administrat").innerHTML = newsItem.getElementsByTagName("info")[7].text;
	}
	//�ҵ��ʼ�
	if(newsItem.getElementsByTagName("info")[1].text == 0){
		getObj("myMail").style.display="none";
		getObj("line8").style.display="none";
	}else{
		getObj("mail").innerHTML = newsItem.getElementsByTagName("info")[1].text; 
	}
	//��Ϣ����(�����)
	if(newsItem.getElementsByTagName("info")[5].text == 0 && newsItem.getElementsByTagName("info")[6].text == 0){
		getObj("msgWillPublish").style.display="none";
		//getObj("msgPublish").style.display="none";
		getObj("line9").style.display="none";
	}else{
		getObj("willAudit").innerHTML = newsItem.getElementsByTagName("info")[6].text;
		document.getElementById ("auditing").innerHTML = newsItem.getElementsByTagName("info")[5].text;
	}
	//�ļ�����
	if(newsItem.getElementsByTagName("info")[2].text == 0){
		getObj("fileTransmission").style.display="none";
		getObj("line10").style.display="none";
	}else{
		getObj("filesend").innerHTML = '<a href="<%=path%>/fileSendInListAction.do?method=list" target="rightFrame">������<span class="hs">'+newsItem.getElementsByTagName("info")[2].text +'</span>��</a>';  
	}
	//��ѯ
	if(newsItem.getElementsByTagName("info")[8].text == 0){
		getObj("consultation").style.display="none";
		getObj("line11").style.display="none";
	}else{ 
		if(newsItem.getElementsByTagName("info")[8].text == 0){
			getObj("displyCounsult").style.display="none";
		}else{
			getObj("counsultWait").innerHTML = newsItem.getElementsByTagName("info")[8].text; 
		}
		if(newsItem.getElementsByTagName("info")[9].text == 0){
			getObj("displyCounsultZB").style.display="none";
		}else{
			getObj("counsultZB").innerHTML = newsItem.getElementsByTagName("info")[9].text; 
		}
		if(newsItem.getElementsByTagName("info")[10].text == 0){
			getObj("displyCounsultLeadApprove").style.display="none";
		}else{
			getObj("counsultLeadApprove").innerHTML = newsItem.getElementsByTagName("info")[10].text; 
		}
	}
	//Ͷ��
	if(newsItem.getElementsByTagName("info")[11].text == 0){
		getObj("appeal").style.display="none";
		getObj("line12").style.display="none";
	}else{
		if(newsItem.getElementsByTagName("info")[11].text == 0){
			getObj("displyAppeal").style.display="none";
		}else{
			getObj("appealWait").innerHTML = newsItem.getElementsByTagName("info")[11].text; 
		} 
		if(newsItem.getElementsByTagName("info")[12].text == 0){
			getObj("displyAppealZB").style.display="none";
		}else{
			getObj("appealZB").innerHTML = newsItem.getElementsByTagName("info")[12].text; 
		}
		if(newsItem.getElementsByTagName("info")[13].text == 0){
			getObj("displyAppealLeadApprove").style.display="none";
		}else{
			getObj("appealLeadApprove").innerHTML = newsItem.getElementsByTagName("info")[13].text; 
		}
	}
	//ˮ������
	if(true){
		getObj("hotLine").style.display="none";
		getObj("line13").style.display="none";
	}
	//��Ϣ��Դ
	if(true){
		getObj("msgResource").style.display="none";
		getObj("line14").style.display="none";
	}
	//�ֳ�����
	if(newsItem.getElementsByTagName("info")[18].text == 0 && newsItem.getElementsByTagName("info")[19].text == 0 &&newsItem.getElementsByTagName("info")[20].text == 0){
		getObj("mailBox").style.display="none";
		getObj("line15").style.display="none";
	}else{
		if(newsItem.getElementsByTagName("info")[18].text == 0){
			getObj("displyDirectorWait").style.display="none";
		}else{
			getObj("directorWait").innerHTML = newsItem.getElementsByTagName("info")[18].text; 
		}  
		if(newsItem.getElementsByTagName("info")[19].text == 0){
			getObj("displyDirectorZB").style.display="none";
		}else{
			getObj("directorZB").innerHTML = newsItem.getElementsByTagName("info")[19].text; 
		}
		if(newsItem.getElementsByTagName("info")[20].text == 0){
			getObj("displyDirectorLeadApprove").style.display="none";
		}else{
			getObj("directorLeadApprove").innerHTML = newsItem.getElementsByTagName("info")[20].text; 
		}
	}
	//��������
	if(newsItem.getElementsByTagName("info")[0].text == 0 ){
		getObj("archives").style.display="none";
		getObj("line16").style.display="none";
	}else{
		getObj("archive").innerHTML = newsItem.getElementsByTagName("info")[0].text;
	}
	//�ҵĶ���
	if(newsItem.getElementsByTagName("info")[4].text == 0){
		getObj("note").style.display="none";
		getObj("line17").style.display="none";
	}else{
		getObj("mymessage").innerHTML = '<a href="<%=path%>/notReadMsgMessages.do?method=findNotReadMessages" target="rightFrame">δ������<span class="hs">'+newsItem.getElementsByTagName("info")[4].text +'</span>��</a>';  
	}
	//������ɳ���
	if(newsItem.getElementsByTagName("info")[21].text == 0){
		getObj("XZXK_CC").style.display="none";
		getObj("line18").style.display="none";
	}else{
		getObj("CC").innerHTML = newsItem.getElementsByTagName("info")[21].text;
	}
	//������ɴ߰�
	if(newsItem.getElementsByTagName("info")[22].text == 0){
		getObj("XZXK_Urger").style.display="none";
		getObj("line19").style.display="none";
	}else{
		getObj("Urger").innerHTML = newsItem.getElementsByTagName("info")[22].text;
	}		
}

creatReq();

/*���ظ��ִ���������end */
</script>
