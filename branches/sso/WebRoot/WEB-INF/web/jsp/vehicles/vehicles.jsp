<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String currentPath = request.getServletPath();
//String insureOn=(String)request.getAttribute("insureOn");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vehicles.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
    <script src="../../../../javascript/validate.js"></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>
	<link href="images/style.css" rel="stylesheet" type="text/css" />
  
  <script type="text/javascript">
		function queList()
			{
				var license=document.getElementById("license").value;
				var form=document.forms[0];
				form.action="<%=path%>/vehicles.do?method=findVehiclesByLicense&license="+license;
				form.target="_self";
				form.submit();
            	
			}
			
		function add()
			{
			var form=document.forms[0];
				form.action="<%=path %>/vehicles.do?method=add&action=add";
				form.target="_self";
				form.submit();
            	
			}		
			
					
	</script>
	
  </head>
  
  <%
  	//String flag=(String)request.getAttribute("parentId");
  //	List commList=(List)request.getAttribute("vehiclesList");
  	
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
	
	List commonalityCommList = (List)request.getAttribute("curPageList");
  %>
  
<body>
<html:form action="/vehicles.do">
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
                  					<td width="84%" class="table2_topic" align="right">��������</td>
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
              <table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin" >
              <tr><th height="30" valign="bottom"></th></tr>
              	<tr>
              		<td align="center">
              		
              		
              		<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                      <td width="2%" height="24">&nbsp;</td> 
                      <td width="16%" class="tabin_atabno"><a href="tbVehiclesApply.do?method=list&action=all">�ó�����</a></td>
                      <td width="16%" class="tabin_atab"><a href="vehicles.do?method=findVehiclesList"><span class="bg-zw">��������</span></a></td>
                   <td width="90%">&nbsp;</td>
                   </table> 
        		<table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
			         			<tr>
			        				
                       <td height="27" colspan="6" valign="bottom"  bgcolor="#f7f7f7" align="left">
	          		<span class="bg-zw">���ƺţ�</span><input type="text" id="license" name="license" value=""   class="shuruk1"/>
	            	 <input name="Submit2" type="submit" class="button0" value="�� ѯ" onclick="queList();"
	    		 		onmouseover="this.style.cursor='hand'"/>                       
	        	</td>			    		
 <td height="25" colspan="2" valign="bottom" bgcolor="#f7f7f7" align="right">&nbsp;
                 <input name="Submit2" type="submit" class="button0" value="�� ��" onclick="add();"
	    		 		onmouseover="this.style.cursor='hand'"/>
	    		 		</td>						

</tr>
	    		
  
			<tr align="center">
						<th width="5%" height="24" align="center" style="word-break: break-all; word-wrap:break-word;">���</th>
    					<th width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">����</th>
    					<th width="15%" align="center" style="word-break: break-all; word-wrap:break-word;">����</th>
    					<th width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">����(��)</th>
    					<th width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">״̬</th>
    					<th width="40%" align="center" style="word-break: break-all; word-wrap:break-word;">��ע</th>
    					<th width="10%" align="center"  colspan="2">����</th>
    				</tr>
					<c:forEach items="${curPageList}" var="v" varStatus="loop">
					<tr align="center" class="bg-zw">
						<td width="5%" align="center" height="24" style="word-break: break-all; word-wrap:break-word;">${loop.index+1}</td>
    					<td width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">${v.license}</td>
    					<td width="15%" align="center" style="word-break: break-all; word-wrap:break-word;">${v.model}</td>
    					<td width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">${v.capacity}</td>
    					<c:if test="${v.status==1}">
    						<td width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">����</td>
    					</c:if>
    					<c:if test="${v.status==0}">
    						<td width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">ά����</td>
    					</c:if>
    					<c:if test="${v.status==-1}">
    						<td width="10%" align="center" style="word-break: break-all; word-wrap:break-word;">����</td>
    					</c:if>
    					<td width="40%" align="center" style="word-break: break-all; word-wrap:break-word;">${v.rem}</td>
    					<td width="5%" align="center"><a title="�޸�" href="<%=path %>/vehicles.do?method=modify&id=${v.id}"><img src="/sso/imagine/xg.gif" width="15" height="15" border="0"></a></td>
    					<td width="5%" align="center"><a title="����" href="/sso/vehicles.do?method=delete&id=${v.id }" onclick="return confirm('�Ƿ�ȷ��ɾ��')"><img src="/sso/imagine/sc.gif" width="15" height="15" border="0"></a></td>
    				</tr>
    				</c:forEach>
    			</table>
  			</td>
  	   	</tr> 

		<tr>
			<td  align="right" >
			<table>
			<tr><td>
				<a href="<%=path%>/vehicles.do?method=movePage&moveTo=<%=curPage-1%>&sessionID=<%=sessionID %>"><span class="bg-zw">��һҳ</span></a>
		 		<a href="<%=path%>/vehicles.do?method=movePage&moveTo=<%=curPage+1%>&sessionID=<%=sessionID %>"><span class="bg-zw">��һҳ</span></a>
		 		<span class="bg-zw">��<%=curPage+1%>ҳ</span>
		 		<span class="bg-zw">ÿҳ��ʾ</span>
		 		<a href="<%=path%>/vehicles.do?method=resetPageSize&pageSize=10&sessionID=<%=sessionID %>"><span class="bg-zw">10</span></a>
		  		<a href="<%=path%>/vehicles.do?method=resetPageSize&pageSize=20&sessionID=<%=sessionID %>"><span class="bg-zw">20</span></a>
		  		<a href="<%=path%>/vehicles.do?method=resetPageSize&pageSize=30&sessionID=<%=sessionID %>"><span class="bg-zw">30</span></a>
		 		<span class="bg-zw">��</span>
		 		<span class="bg-zw">��<%=count %>��</span>
		 		</td></tr>
		 		<tr><td height="20"></td></tr>
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
    
    </html:form>
</body>
</html>
