<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.baosight.mode.TbUser"/>
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
		function selectBySubject()
			{
            	var type=document.getElementById("type").value;
            	window.location.replace("<%=path%>/shareFileListAction.do?method=list&type="+type);
			}	    	    
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����ռ�</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/images/style.css" rel="stylesheet" type="text/css" />
	
  </head>
  <%
  	String type = request.getParameter("type");
  	List shareFileList = (List)request.getAttribute("curPageList");
  	TbUser user = (TbUser) request.getSession().getAttribute(
		"SYSTEM_USER_SESSION");
	String userId = user.getId();
  %>
  <body>

<!--<table width="97%" align="center" cellpadding="0" cellspacing="0">

		<tr>
			<td height="10"></td>
		</tr>
        <tr> 
        			<td>
				<img src="/sso/imagine/r-bt.gif" width="11.5" height="14">
				<span class="bg-zw">&nbsp; </span><span class="bg-zw">����ռ��б�</span>
        			</td>
        </tr>
        <tr> 
        			<td height="10">
        			</td>
        </tr>
        <tr> 
          <td height="5" colspan="2">&nbsp;&nbsp;&nbsp;<span class="bg-zw">�ļ����ͣ�</span>
					<select id="type" name="type">
						<option value="0" <%if(type.equals("0")){ %>selected="selected"<%} %>>ȫ��</option>
						<option value="1" <%if(type.equals("1")){ %>selected="selected"<%} %>>�ļ�</option>
						<option value="2" <%if(type.equals("2")){ %>selected="selected"<%} %>>ͼƬ</option>
						<option value="3" <%if(type.equals("3")){ %>selected="selected"<%} %>>����</option>
						<option value="4" <%if(type.equals("4")){ %>selected="selected"<%} %>>��Ƶ</option>
						<option value="5" <%if(type.equals("5")){ %>selected="selected"<%} %>>����</option>
					</select>               
            &nbsp;&nbsp;&nbsp;<button onclick="selectBySubject()"><span class="bg-zw">�� ѯ</span></button></td>
        </tr>
        
        -->
 <table width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
	 		<td>
	 			<table width="100%" border="0" cellspacing="0" cellpadding="0">
          			<tr>
            			<td width="288" height="40" align="left" valign="middle" background="images/8-1.gif">
            				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                				<tr>
                  					<td width="5%" align="center" valign="middle">&nbsp;</td>
                  					<td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
                  					<td width="84%" class="table2_topic" align="right">����ռ��б�</td>
                				</tr>
            	            </table>
            </td>
            	<td background="images/8-2.gif">&nbsp;</td>
           </tr>
 </table>
        		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">
        <tr>
          <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top">
              <table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
              	
              	<tr>
              		<td align="center">
              		<table width="99%" border="0" cellpadding="0" cellspacing="0"><tr><td height="20">
              		<tr> 
          <td height="5" colspan="2">&nbsp;&nbsp;&nbsp;</td>
        </tr>
              		
              		<!-- ������� --></td></tr></table>
              <table width="98%" border="0" cellpadding="0" cellspacing="1"  class="tabin_in">
     
                    <tr> 
                      <td height="27" colspan="5" valign="middle" align="left"> 
                      <span class="bg-zw">�ļ����ͣ�</span>
					<select class="shuruk2" id="type" name="type">
						<option value="0" <%if(type.equals("0")){ %>selected="selected"<%} %>>ȫ��</option>
						<option value="1" <%if(type.equals("1")){ %>selected="selected"<%} %>>�ļ�</option>
						<option value="2" <%if(type.equals("2")){ %>selected="selected"<%} %>>ͼƬ</option>
						<option value="3" <%if(type.equals("3")){ %>selected="selected"<%} %>>����</option>
						<option value="4" <%if(type.equals("4")){ %>selected="selected"<%} %>>��Ƶ</option>
						<option value="5" <%if(type.equals("5")){ %>selected="selected"<%} %>>����</option>
					</select>               
            &nbsp;&nbsp;&nbsp;<button class="button0" onclick="selectBySubject()"><span class="bg-zw">�� ѯ</span></button>
                      
                      &nbsp;&nbsp;&nbsp;
                      <button class="button0" onclick="window.location.replace('<%=path%>/sharefileEdit.do?method=add')">�� ��</button>
                   	  </td>
                       
                        
                    </tr>
    	<tr align="center" height="25" >
    		<th width="5%" align="center">���</th>
    		<th width="35%" align="center">�ļ���</th>
    		<th width="25%" align="center">�ļ�˵��</th>
    		<th width="20%" align="center">�ϴ���</th>
    		<th width="15%" align="center">����</th>
    	</tr>
		<%
			if(shareFileList!=null)
			{
				for(int i=0;i<shareFileList.size();i++)
				{
					Object[] item = (Object[])shareFileList.get(i);
					%>
						<tr height="20" align="center" class="bg-zw">
							<td width="5%" align="center"><%=i+1 %></td>
							<td width="35%" align="center"><a href="<%=path %>/shareFileListAction.do?method=download&id=<%=item[0] %>"><%=item[3]==null?"":item[3] %></a></td>
							<td width="25%" align="center"><%=item[2]==null?"":item[2] %></td>
			    			<td width="20%" align="center"><%=item[1]==null?"":item[1] %></td>
			    			<td width="15%">
			    			<%if(userId.equals(item[4])){ %>
			    			<a href="<%=path %>/sharefileEdit.do?method=modify&id=<%=item[0] %>"><img src="<%=path%>/imagine/xg.gif" width="15" height="15" border="0" alt="�޸�"></a>
							<a href="<%=path %>/shareFileListAction.do?method=delete&id=<%=item[0] %>&type=<%=type %>" onclick="return confirm('�Ƿ�ȷ��ɾ��')"><img src="<%=path%>/imagine/sc.gif" width="15" height="15" border="0" alt="ɾ��"></a> 
			    			<%} %>
			    			</td>
			    		</tr>
					<%
				}
			}
		%>
 </table>
                </td>
              </tr>
            

        <tr>
        	<td>
				<table  width="98%">
					<tr>
						<td align="right">
							<a href="<%=path%>/shareFileListAction.do?method=movePage&moveTo=<%=curPage-1%>&sessionID=<%=sessionID %>&type=<%=type %>"><span class="bg-zw">��һҳ</span></a>
							<a href="<%=path%>/shareFileListAction.do?method=movePage&moveTo=<%=curPage+1%>&sessionID=<%=sessionID %>&type=<%=type %>"><span class="bg-zw">��һҳ</span></a>
							<span class="bg-zw">��<%=curPage+1%>ҳ</span>
							<span class="bg-zw">ÿҳ��ʾ</span>
							<a href="<%=path%>/shareFileListAction.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID %>&type=<%=type %>"><span class="bg-zw">10</span></a>
							<a href="<%=path%>/shareFileListAction.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID %>&type=<%=type %>"><span class="bg-zw">20</span></a>
							<a href="<%=path%>/shareFileListAction.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID %>&type=<%=type %>"><span class="bg-zw">30</span></a>
							<span class="bg-zw">��</span>
							<span class="bg-zw">��<%=count %>��</span>
						</td>
             		</tr>
    	 			</table>
              		
              		</td>
              	</tr>
              </table>
					</td>
                </tr>
                
                <tr>
                  <td height="8" colspan="2"></td>
                </tr>
                
              </table></td>
            </tr>
            <tr>
              <td ></td>
            </tr>
          </table></td>
        </tr>
      </table>
</body>
</html>

