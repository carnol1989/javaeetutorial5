<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbInfoPubCla"/>
<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List claList1 = (List)request.getAttribute("claList");
	List claList = null;
	Object[] system =null;
	if (claList1!=null && !claList1.isEmpty()) {
	claList = claList1.subList(1,claList1.size());
	system = (Object[])claList1.get(0);
	}
	String action=(String)request.getAttribute("action");
	String oneormore = request.getParameter("oneormore");//public to one or more
	String type = request.getParameter("type");//type for infopub or govinfopub
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%if (claList1!=null && !claList1.isEmpty()) {%>
	<head>
		<base href="<%=basePath%>">

		<title><%=system[2] %>���б�</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/xtree.css">
		<script src="<%=path%>/javascript/clatree.js"></script>
		<script type='text/javascript'
			src='<%=strpath%>/dwr/interface/selectcla.js'></script>
	</head>
	<script type="text/javascript">

	  var tree = new WebFXTree('<%=system[2]%>','','','','','<%=system[1]%>','1');

	  tree.setBehavior('classic');
	  
	  var myTree = null;
	  
	  <%
	  	for (Iterator iter = claList.iterator(); iter.hasNext();) {
	  		
	  			Object node = iter.next();
	  			Object[] infoPubCla = (Object[])node;
	  			String parentId = (String)infoPubCla[4];
	  				%>
	  				myTree = tree.getNodeID('<%=parentId%>');
	  				if ('<%=parentId%>'=='0')
	  					myTree.add(new WebFXTreeItem('<%=infoPubCla[2]%>','','<%=infoPubCla[1]%>','1'));	  			
	  				else
	  					myTree.add(new WebFXCheckBoxTreeItem('<%=infoPubCla[2]%>','',false,'<%=infoPubCla[1]%>','1','',''));
	  				<%
	  			}%>
	  document.write(tree);
	  tree.expandAll(-1);
	</script>
	
	<body>
		<input type="hidden" name="infoClaIds" value="">
		<input type="hidden" name="infocla" value="">
		<input type="hidden" name="infoclas" value="">
		<input type="hidden" name="attr2" value="">
		<input type="hidden" name="action" value="<%=action %>">
		<table>
			<tr>
				<td>				
				 <input type="button" value="�ύ" onclick="claSelSub();" />
				</td>
			</tr>
		</table>
		<form name="form4tree" method="post" action="">
		</form>
	</body>
	<%} 
	else {%>δΪ���û������Ȩ�ޣ�<%}
	%>



<script type="text/javascript">
function claSelSub() {
	//�õ�����ѡ�еĲ�����Աid
	var infoClaId = "";
	var nodes = document.getElementsByTagName("input");
	var num=0;
	for (var i = 0; i < nodes.length; i++) {
		var check = nodes[i];
		if(typeof(nodes[i]) != "undefined" && nodes[i].id!="" && nodes[i].checked==true && nodes[i].isDpm == '1'){
			if(infoClaId.length==0)
			{
				infoClaId=infoClaId+nodes[i].id;
				num++;
			}else
			{
				infoClaId=infoClaId+","+nodes[i].id;
				num++;
			}
		}
	}
	if ("<%=type%>"=="infopub") {
		if ("<%=oneormore%>"=="one"){
			document.all.infoClaIds.value=infoClaId;
			
			if (num>1){
				alert("��Ϣ������Ŀѡ���ܹ�����һ����");
				return false;
			}
			selectCla();
			alert("��Ŀѡ��ɹ���");
			
			window.dialogArguments.document.getElementById("claId").value=infoClaId
			window.dialogArguments.document.getElementById("infocla").value=document.all.infocla.value;
		}
	else {
		document.all.infoClaIds.value=infoClaId;
		selectClas();
		alert("����Ŀ����ѡ��ɹ���");
		if(window.dialogArguments.document.getElementById("clasel").value=="")
		{
			window.dialogArguments.document.getElementById("clasel").value=infoClaId;
		}
		else
		{
			window.dialogArguments.document.getElementById("clasel").value=window.dialogArguments.document.getElementById("clasel").value+","+infoClaId;
			//window.dialogArguments.document.getElementById("infoclas").value=window.dialogArguments.document.getElementById("infoclas").value+","+document.all.infoclas.value;
		}	
		window.dialogArguments.document.getElementById("infoclas").value=document.all.infoclas.value;
	 }
	
	}
	else if ("<%=type%>"=="govinfopub"){
		document.all.infoClaIds.value=infoClaId;
		if ("<%=oneormore%>"=="one" && num>1){
			alert("����Ϊ������Ϣ��Ŀѡ���ܹ�����һ����");
			return false;
		}
		else {
			selectGovCla();
			alert("��Ŀѡ��ɹ���");
			window.dialogArguments.document.getElementById("pubcominfo").value=infoClaId;
			window.dialogArguments.document.getElementById("attr2").value=document.all.attr2.value;
		}
	}
		window.close();
}
</script>


</html>
