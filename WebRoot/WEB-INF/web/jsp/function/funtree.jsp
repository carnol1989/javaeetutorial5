<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<html>
	<head>
		<html:base target="_self" />
		<script language="javascript" type="text/javascript"
			src="../../../../javascript/functionTree.js"></script>
	</head>
	<body bgcolor="#f2f9f9" leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
		<input type="hidden" id="path" value="<%=request.getContextPath()%>" />
		<DIV id="tree"
			style="position: absolute; width: 100%; top: 0px; left: 0px; height: 100%; padding: 5px; overflow: auto;">
			<table border="0">
				<tr>
					<td>
						<font size="-2"><a
							style="font-size:7pt;text-decoration:none;color:silver;"
							href="http://www.treemenu.net/" target="_blank">&nbsp;</a>
						</font>
					</td>
				</tr>
			</table>
		</DIV>
		<script language="javascript" type="text/javascript">
			//�������ʵ��
			var dhATV = new dhAjaxTreeView();
			//���ض���ʵ����
			dhATV.treeTagName = "dhATV";
			//���ø��ڵ�����
			dhATV.rootText = "�Ϻ���ˮ���";			
			//���ý�����ִ�С
			dhATV.textsize = "12px";
			//����ͼ���ļ���
			dhATV.icoFolder = "../../../../imagine/tree";
			//���������ַ
			dhATV.postUrl = "/sso/base/function/forwardFunction.do?method=showFunTree&fid=";
			//���ýڵ��¼�
			//dhATV.nodeEvent = function(cs){edit(cs);}
			dhATV.nodeEvent = function(cs){
				var funId = cs.getAttribute("atid");
				var funName = cs.getAttribute("textvalue");
				var funKey = cs.getAttribute("funKey");
				var sysId = cs.getAttribute("sysId");
				var parId = cs.getAttribute("parId");
				var isNode = cs.getAttribute("isNode");
				var insure= cs.getAttribute("insure");
				
				window.parent.document.getElementById("funId").value = funId;
				window.parent.document.getElementById("funKey").value = funKey;
				window.parent.document.getElementById("sysId").value = sysId;
				window.parent.document.getElementById("parId").value = parId;
				window.parent.document.getElementById("isNode").value = isNode;
				window.parent.document.getElementById("insure").value = insure;
				
				window.parent.document.getElementById("funName").innerHTML = funName;
				//alert("funId:"+funId+"-----------funName:"+funName+"----------funKey:"+funKey+"---------sysId:"+sysId+"-------parId:"+parId+"--------isNode:"+isNode+"---------insure:"+insure);
		    	var path = document.getElementById("path").value;
		    	if (funId == "" || funId == '0'){
		    		alert("��ǰû��ѡ���޸ĵ���Դ");
		    	}else{
		    		window.open(path+"/base/function/forwardFunction.do?method=inputUpdateFun&id="+funId+"&sid="+sysId,"opf"); 
		    	}				
			}
			dhATV.nodeEventForAll = true;
			//���������ڵ�
			dhATV.setup(document.getElementById("tree"));
			dhATV.showNode(document.getElementById("tree").childNodes[0]);
		</script>
		<NOSCRIPT>
			��ʾʧ��,�뼤�������JavaScript���ܣ�
		</NOSCRIPT>
	</body>
</html>

