
<%
		if (request.getProtocol().compareTo("HTTP/1.0") == 0)
		response.setHeader("Pragma", "no-cache");
	else if (request.getProtocol().compareTo("HTTP/1.1") == 0)
		response.setHeader("Cache-Control", "no-cache");

	response.setDateHeader("Expires", 0);
%>
<%@ page contentType="text/html; charset=gb2312"%>
<HTML>
	<HEAD>
		<%@ page import="java.util.*"%>
		<%@ page import="shecasafeapi.*"%>
		<TITLE>Test page</TITLE>
	</HEAD>

	<BODY>
		<%
			//System.out.println(System.getProperty("java.library.path")); 
			shecasafeapi.SafeEngine myobj = new shecasafeapi.SafeEngine();
			String strServerCert = "", strRandom = "", strCert = "", strSigned = "", strEnvelope = "";
			int i = 0;

			i = myobj.shecaInitEnviroment(9, "com1", "1234", 0, 9, "com1",
					"1234");

			if (i != 0) {
		%>
		<script>alert("��ʼ��safeengine����:<%=i%>");</script>
		<%
				} else {
				//��ȡ������֤��
				strServerCert = myobj.shecaGetSelfCertificate(9, "com1",
				"537acebd");
				if (myobj.getErrorCode() != 0) {
		%>
		<script>alert("��ȡ������֤�����");</script>
		<%
					myobj.shecaClearEnviroment();
					//myobj.SEH_ClearSession;
				} else {
					//���������
					Random RandNum = new java.util.Random();
					int RandomData = RandNum.nextInt(1000000);
					strRandom = RandomData + "���Ǵ��"; //
					/*String strRandom = myobj.shecaGenRandomBytes();
					 if (myobj.getErrorCode()!=0) 
					 {
		%>
		<script>alert("�������������");</script>
		<%
					 myobj.SEH_ClearSession;
					 }
					 */

					session.putValue("random", strRandom);
		%>
		<p align="center">
			<OBJECT ID="SafeEngineCtl"
				CLASSID="CLSID:B48B9648-E9F0-48A3-90A5-8C588CE0898F" width="0"
				height="0" border=0 codebase="SafeEngineCOM.cab#Version=1,2,0,0"></OBJECT>
		</p>


		<p align="center">
		<form name=form1 method=post action="server.jsp"
			onsubmit="return doTest()">

			<input type=hidden name=sCert value="<%=strCert%>">
			<input type=hidden name=sSign value="<%=strSigned%>">
			<input type=hidden name=sEnvelope value="<%=strEnvelope%>">
			<input type=submit value="��ʼ">
			<br>
			<br>

		</form>
		</p>
		<script languang="javascript">
function doTest()
{
	/* Change the path and password below */
	/*strpassword=document.form1.pwd.value;*/
	SafeEngineCtl.SEH_InitialSession(9,"com1","537acebd",1000,2,"com1","537acebd");
	if(SafeEngineCtl.ErrorCode!=0)
	{
		alert("SEH_InitialSession Error. Return:" + SafeEngineCtl.ErrorCode);
		return false;
	}
	/* ��ȡ�Լ�֤�� */
	strCert = SafeEngineCtl.SEH_GetSelfCertificate(9, "com1", "537acebd");
	if(SafeEngineCtl.ErrorCode!=0)
	{
		alert("SEH_GetSelfCertificate Error. Return:" + SafeEngineCtl.ErrorCode);
		return false;
	}
	document.form1.sCert.value = strCert;
	
	/* ��֤������֤�� */
	SafeEngineCtl.SEH_VerifyCertificate("<%=strServerCert%>");	
	if(SafeEngineCtl.ErrorCode!=0)
	{
		alert("SEH_VerifyCertificate Errorhhhhhh. Return:" + SafeEngineCtl.ErrorCode);
		SafeEngineCtl.SEH_ClearSession();
		return false;
	}

	/* ǩ������� */
	strSigned = SafeEngineCtl.SEH_SignData("<%=strRandom%>", 3);	
	if(SafeEngineCtl.ErrorCode!=0)
	{
		alert("SEH_SignData Error. Return:" + SafeEngineCtl.ErrorCode);
		SafeEngineCtl.SEH_ClearSession();
		return false;
	}
	document.form1.sSign.value = strSigned;

	/* �÷�����֤���������� */
	strEnvelope = SafeEngineCtl.SEH_Envelope(1, "<%=strRandom%>", "<%=strServerCert%>");	
	if(SafeEngineCtl.ErrorCode!=0)
	{
		alert("SEH_Envelope(Enc) Error. Return:" + SafeEngineCtl.ErrorCode);
		SafeEngineCtl.SEH_ClearSession();
		return false;
	}
	document.form1.sEnvelope.value = strEnvelope;
	
	/* �ͷ� */
	SafeEngineCtl.SEH_ClearSession();
	return true;
}



</script>
		<%
			}
			}
		%>
	</BODY>
</HTML>
