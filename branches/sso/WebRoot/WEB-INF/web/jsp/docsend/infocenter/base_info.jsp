<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=path%>/js/calendar-dong.js"></script>
<script type="text/javascript">
<!--
var num = 1;
function additem(id){
	var row,cell,str; 
	row = document.getElementById(id).insertRow();
	if(row != null ){
		cell = row.insertCell();
		str="<input type="+'"'+"file"+'"'+" name=uploadFile["+ num +"].file onkeydown="+'"'+"event.returnValue=false;"+'"'+" onpaste="+'"'+" return false"+'"'+"><input type="+'"'+"button"+'"'+" value="+'"'+"ɾ��"+'"'+" onclick='deleteitem(this,"+'"'+id+'"'+");' class='button0'>";
		cell.innerHTML=str;
	}
	num++;
}
function deleteitem(obj,id){
	var rowNum,curRow;
	curRow = obj.parentNode.parentNode;
	rowNum = eval("document.all."+id).rows.length - 1;
	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
}
function deleteFile(obj){
	var tr=document.getElementById("tr"+obj);
	var fileId=document.getElementById("hid"+obj).value;
	var fileName = document.getElementById("fileName"+obj).value;
	if(confirm("��ȷ��Ҫɾ������\""+fileName+"\"��")){
		tr.style.display='none';
		//ɾ���ļ�
		try{
			xmlHttp = getXMLHTTPObj();
			if(xmlHttp){
				var url = "<%=path%>/docAttach.do?method=delete&id="+fileId;
				xmlHttp.open("GET", url, true);
				xmlHttp.onreadystatechange = new function(){};
				xmlHttp.send(null);
			}
		}catch (e){
		}
	}
}
function alertError(){
	var errorString = "${errorString}";
	if(errorString!="" && errorString!="null"){
		alert(errorString);
	}
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
function leaderPostil(){
	otext = document.getElementById("sign");
	var rs = prompt("��������ʾ��","");
	if(rs){
		otext.value=rs+"---${SYSTEM_USER_SESSION.name}�쵼  "+getNow();
	}
}
function leaderSay(){
	osrc = event.srcElement;
	otext = document.getElementById("sign");
	if(osrc.value=="1"){
		otext.value="����";
	}else if(osrc.value=="2"){
		otext.value="ͬ��";
	}
	otext.value+="---${SYSTEM_USER_SESSION.name}�쵼  "+getNow();
}
function getNow(){
	today = new Date();
	sday = fmtl(today.getYear(),4)+"-"+fmtl(today.getMonth()+1,2)+"-"+fmtl(today.getDate(),2);
	stime = fmtl(today.getHours(),2)+":"+fmtl(today.getMinutes(),2);
	return sday+" "+stime;
}
function fmtl(s,l){
	ss = ""+s;
	if(ss.length<l){
		for(i=0;i<l-ss.length;i++){
			ss = "0"+ss;
		}
	}
	return ss;
}
function clearSay(stext){
	document.getElementById(stext).value="";
}
function onlyNum(){ 
	if(!(event.keyCode==46)&&!(event.keyCode==8)&&!(event.keyCode==37)&&!(event.keyCode==39)) 
	if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105))) 
		event.returnValue=false; 
}
function returnback(){
	xdocSendForm.method.value="rollBack";
	window.showModalDialog("<%=path%>/xdocSendRelatedAction.do?method=turnback&showText=backControl&docId="+xdocSendForm.docId.value,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
}
function selectuser(flag,argDeptOrUser,tid,tname){
	window.showModalDialog("<%=path%>/orgtreeaction.do?method=listCheckedUser&roleid=851a36fb19078db2011907a09e390003&source=shouwenuser&idText="+tid+"&nameText="+tname+"&deptOrUser="+argDeptOrUser+"&flag="+flag,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
	
}
function selectdept(flag,argDeptOrUser,tid,tname){
	window.showModalDialog("<%=path%>/orgtreeaction.do?method=listCheckedUser&roleid=851a36fb19078db2011907a09e390003&source=shouwendept&idText="+tid+"&nameText="+tname+"&deptOrUser="+argDeptOrUser+"&flag="+flag,window,'dialogwidth:450px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');

}
function changeSecret(){
	var osrc = event.srcElement;
	var obj = document.getElementById("secret2");
	obj.options.length=0
	if(osrc.value=="�����빫��"){
		obj.options.add(new Option("�ڲ���Ϣ","�ڲ���Ϣ"));
		obj.options.add(new Option("���涨����������Ϣ","���涨����������Ϣ"));
	}else if(osrc.value=="���蹫��"){
		obj.options.add(new Option("����","����"));
		obj.options.add(new Option("����","����"));
		obj.options.add(new Option("����","����"));
		obj.options.add(new Option("���涨����ʮ��","���涨����ʮ��"));
	}
}
function changeFileType(){
	var osrc = event.srcElement;
	if(osrc.value=="������Ϣ"){
		document.getElementById("secretSelect").style.display="";
	}else if(osrc.value=="��������Ϣ"){
		document.getElementById("secretSelect").style.display="none";
	}
}
function checkFileType(){
	var obj = document.getElementById("fileType");
	if(obj.value=="������Ϣ"){
		document.getElementById("secretSelect").style.display="";
	}else if(obj.value=="��������Ϣ"){
		document.getElementById("secretSelect").style.display="none";
	}
}
function chooseDept(tname,type){
	window.showModalDialog("<%=path%>/docSendRelatedAction.do?method=deptSel&type="+type+"&nameText="+tname,window,'dialogwidth:650px;dialogheight:480px;help:0;center:yes;resizable:0;status:0;scroll:yes');
}
function chooseWord(){
	window.showModalDialog("<%=path%>/docSendRelatedAction.do?method=mainTitle",window,'dialogwidth:800px;dialogheight:600px;help:0;center:yes;resizable:0;status:0;scroll:yes');
}
function adddoc(){
	var docId = document.getElementById("docId");
	if(docId.value==""){
		startRequest();
	}
	var dtype = document.getElementById("sendFileTypeX").value;
	if(dtype=="��ί���ĸ�ֽ"){
		dtype="2";
	}else{
		dtype="1";
	}
	var fileTitle = document.getElementById("fileTitle").value;
	var sendMain = document.getElementById("sendMain").value;
	var sendSecond = document.getElementById("sendSecond").value;
	var topicWord = document.getElementById("topicWord").value;
	window.open("<%=path%>/docAttach.do?method=goDocContext&docId="+docId.value+"&fileTitle="+fileTitle+"&sendMain="+sendMain+"&sendSecond="+sendSecond+"&topicWord="+topicWord+"&dtype="+dtype,"newwindow", "toolbar=no, menubar=no,resizable=yes");
}
function moddoc(fileId){
	var docId = document.getElementById("docId");
	window.open("<%=path%>/docAttach.do?method=goDocContext&docId="+docId.value+"&fileId="+fileId,"newwindow", "toolbar=no, menubar=no,resizable=yes");
}
function getInputTag(){
	return "<font color='red'>*</font>";
}
//-->
</script>
			<table align="center" width="99%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td><html:select property="sendFileTypeX" style="display:none">
					<html:option value="�������ĸ�ֽ"></html:option>
					<html:option value="��ί���ĸ�ֽ"></html:option>
					</html:select>
					<span id="sendFileTypeXName">
					<bean:write name="xdocSendForm" property="sendFileTypeX"/>
					</span></td>
				<td align="right">
				�ļ����ʣ�<html:select property="fileType" onchange="changeFileType()" style="display:none">
					<html:option value="������Ϣ"></html:option>
					<html:option value="��������Ϣ"></html:option>
					</html:select>
					<span id="fileTypeName">
					<bean:write name="xdocSendForm" property="fileType"/>
					</span>
				<span id="secretSelect">
				&nbsp;
				��Ϣ�ȼ���<html:select property="secret1" onchange="changeSecret()" style="display:none">
					<html:option value="��������"></html:option>
					<html:option value="�����빫��"></html:option>
					<html:option value="���蹫��"></html:option>
					</html:select>
			<html:select property="secret2" style="display:none">
			<logic:equal name="xdocSendForm" property="secret1" value="�����빫��">
			<html:option value="�ڲ���Ϣ"></html:option>
			<html:option value="���涨����������Ϣ"></html:option>
			</logic:equal>
			<logic:equal name="xdocSendForm" property="secret1" value="���蹫��">
			<html:option value="����"></html:option>
			<html:option value="����"></html:option>
			<html:option value="����"></html:option>
			<html:option value="���涨����ʮ��"></html:option>
			</logic:equal>
			</html:select>
			<span id="secretName">
			<bean:write name="xdocSendForm" property="secret1"/>-<bean:write name="xdocSendForm" property="secret2"/>
			</span>
			</span>
			</td></tr></table>
			<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
				<thead>
					<tr>
						<td colspan="8" align="right">
						<table border="0" cellpadding="0" cellspacing="0"><tr>
						<td height="24" nowrap>�ܼ���</td>
						<td><html:select property="fileSecret" style="display:none">
						<html:option value="һ��"></html:option>
						<html:option value="����"></html:option>
						<html:option value="����"></html:option>
						<html:option value="����"></html:option>
						</html:select>
						<span id="fileSecretName"><bean:write name="xdocSendForm" property="fileSecret"/></span>
						</td></tr>
						</table>
						</td>
					</tr>
					<tr>
			    		<td nowrap width="60" height="24" align="center">�������</td>
			    		<td colspan="7">
				    		<html:select property="sendFileType" style="display:none">
							<html:option value="������"></html:option>
							<html:option value="ƽ����"></html:option>
							<html:option value="������"></html:option>
							</html:select>
			    			<span id="sendFileTypeName"><bean:write name="xdocSendForm" property="sendFileType"/></span>
			    		<font color="red">
    		            <span id="fwriteTime"></span>
    		            </font>
			    		</td>
			    	</tr>
					<tr>
			    		<td nowrap height="24" align="center">�ļ�����</td>
			    		<td colspan="7">
			    		<html:text property="fileTitle" maxlength="100" styleClass="tab_input2" readonly="true"></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td nowrap height="24" align="center">���Ļ���</td>
			    		<td colspan="7"><html:text property="fileDept" maxlength="100" styleClass="tab_input2" readonly="true"/>
			    		<input type="button" id="bt_fileDept" value="ѡ��λ" onclick="chooseDept('fileDept',8)" style="display:none" class="button0">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td nowrap height="24" align="center">����</td>
			    		<td colspan="7"><html:text property="sendMain" maxlength="10" styleClass="tab_input2" readonly="true"></html:text>
			    		<input type="button" id="bt_sendMain" value="ѡ��λ" onclick="chooseDept('sendMain',1)" style="display:none" class="button0">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td nowrap height="24" align="center">����</td>
			    		<td colspan="7"><html:text property="sendSecond" maxlength="10" styleClass="tab_input2" readonly="true"></html:text>
			    		<input type="button" id="bt_sendSecond" value="ѡ��λ" onclick="chooseDept('sendSecond',1)" style="display:none" class="button0">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td nowrap height="24" align="center">�����</td>
			    		<td colspan="7">
			    		<html:text property="topicWord" maxlength="10" styleClass="tab_input2" readonly="true"></html:text>
			    		<input type="button" id="bt_topicWord" value="ѡ�������" onclick="chooseWord()" style="display:none" class="button0">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td nowrap height="24" align="center">��������</td>
			    		<td colspan="7">
			    		<table border="0" cellpadding="0" cellspacing="0" id="docContextTb">
			    		<tr id="tr_adddoc" style="display:none"><td class="bg-zw">
						<a href="#" onclick="adddoc();return false;"><font color="red">��������</font></a>
						</td></tr>
						<logic:notEmpty name="docfileList">
						<logic:iterate id="item" name="docfileList" type="com.baosight.mode.TbDocAttach">
						<tr><td id="${item.id}"><a href="#" onclick="moddoc('${item.id}');return false;"><bean:write name="item" property="originallyName"/></a></td></tr>
						</logic:iterate>
						</logic:notEmpty>
						</table>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td nowrap align="center">ǩ��</td>
			    		<td colspan="7">
			    		<html:textarea property="sign" style="color: 4c6a95;ext-indent: 1pt;height: 60px;border: 1px solid #a5a5a5;" readonly="true" cols="60" rows="5"></html:textarea>
			    		<table id="signSelect" border="0" cellpadding="0" style="display:none"
			    			cellspacing="0" width="100%">
			    		<tr>
			    		<td nowrap>
			    		<input type="radio" name="signrRadio" value="1" onclick="leaderSay()"/>����&nbsp;
			    		<input type="radio" name="signrRadio" value="2" onclick="leaderSay()"/>ͬ��&nbsp;
			    		<a href="#" onclick="leaderPostil();return false;">��ʾ</a>&nbsp;
			    		<input type="button" value="����" onclick="clearSay('sign');returnback()" class="button0">
			    		</td></tr>
			    		</table>
		    		</td>
			    	</tr>
			    	<tr>
			    		<td align="center" height="25">�����</td>
			    		<td><html:text property="draftUser" styleClass="tab_input3" readonly="true" /></td>
			    		<td width="60" align="center">������</td>
			    		<td colspan="5"><html:text property="chargeUser" styleClass="tab_input3" readonly="true" /></td>
			    	</tr>
			    	<tr>
			    		<td align="center" height="25">�ĺ�</td>
			    		<td><html:text property="fileNo" styleClass="tab_input3" readonly="true" /></td>
			    		<td align="center">��ӡ��</td>
			    		<td><html:text property="printUser" styleClass="tab_input3" readonly="true" /></td>
			    		<td width="60" align="center">У����</td>
			    		<td colspan="3"><html:text property="collateUser" styleClass="tab_input3" readonly="true" /></td>
			    	</tr>
			    	<tr>
			    		<td align="center" height="25">����</td>
			    		<td><html:text property="fileNum" onkeydown="onlyNum();" styleClass="tab_input3" readonly="true" /></td>
			    		<td width="60" align="center">ҳ��</td>
			    		<td><html:text property="filePages" onkeydown="onlyNum();" styleClass="tab_input3" readonly="true" /></td>
			    		<td align="center">�鵵���</td>
			    		<td>
			    		<html:select property="fileCategory" onblur="chk();" style="display:none">
			    			<html:options collection="archiveTypeList" property="name"/>
			    		</html:select>
			    		<span id="fileCategoryName"><bean:write name="xdocSendForm" property="fileCategory"/></span>
			    		</td>
			    		<td align="center" nowrap>��������</td>
			    		<td><html:text property="fileDate" styleClass="tab_input3" readonly="true" onfocus="setday(this)"/></td>
			    	</tr>
			    	<tr>
						<td nowrap align="center">
							����
						</td>
						<td colspan="7">
<logic:present name="files">	
<table>
	<logic:iterate id="Record" indexId="i" name="files" type="com.baosight.mode.TbDocAttach" >
		<tr id="tr${i}">
			<td>
			<html:link page="/docAttach.do?method=download" paramId="id" paramName="Record" paramProperty="id">
				<bean:write name="Record" property="originallyName"/>
			</html:link>
			<input type="button" onclick="deleteFile(${i})" value="ɾ��" class="button0" />
			<input type="hidden" id="hid${i}" value="${Record.id}" />
			<input type="hidden" id="fileName${i}" value="${Record.originallyName}">
			<td>
		</tr>
	</logic:iterate>
</table>
</logic:present>
							<table id="filetb" cellpadding="0" cellspacing="1"></table>
							<div id="divBtnAdd">
								<input type="button" name="btnAddFile" value="��Ӹ���" onclick="additem('filetb')" class="button0"/>
								<font color="red">�ϴ������ļ����ܴ���10M!</font>
							</div>
						</td>
					</tr>
				</thead>
			</table>
			<input type="hidden" id="backControl" name="backControl">
		<html:hidden property="docId"/>
		<html:hidden property="controlId"/>