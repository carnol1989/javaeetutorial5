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
function apply(archiveId,applyor,applyId){
window.location.replace("<%=path%>/pigeonholedArchivesListAction.do?method=apply&archiveId="+archiveId+"&applyor="+applyor+"&applyId="+applyId);	   	 	
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
				List pigeonholedArchivesList = (List) request
				.getAttribute("curPageList");
				String shenHeRole = (String)request.getAttribute("shenHeRole");
				if(shenHeRole==null)
					shenHeRole=request.getParameter("shenHeRole");				
	%>
	<body>

		<table width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
			<td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="5%" align="center" valign="middle">&nbsp;</td>
              <td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
              <td width="84%" class="table2_topic">�ѹ鵵�����б�</td>
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
                      <td width="16%" class="tabin_atab">�ѹ鵵�����б�</td>
                      <td width="16%" <%if(shenHeRole.equals("1")) {%>class="tabin_atabno"<%} %>><%if(shenHeRole.equals("1")) {%>
								<a href="<%=path%>/auditListAction.do?method=auditList"><span class="bg-zw">���������б�</span></a><%} %></td>
                      <td width="50%"></td>
                    </tr>
                  </table>
                    <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
									<tr align="center" height="25" class="bg-zwbt">
										<th width="5%" align="center">
											���
										</th>
										<th width="35%" align="center">
											����
										</th>
										<th width="25%" align="center">
											�ĺ�
										</th>
										<th width="20%" align="center">
											����ʱ��
										</th>
										<th width="15%" align="center">
											����
										</th>
									</tr>
									<%
											if (pigeonholedArchivesList != null) {
											for (int i = 0; i < pigeonholedArchivesList.size(); i++) {
												Object[] item = (Object[]) pigeonholedArchivesList.get(i);
									%>
									<tr height="20" align="center" class="bg-zw">
										<td width="5%" align="center">
											<%=i + 1%>
										</td>
										<td width="35%" align="center">
											<%=item[1] == null ? "" : item[1]%>
										</td>
										<td width="25%" align="center">
											<%=item[2] == null ? "" : item[2]%>
										</td>
										<td width="20%" align="center">
											<%=item[3] == null ? "" : item[3]%>
										</td>
										<td width="15%">
											<%
														if (item[4] == null
														|| (item[4] != null && "0".equals(item[5]))) {
											%>
											<input type="button" class="button1"
												onclick="if(confirm('�Ƿ�ȷ������')){apply('<%=item[0]%>','<%=item[4]%>','<%=item[6]%>')}"
												value="����" />
											<%
											} else if (item[4] != null && item[5] == null) {
											%>
											������...
											<%
											} else if (item[4] != null && "1".equals(item[5])) {
											%>
											<input type="button" class="button1"
												onclick="window.location.replace('<%=path%>/archivesEdit.do?method=modify&id=<%=item[0]%>&view=1')"
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
									href="<%=path%>/pigeonholedArchivesListAction.do?method=movePage&moveTo=<%=curPage - 1%>&sessionID=<%=sessionID%>&shenHeRole=<%=shenHeRole %>"><span
									class="bg-zw">��һҳ</span> </a>
								<a
									href="<%=path%>/pigeonholedArchivesListAction.do?method=movePage&moveTo=<%=curPage + 1%>&sessionID=<%=sessionID%>&shenHeRole=<%=shenHeRole %>"><span
									class="bg-zw">��һҳ</span> </a>
								<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
								<span class="bg-zw">ÿҳ��ʾ</span>
								<a
									href="<%=path%>/pigeonholedArchivesListAction.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID%>&shenHeRole=<%=shenHeRole %>"><span
									class="bg-zw">10</span> </a>
								<a
									href="<%=path%>/pigeonholedArchivesListAction.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID%>&shenHeRole=<%=shenHeRole %>"><span
									class="bg-zw">20</span> </a>
								<a
									href="<%=path%>/pigeonholedArchivesListAction.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID%>&shenHeRole=<%=shenHeRole %>"><span
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

