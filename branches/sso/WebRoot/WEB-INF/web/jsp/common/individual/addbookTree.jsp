<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<title>����ͨѶ¼</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/xtree.css">
		<script src="<%=path%>/javascript/addbookAjaxTree.js"></script>
	</head>
	<body>
	<form id="list" name="list" method="post">
				<DIV id="tree"
				style="position: absolute; width: 100%; top: 0px; left: 0px; height: 100%; padding: 5px; overflow: auto;">
				<table border="0">
					<tr>
						<td>
							<font size="-2"><a
								style="font-size:7pt;text-decoration:none;color:silver;"
								href="http://www.treemenu.net/" target="_blank">&nbsp;</a> </font>
						</td>
					</tr>
				</table>
				<script language="javascript" type="text/javascript">
					//�������ʵ��
					var dhATV = new dhAjaxTreeView();
					//���ض���ʵ����
					dhATV.treeTagName = "dhATV";
					//���ø��ڵ�����
					dhATV.rootText = "����ͨѶ¼";			
					//���ý�����ִ�С
					dhATV.textsize = "12px";
					//����ͼ���ļ���
					dhATV.icoFolder = "<%=path%>/imagine/tree";
					//���������ַ
					dhATV.postUrl = "<%=path%>/individualTree.do?method=showTree&parentId=";
					//���ýڵ��¼�
					//dhATV.nodeEvent = function(cs){edit(cs);}
					dhATV.nodeEvent = function(cs){
						return false;
					}
					dhATV.nodeEventForAll = true;
					//���������ڵ�
					dhATV.setup(document.getElementById("tree"));
					dhATV.showNode(document.getElementById("tree").childNodes[0]);			
				</script>
				<NOSCRIPT>
					��ʾʧ��,�뼤�������JavaScript���ܣ�
				</NOSCRIPT>
				<table width="98%" border="0" align="center" cellpadding="0"
					cellspacing="1" class="table3">
					<thead class="t">
						<tr>
							<td width="60%" align="left">
				<input type="button" value="�ύ" onclick="submitTree()">
				<input type="button" value="ȡ��" onclick="cancelTree()">
							</td>
						</tr>
					</thead>
				</table>
			</DIV>
			</form>

	</body>
<script type="text/javascript">
var chooseIds="";
var chooseNames="";
var chooseMobiles="";
var chooseGroups="";
function submitTree(){
//	alert("11");
//	var root = dhATV.getRoot();
//	alert(root.textvalue);
//	bleveryNode(root);
	var inputs = document.getElementsByTagName("input");
	if(inputs && inputs.length){
		for(i=0;i<inputs.length;i++){
			var node = inputs[i];
			if(node.type=="checkbox" && node.isNode=="false" && node.checked){
				if(chooseIds!=""){
					chooseIds+=",";
					chooseNames+=",";
					chooseMobiles+=",";
					chooseGroups+=",";
				}
				chooseIds+=node.id.replace("-cb","");
				var name = node.text.split("(")[0];
				var mobile = node.text.split("(")[1];
				mobile = mobile.substring(0,mobile.length-1);
				chooseNames+=name;
				chooseMobiles+=mobile;
				chooseGroups+=node.parId;
			}
		}
	}
	//alert(chooseIds);
	//alert(chooseNames);
	//alert(chooseMobiles);
	//alert(chooseGroups);
	opener.document.getElementById("${param.idText}").value=chooseIds;
	opener.document.getElementById("${param.nameText}").value=chooseNames;
	opener.document.getElementById("${param.mobileText}").value=chooseMobiles;
	<c:if test="${param.groupsText!=null}">
	opener.document.getElementById("${param.groupsText}").value=chooseGroups;
	</c:if>
	window.close();
}
function bleveryNode(node){
	var childs = node.childNodes;
	for(var i=0;i<childs.length;i++){
		var myNode = childs[i];
		if(myNode && myNode.childNodes.length==0){
			doMyAction(myNode);
		}else{
			bleveryNode(myNode);
		}
	}
}
function doMyAction(node){
	//alert("Ҷ�ӽڵ�:"+node.id+" "+node.textvalue);
	//alert(node.innerHTML);
	if(document.getElementById(node.id+"-cb").checked){
		if(chooseIds!=""){
			chooseIds+=",";
			chooseNames+=",";
			chooseMobiles+=",";
		}
		chooseIds+=node.id;
		var name = node.textvalue.split("(")[0];
		var mobile = node.textvalue.split("(")[1];
		mobile = mobile.substring(0,mobile.length-1);
		chooseNames+=name;
		chooseMobiles+=mobile;
	}
}
function cancelTree(){
	window.close();
}
</script>
</html>
