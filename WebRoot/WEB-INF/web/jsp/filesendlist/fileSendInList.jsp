<%@ page language="java" import="java.util.*,java.util.HashSet" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbArchives"/>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String sessionID = "";
int curPage = 0;
long count=0;
try{
  sessionID = (String)request.getAttribute("sessionID");
  curPage = (Integer)session.getAttribute(sessionID+"No");
  count=(Long)session.getAttribute(sessionID+"Count");
  
}catch(Exception ex){
  ex.printStackTrace();
}

%>
<script type="text/javascript">							
	    	    
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
    
    <title>�ļ�����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/images/style.css" rel="stylesheet" type="text/css" />
  </head>
  <%
  	List fileSendInList = (List)request.getAttribute("curPageList");
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
              <td width="84%" class="table2_topic">�����ļ��б�</td>
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
                      <td width="16%" class="tabin_atab">���յ��ļ�</td>
                      <td width="16%" class="tabin_atabno"><a href="<%=path %>/fileSendOutListAction.do?method=list"><span class="bg-zw">�ѷ��͵��ļ�</span></a></td>
                      <td width="66%" align="right">
                      <input name="Submit2" type="button" class="button0" value="�����ļ�" onclick="location.href='<%=path %>/filesendEdit.do?method=add&action=add';" onmouseover="this.style.cursor='hand'"/>
                      &nbsp;&nbsp;</td>
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
										<th width="15%" align="center">
											������
										</th>
										<th width="15%" align="center">
											����ʱ��
										</th>
										<th width="15%" align="center">
											�Ƿ��ѻظ�
										</th>
										<th width="15%" align="center" colspan="2">
											����
										</th>
									</tr>
									<%
										if(fileSendInList!=null)
										{
											for(int i=0;i<fileSendInList.size();i++)
												{
													Object[] item = (Object[])fileSendInList.get(i);
													String isview=(String)item[4];
													if(isview==null){
													isview="";
													}
									%>
									
									<tr align="center" height="25">
										<td width="5%" align="center">
											<%=i + 1%>
										</td>
										<td width="35%" align="center">
											<a href="<%=path%>/filesendEdit.do?method=view&id=<%=item[0]%>"><%=item[3]==null?"":item[3] %></a>
										</td>
										<td width="15%" align="center">
											<%=item[1]==null?"":item[1] %>
										</td>
										<td width="15%" align="center">
											<%=item[2]==null?"":item[2] %>
										</td>
										<td width="15%" align="center">
											<%=isview.equals("1")?"�ѻظ�":"δ�ظ�" %>
										</td>
										<td width="15%" align="center">
											<a href="<%=path %>/fileSendInListAction.do?method=delete&id=<%=item[0] %>" onclick="return confirm('�Ƿ�ȷ��ɾ��')"><img src="<%=path%>/imagine/sc.gif" width="15" height="15" border="0" alt="ɾ��"></a>
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
									href="<%=path%>/fileSendInListAction.do?method=movePage&moveTo=<%=curPage-1%>&sessionID=<%=sessionID %>"><span
									class="bg-zw">��һҳ</span> </a>
								<a
									href="<%=path%>/fileSendInListAction.do?method=movePage&moveTo=<%=curPage+1%>&sessionID=<%=sessionID %>"><span
									class="bg-zw">��һҳ</span> </a>
								<span class="bg-zw">��<%=curPage + 1%>ҳ</span>
								<span class="bg-zw">ÿҳ��ʾ</span>
								<a
									href="<%=path%>/fileSendInListAction.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID %>"><span
									class="bg-zw">10</span> </a>
								<a
									href="<%=path%>/fileSendInListAction.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID %>"><span
									class="bg-zw">20</span> </a>
								<a
									href="<%=path%>/fileSendInListAction.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID %>"><span
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

