
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
		<TITLE>Test page</TITLE>
		<%@ page import="java.util.*"%>
		<%@ page import="java.lang.*"%>
		<%@ page import="shecasafeapi.*"%>
	</HEAD>

	<body>

		<%
			shecasafeapi.SafeEngine myobj = new shecasafeapi.SafeEngine();
			//��ʼ��������˽Կ
			int i = 0;
			i = myobj.shecaInitEnviroment(9, "com1", "537acebd", 0, 9, "com1",
					"537acebd");
			if (i != 0) {
		%>
		<script>alert("��ʼ��safeengine����<%=i%>");</script>
		<%
				} else {
				//��ȡ������֤��
				String strServerCert = myobj.shecaGetSelfCertificate(9, "com1",
				"537acebd");
				if (myobj.getErrorCode() != 0) {
		%>
		<script>alert("��ȡ������֤�����");</script>
		<%
					myobj.shecaClearEnviroment();
					;
				} else {
					String strClientCert = request.getParameter("sCert");
					String strSigned = request.getParameter("sSign");
					String strEnvelope = request.getParameter("sEnvelope");
					String CertUniqueID = myobj
					.shecaGetCertUniqueID(strServerCert);
		%>
		�յ��ļ������ݣ�
		<%=strEnvelope%>
		<br>
		<br>
		�յ���ǩ�����ݣ�
		<%=strSigned%>
		<br>
		<br>
		�յ��Ŀͻ���֤�飺
		<%=strClientCert%>
		<br>
		<br>
		�յ���֤��Ψһ��ʶ��
		<%=CertUniqueID%>
		<br>
		<br>

		<%
					//��֤�ͻ���֤��
					i = myobj.shecaVerifyCertificate(strClientCert);
					if (i != 0) {
		%>
		<script>alert("��֤�ͻ���֤�����");</script>
		<%
					myobj.shecaClearEnviroment();
					} else //���������ŷ�	
					{
				//byte[] shecaPEMDecode(byte[] indata)byte[] shecaPEMDecode(byte[]pemdata)

				//byte[] shecaEnvelopeByte(int intEnvelopetype, byte[] byteIndata, byte[] //byteCertificate 

				byte[] Envelop = null;
				byte[] Signed = null;
				byte[] ClientCert = null;
				Signed = myobj.shecaPEMDecode(strSigned.getBytes());
				Envelop = myobj.shecaPEMDecode(strEnvelope.getBytes());
				ClientCert = myobj.shecaPEMDecode(strClientCert
						.getBytes());
				String strData = new String(myobj.shecaEnvelopeByte(2,
						Envelop, strServerCert.getBytes()));
				if (myobj.getErrorCode() != 0) {
		%>
		<script>alert("�������ŷ����");</script>
		<%
				myobj.shecaClearEnviroment();
				} else {
		%>
		�������ݣ�
		<br>
		<%=strData%>
		<br>
		<br>
		<%
					//��֤�ͻ���ǩ��
					i = myobj.shecaVerifySignDataByte(strData
					.getBytes(), 3, Signed, ClientCert);
					if (i != 0) {
		%>
		<script>alert("��֤ǩ������");</script>
		<%
					myobj.shecaClearEnviroment();
					} else {
						myobj.shecaClearEnviroment();
		%>
		��֤ǩ��ͨ����
		<br>
		<br>
		<%
						//String a=session.getValue("random");
						if (!(session.getValue("random")
						.equals(strData))) {
		%>
		���������strData is
		<%=strData%>
		session is
		<%=session.getValue("random")%>
		<%
		} else {
		%>

		�ͻ��˵�½�ɹ���
		<br>
		<%
					} //  end if !(strData.equals(a))
					} // end if VerifySignData
				} //end if Envelope
					} //end if VerifyCertificate
				} //end if GetSelfCertificate
			} //end if InitEnviroment
		%>

	</body>
</html>
