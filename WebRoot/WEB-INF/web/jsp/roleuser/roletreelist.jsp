<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbRole"/>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List allRole = (List)request.getAttribute("allrole");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'MyJsp.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/xtree.css">
		<script src="<%=path%>/javascript/xtreeforrole.js"></script>
	</head>
	<script type="text/javascript">
	  //sText, sAction, sBehavior, sIcon, sOpenIcon, sNid, isDep
	  var tree = new WebFXTree('<%="���н�ɫ"%>','javascript:xClick(\'<%="allroles"%>\');','','','','<%="allroles"%>','1');
	  //alert(tree);
	  tree.setBehavior('classic');
	  
	  var myTree = null;
	  
	  //sText, sAction,sNid, isDep, sIcon, sOpenIcon, eParent
	  //
	  //sNid:�ڵ��id
	  //isDep:�ڵ��icon��ǣ�
	  //��Ϊ1ʱ��
	  //this.icon = webFXTreeConfig.folderIcon; 
	  //this.openIcon = webFXTreeConfig.openFolderIcon;
	  //��Ϊ2ʱ��
	  //this.icon = webFXTreeConfig.dutyIcon;
	  //this.openIcon = webFXTreeConfig.openDutyIcon;
	  //��Ϊ����ֵʱ��
	  //this.icon = webFXTreeConfig.fileIcon;
	  //this.openIcon = webFXTreeConfig.fileIcon;           
	  //var danwei = new WebFXTreeItem('��λ','javascript:xClick(\'D1\');','D1','1');
	  //tree.add(danwei);
	  //var bumen = new WebFXTreeItem('����','javascript:xClick(\'D2\');','D2','1');
	  //danwei.add(bumen);
	  //var zhiwu = new WebFXTreeItem('ְ��','javascript:xClick(\'D3\');','D3','2')
	  //bumen.add(zhiwu)
	  //var ren = new WebFXTreeItem('��Ա','javascript:xClick(\'D4\');','D4','3');
	  //zhiwu.add(ren);
	  //var ren2 = new WebFXTreeItem('��Ա2','javascript:xClick(\'D5\');','D5','3');
	  //ren.add(ren2);
	  
	  
	  <%
	  	for (Iterator iter = allRole.iterator(); iter.hasNext();) {
	  		Object node = iter.next();
	  			TbRole role = (TbRole)node;
	  			%>
	  			myTree = tree.getNodeID('<%="allroles"%>');
	  			myTree.add(new WebFXTreeItem('<%=role.getName()%>','javascript:xClick(\'' +'<%=role.getId()%>' +'\');','<%=role.getId()%>','1'));
	  			<%
	  	}
	  %>
	  
	  
	  document.write(tree);
	  tree.expandAll(1);
	</script>
	<body bgcolor="#f2f9f9">
		<form name="form4tree" method="post" action=""></form>
	</body>



<script type="text/javascript">
function  addNode(Name,iID) {
	if (tree.getSelected()) {
		var h = new WebFXTreeItem(Name,'javascript:userNodeClick(\'' +iID +'\');',iID,'0');
		tree.getSelected().add(h);
		return h.id;
	}
}

function addDutyNode(Name,iID) {
	if (tree.getSelected()) {
		var h = new WebFXTreeItem(Name,'javascript:pstNodeClick(\'' +iID +'\');',iID,'2');
		tree.getSelected().add(h);
		return h.id;
	}
}

function addNodes(Name,iID) {
	if (tree.getSelected()) {
		var h = new WebFXTreeItem(Name,'javascript:xClick(\'' +iID +'\');',iID,'1');
		tree.getSelected().add(h);
		return h.id;
	}
}

function changeNodeName(Name,iID) {
	var foo;
	foo = tree.getNodeID(iID);
	if (foo){

		foo.changeName (Name);
	}
}

function isHasChild(){
	if (tree.getSelected()) {
		var strID ;
		strID = tree.getSelected().getChildrenID();
		if (strID.indexOf("#")>0) return 0;
		return 1;
	}
}
function delNode(ID) {
	var delN ;
	delN = tree.getNodeID(ID);
	if (delN) {
		var strID ;
		strID = delN.getChildrenID();
		if (strID.indexOf("#")>0){
			alert("�ò��Ű�������Ա�����Ӳ��ţ�����ɾ��������ɾ����Ա���Ӳ��ţ�");
			return -1;
		}
		delN.remove();
		return strID;
	}
}
function delDutyNode(ID) {
	var delN ;
	delN = tree.getNodeID(ID);
	if (delN) {
		var strID ;
		strID = delN.getChildrenID();
		if (strID.indexOf("#")>0){
			alert("��ְ���������Ա������ɾ��������ɾ����Ա��");
			return -1;
		}
		delN.remove();
		return strID;
	}
}

function xClick(p_url){
	//alert(p_url);
	if(p_url==""){return ;}
	document.form4tree.target="detail";
	document.form4tree.action="<%=path %>/orgtreeaction.do?method=listCheckedUser&nodetype=deptnode&nodeid=e584b88cc02f49c0b0da6db657f8fd83&roleid=" + p_url;
	document.form4tree.submit();
	setFocus(event.srcElement);
//	this.parent.main.location.href="Detail.jsp?ID="+p_url;
}
selectedNode = null;

function setFocus (obj) {
//alert("setFocus");
	if (selectedNode != null) {
		selectedNode.style.border = "none";
		selectedNode.style.backgroundColor = "";
		selectedNode.style.color = "";
	}
	selectedNode = obj;
	selectedNode.style.border = "1px solid buttonshadow";
	selectedNode.style.backgroundColor = "highlight";
	selectedNode.style.color = "white";
}
function addDepart(){
	if(tree.getSelected()){
		var isDpm = '';
		isDpm = isSelDpm();
		if (isDpm == '0'){
			alert("��Ա���������¼����ţ�");
			return ;
		}
		if (isDpm == '2'){
			alert("ְ���������¼����ţ�");
			return ;
		}
		document.form4tree.target="main";
		document.form4tree.action="addDepartment.jsp?ID=" + tree.getSelected().id;
		document.form4tree.submit();
	}else{
		alert("��ѡ������Ӳ��ŵ��ϼ����ţ�");
	}
}

function addDuty(){
	if(tree.getSelected()){
		var isDpm = '';
		isDpm = isSelDpm();
		if (isDpm == '0'){
			alert("ֻ�в��Ų�������ְ��");
			return ;
		}
		if (isDpm == '2'){
			alert("ֻ�в��Ų�������ְ��");
			return ;
		}
		document.form4tree.target="main";
		document.form4tree.action="addDuty.jsp?ID=" + tree.getSelected().id;
		document.form4tree.submit();
	}else{
		alert("��ѡ�������ְ��Ĳ��ţ�");
	}
}


function addPeople(){
	if(tree.getSelected()){
		var isDpm = '';
		isDpm = isSelDpm();
		if (isDpm == '0'){
			alert("ֻ��ְ����������¼���Ա��");
			return ;
		}
		if (isDpm == '1'){
			alert("ֻ��ְ����������¼���Ա��");
			return ;
		}
		document.form4tree.target="main";
		document.form4tree.action="addPeople.jsp?ID=" + tree.getSelected().id;
		document.form4tree.submit();
	}else{
		alert("��ѡ���������Ա��ְ��");
	}
}

function  showNode() {
	if (tree.getSelected()) {
		return tree.getSelected().id;
	}
}

function  isSelDpm() {
	if (tree.getSelected()) {
		return tree.getSelected().isDpm;
	}
}

function  showtree(ndid) {
	var f;
	f = tree.getNodeID(ndid);
	if (f){
		return f;
	}
}
</script>


</html>
