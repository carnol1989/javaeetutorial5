<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbArchives" />
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String sessionID = "";
	int curPage = 0;
	long count=0;
	try {
		sessionID = (String) request.getAttribute("sessionID");
		curPage = (Integer) session.getAttribute(sessionID + "No");
		count=(Long)session.getAttribute(sessionID+"Count");

	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
<script type="text/javascript">							
function auditApply(applyId,result){
window.location.replace("<%=path%>/auditListAction.do?method=auditApply&applyId="+applyId+"&result="+result);	   	 	
}
	    	    
</script>
<style>
a:link {text-decoration: none;}
a:visited {text-decoration: none;}
a:active {text-decoration: none;}
a:hover {text-decoration: none;}
</style>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>��������</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
	</head>
	<%
	List auditList = (List) request.getAttribute("curPageList");
	%>
	<body>

		<table width="97%" align="center" cellpadding="0" cellspacing="0">
			<tr>
			<td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="5%" align="center" valign="middle">&nbsp;</td>
              <td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
              <td width="84%" class="table2_topic">���������б�</td>
            </tr>
          </table></td>
          <td background="images/8-2.gif">&nbsp;</td>
        </tr>
      </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top"><table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
                <tr>
                  <th height="30" valign="bottom"></th>
                </tr>
                <tr>
                  <td align="center" valign="top"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="2%" height="24">&nbsp;</td>
                      <td width="16%" class="tabin_atabno"><a href="<%=path%>/archivesListAction.do?method=noPigeonholeList"><span class="bg-zw">�����б�</span></a></td>
                      <td width="16%" class="tabin_atabno"><a href="<%=path%>/pigeonholedArchivesListAction.do?method=pigeonholedArchivesList"><span class="bg-zw">�ѹ鵵�����б�</span></a></td>
                      <td width="16%" class="tabin_atab">���������б�</td>
                      <td width="50%">&nbsp;</td>
                    </tr>
                  </table>
                    <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
                					<tr align="center" height="25">
										<th width="5%" align="center">
											���
										</th>
										<th width="35%" align="center">
											����
										</th>
										<th width="25%" align="center">
											������
										</th>
										<th width="19%" align="center">
											����ʱ��
										</th>
										<th width="16%" align="center">
											����
										</th>
									</tr>
									<%
											if (auditList != null) {
											for (int i = 0; i < auditList.size(); i++) {
												Object[] item = (Object[]) auditList.get(i);
									%>
									<tr height="20" align="center" class="bg-zw">
										<td width="5%" align="center">
											<%=i + 1%>
										</td>
										<td width="35%" align="center">
											<%=item[2] == null ? "" : item[2]%>
										</td>
										<td width="25%" align="center">
											<%=item[0] == null ? "" : item[0]%>
										</td>
										<td width="15%" align="center">
											<%=item[1] == null ? "" : item[1]%>
										</td>
										<td width="20%">
											<%
											if (item[4] == null) {
											%>
											<input type="button" class="button1"
												onclick="if(confirm('�Ƿ�ȷ����׼')){auditApply('<%=item[3]%>','1')}"
												value="��׼" />
											<input type="button" class="button1"
												onclick="if(confirm('�Ƿ�ȷ�ϲ���')){auditApply('<%=item[3]%>','0')}"
												value="����" />
											<%
											} else {
											%>
											<input type="button" class="button1"
												onclick="window.location.replace('<%=path%>/archivesEdit.do?method=modify&id=<%=item[5]%>&view=2')"
												value="�鿴" />
											<%
											}
											%>
										</td>
									</tr>
									<%
										}
										}
									%>
                    </table>
                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="10"></td>
                      </tr>
                      <tr>
                        <td class="tabin_page">
								<a
									href="<%=path%>/auditListAction.do?method=movePage&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>"><span
									class="bg-zw">��һҳ</span> </a>
								<a
									href="<%=path%>/auditListAction.do?method=movePage&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>"><span
									class="bg-zw">��һҳ</span> </a>
								<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
								<span class="bg-zw">ÿҳ��ʾ</span>
								<a
									href="<%=path%>/auditListAction.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID%>"><span
									class="bg-zw">10</span> </a>
								<a
									href="<%=path%>/auditListAction.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID%>"><span
									class="bg-zw">20</span> </a>
								<a
									href="<%=path%>/auditListAction.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID%>"><span
									class="bg-zw">30</span> </a>
								<span class="bg-zw">��</span> 
								<span class="bg-zw">��<%=count %>��</span>                       
						</td>
                      </tr>
                    </table>
                    </td>
                </tr>
                <tr>
                  <td height="20"></td>
                </tr>
                
              </table></td>
            </tr>
            <tr>
              <td height="10"></td>
            </tr>
          </table></td>
        </tr>
      </table>			
			</td>
			</tr>

		</table>
	</body>
</html>

