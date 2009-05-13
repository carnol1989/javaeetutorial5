<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ include file="/WEB-INF/web/inc/ajaxInclude.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    String root = request.getParameter("root");
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<html:base target="_self" />
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<script src="../../../../javascript/checkbox.js"></script>
		<script src="../../../../javascript/validate.js"></script>
		<script type='text/javascript' src='<%=strpath%>/dwr/interface/funCheck.js'></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	color: #FF0000;
}
.STYLE2 {
	font-size: 12px;
	color: #666666;
}
-->
        </style>
	</head>

	<body bgcolor="#f2f9f9">

		<input id="path" type="hidden" value="<%=request.getContextPath()%>">
		<input id="root" type="hidden" value="${root }">
		<input id="fid" type="hidden" value="${fid }">
		<html:form action="/base/function/forwardFunction.do?method=addFun" focus="name">
			<html:hidden property="fid" value="${fid }" />
			<table width="98%" border="2" align="center" cellpadding="0"
				cellspacing="0" bordercolor="97cdda" class="tableborder">
				<thead class="bg-zwbt">
					<tr>
						<td height="30" align="left">
							&nbsp;
							<span class="STYLE1">�����Դ��Ϣ</span>&nbsp;&nbsp;&nbsp;&nbsp;

							<a onClick="checkFun();" onmouseover="this.style.cursor='hand'">
								�ύ</a> &nbsp;&nbsp;
							<a onClick="initForm();" onmouseover="this.style.cursor='hand'">
								������</a>
						</td>
					</tr>
				</thead>
			</table>

			<table width="98%" border="2" align="center" cellpadding="0"
				cellspacing="0" bordercolor="97cdda" class="tableborder">

				<thead class="bg-zw">
					<tr>
						<td width="50%">
							��Դ����
						</td>
						<td nowrap="nowrap">
							<html:text property="name" maxlength="100" onkeydown="notNull();" onblur="chk();"></html:text><font color="red">*</font>
							<font color="red">
							<span id="fname"></span>
							</font>
						</td>
					</tr>
					<tr>
						<td width="50%">
							��ϵͳΨһ��ʶ
						</td>
						<td nowrap="nowrap">
							<html:text property="fun_key" maxlength="100" onkeydown="notNull();" onblur="chk(),funKeyCheck()"></html:text><font color="red">*</font>
							<font color="red">
							<span id="ffun_key"></span>
							<span id="funKeyCheck"></span>
							</font>
						</td>
					</tr>
					<tr>
					<% if (root.equals("false")) {%>
					<td width="50%">
							����Ӧ��ϵͳ
							</td>
						<td nowrap="nowrap">
							<html:select property="sys_key" >
								
									<html:option value="${sysid}">${sysname}</html:option>
									</html:select>
								
							
						</td>
						<%}else{ %>
						<td width="50%">
							����Ӧ��ϵͳ
						</td>
						<td nowrap="nowrap">
							<html:select property="sys_key" onblur="chk();">
								<c:forEach var="appsys" items="${appSysList}" varStatus="loop">
									<html:option value="${appsys.id}">${appsys.name}</html:option>
								</c:forEach>
							</html:select>
							<font color="red">
							<span id="fsys_key"></span>
							</font>
						</td>
		<%
  		} 
        %>
					</tr>
					<tr>
						<td width="50%">��Դͼ��</td>
						<td>
							<html:select property="imageName">
								<html:option value="01">��׼</html:option>
								<html:option value="02">ͨѶ��</html:option>
								<html:option value="03">����</html:option>
								<html:option value="04">���±�</html:option>
								<html:option value="05">����</html:option>
								<html:option value="06">�����</html:option>
								<html:option value="07">ʱ��</html:option>
								<html:option value="08">����</html:option>
								<html:option value="09">��Ϣ</html:option>
								<html:option value="10">���</html:option>
								<html:option value="11">��ѯ</html:option>
								<html:option value="12">�ļ�</html:option>
								<html:option value="13">����</html:option>
								<html:option value="14">�ż�</html:option>
								<html:option value="15">����</html:option>
								<html:option value="16">������ѯ�����ѯ</html:option>
								<html:option value="17">������ѯת��</html:option>
								<html:option value="18">��������</html:option>
								<html:option value="19">�������</html:option>
								<html:option value="20">������Դ����</html:option>
								<html:option value="21">��ɫ����</html:option>
								<html:option value="22">Ȩ�����͹���</html:option>
								<html:option value="23">Ӧ��ϵͳ����</html:option>
								<html:option value="24">�û�������ɫ</html:option>
								<html:option value="25">��֯��������</html:option>
								<html:option value="26">����</html:option>
								<html:option value="27">��������</html:option>
								<html:option value="28">�߰�</html:option>
								<html:option value="29">����</html:option>
								<html:option value="30">���Ӽ��</html:option>
								<html:option value="31">�ͻ�ά��</html:option>
								<html:option value="32">�ϴ�</html:option>
								<html:option value="33">����</html:option>
								<html:option value="34">����</html:option>
								<html:option value="35">�ҵĴ߰�</html:option>
								<html:option value="36">�Ѱ�</html:option>
								<html:option value="37">��������</html:option>
							</html:select>
						</td>
					</tr>
		<% if (root.equals("false") && "ͳһ�Ż�".equals(request.getAttribute("sysname"))) {%>
					<tr>
						<td width="50%">��Դ˳λ</td>
						<td>
							<html:select property="newDeforder">
								<html:option value="${newDeforder}">${newDeforder}</html:option>
								<c:forEach var="num" begin='1' end='${newDeforder-1}'>
									<html:option value="${num}">${num}</html:option>
								</c:forEach>
							</html:select>
						</td>
					</tr>
					<%
  		} 
        %>
					<tr>
						<td width="50%">
							��Դ�Ƿ�����
						</td>
						<td nowrap="nowrap">
							<html:radio property="insure" value="1">����</html:radio>
							<html:radio property="insure" value="0">������</html:radio>
							<font color="red">
							<span id="finsure"></span>
							</font>
						</td>
					</tr>
					<tr>
						<td width="50%">
						URL
						</td>
						<td width="50%">
							<html:textarea property="url" value=""></html:textarea>
							<font color="red">
							<span id="furl"></span>
							</font>
						</td>
					</tr>
				</thead>
			</table>
			<table width="98%" border="2" align="center" cellpadding="0"
				cellspacing="0" bordercolor="97cdda" class="tableborder">
				<thead class="bg-zw">
					<tr>
						<td height="30" align="left" width="25%" colspan="3">
							&nbsp;
							<span class="STYLE1">���Ȩ��������Ϣ</span>
						</td>
					</tr>

					<tr>
						<td width="50%" height="25" align="center">
							<input name="allbox" type="checkbox" id="allbox"
								onClick="checkall(this);">
						</td>
						<td align="center">
							Ȩ������
						</td>
					</tr>
					<c:forEach var="content" items="${rightTypeList}" varStatus="loop">
						<tr>
							<td width="50%" align="center">
								<html:checkbox property="right_type" value="${content.id}"
									onclick="setID(this)"></html:checkbox>
							</td>
							<td align="center">
								${content.name }
							</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</html:form>
	</body>
</html>
<script type="text/javascript">
			function chk(){
			var name = document.getElementById("name").value;
			var fun_key = document.getElementById("fun_key").value;
			
			if(isNull(document.getElementById("name"))==false){
				document.getElementById("fname").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				//document.getElementById("name").focus();
				return false;
			}else{
				if(getLen(document.getElementById("name").value) > 100){
					document.getElementById("fname").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���100���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					//document.getElementById("name").focus();
					return false;				
				}else{
					document.getElementById("fname").innerHTML = "";
				}
			}

			if(isNull(document.getElementById("fun_key"))==false){
				document.getElementById("ffun_key").innerHTML = "<font color='red'>"+"����Ϊ��"+"</font>";
				//document.getElementById("fun_key").focus();
				return false;
			}else{
				if(getLen(document.getElementById("fun_key").value) > 100){
					document.getElementById("ffun_key").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���100���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					//document.getElementById("fun_key").focus();
					return false;				
				}else{
					document.getElementById("ffun_key").innerHTML = "";
				}
			}
			if(getLen(document.getElementById("url").value) > 2000){
					document.getElementById("furl").innerHTML = "<font color='red'>"+"���Ȳ��ܴ���2000���ַ�,����ռ2���ַ�,����&��ĸռ1���ַ�"+"</font>";
					//document.getElementById("url").focus();
					return false;				
				}else{
					document.getElementById("furl").innerHTML = "";
				}
		
							
			}
			
			
			function checkFun(){
			var name = document.getElementById("name").value;
			var fun_key = document.getElementById("fun_key").value;
			
			if(name == ""){alert("�������벻����"); return false;}
			if(getLen(document.getElementById("name").value) >100){alert("�ַ��������"); return false;}
			if(fun_key == ""){alert("�������벻����"); return false;}
			if(getLen(document.getElementById("fun_key").value) >100){alert("�ַ��������"); return false;}
			
			funKeyCheck();
           
            if(this.funKeyflag=="false"){alert("�����ظ�"); return false;}

				var chkLen = checkRightType();
				//if(chkLen==0){
				//	alert("Ȩ�����Ͳ���Ϊ�գ���ѡ��");
				//	return false;
				//}
				var frm = document.forms[0];
				var root = document.getElementById("root").value;
				if (confirm("��ȷ����¼�����Ϣ�Ƿ�׼ȷ��ȷ�������")){
					if(root!=null && root!=""){
						if(root=="true"){
							frm.action = frm.action + "&root=true";
						}	
						if(root=="false"){
							frm.action = frm.action + "&root=false";
						}				
						frm.submit();											
					}
				}
				
			}
			
			function initForm(){
				document.forms[0].reset();
			}
			
			function checkall(id){
				var es = document.getElementsByName("right_type");
				var tocheck = id.checked;
				var totle = es.length;
				for (var i = 0; i < es.length ; i++){
					es[i].checked = tocheck; 
					setID(es[i]);
				}
			}		
			
			function checkRightType(){
				var es = document.getElementsByName("right_type");
				var chkLen = 0;
				for (var i = 0; i < es.length ; i++){
					if(es[i].checked){
						chkLen++;
					}
				}	
				return chkLen;
			}	

		</script>
