<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<html>
	<head>
		<html:base target="_self" />
		<script language="javascript" type="text/javascript"
			src="../../../../javascript/roleauthTree.js"></script>
	</head>
	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
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
			dhATV.rootText = "�Ϻ���ˮ���ͳ";			
			//���ý�����ִ�С
			dhATV.textsize = "12px";
			//����ͼ���ļ���
			dhATV.icoFolder = "../../../../imagine/tree";
			//���������ַ
			dhATV.postUrl = "/sso/base/roleAuth/forwardRoleAuth.do?method=showRoleAuthTree&rid=";
			//���ýڵ��¼�
			//dhATV.nodeEvent = function(cs){edit(cs);}
			dhATV.nodeEvent = function(cs){
				var id = cs.getAttribute("atid");
				var roleName = cs.getAttribute("textvalue");
				window.parent.document.getElementById("roleId").value = id;				
				window.parent.document.getElementById("roleName").innerHTML = roleName;
				//alert("roleId:"+id+"-----------roleName:"+roleName);
				if(id!=null && roleName!=null ){
					//alert("/sso/base/roleAuth/forwardRoleAuth.do?method=inputShowFunTree&rid="+id);
					window.parent.document.getElementById("opf").src="/sso/base/roleAuth/forwardRoleAuth.do?method=inputShowFunTree&rid="+id;
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

