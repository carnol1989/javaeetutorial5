<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<html:base target="_self" />
		<link href="../../../../css/list.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/images/style.css" rel="stylesheet" type="text/css" />
		<script src="../../../../javascript/checkbox.js"></script>
		
		<script type="text/javascript">
							
		    function add(path){
		   	 	var funId = document.getElementById("funId").value;
		   	 	var sId = document.getElementById("sysId").value;      	
		    	if (funId == "" || funId == '0'){
		    		alert("��ѡ��Ҫ�����Դ��λ�ã�");
		    	}else{
		    		window.open(path+"/base/function/forwardFunction.do?method=inputAddFun&root=false&id="+funId+"&sid="+sId,"opf");
		    	}
		    }
		    function addRoot(path){
		   		var funId = document.getElementById("funId").value; 
		    	window.open(path+"/base/function/forwardFunction.do?method=inputAddFun&root=true","opf");
		    }		    
		    function update(){
		    	var path = document.getElementById("path").value;
		    	var funId = document.getElementById("funId").value;
		    	var sId = document.getElementById("sysId").value;
		    	if (funId == "" || funId == '0'){
		    		alert("��ǰû��ѡ���޸ĵ���Դ");
		    	}else{
		    		window.open(path+"/base/function/forwardFunction.do?method=inputUpdateFun&id="+funId+"&sid="+sId,"opf"); 
		    	}
		    }
		    function del(path){
		    	var funId = document.getElementById("funId").value;
		    	var isNode = document.getElementById("isNode").value;
		    	var insure=document.getElementById("insure").value;

		    	if (funId == "" || funId == '0'){
		    		alert("��ǰû��ѡ��ɾ������Դ��");
		    	}else{
		    		if(isNode=="true"){
		    			alert("��ǰ��Դ���¼���Դ����ɾ���¼���Դ���ٽ��д˲�����");
		    		}else{
		    			if(insure==1)
		    			{
		    				alert("��ǰ��Դ�����ã�������ɾ����");
		    			}
		    			else
		    			{
		    				if (confirm("���Ƿ�ȷ��ɾ������Ϣ?")){
		    					window.open(path+"/base/function/forwardFunction.do?method=deleteFun&id="+funId,"opf");
		    				}
		    			}	
		    		}
		    	}	
		    }		    
	</script>
		<style type="text/css">
<!--
.STYLE4 {color: #E43223}
-->
        </style>
	</head>
	<body>
		<input type="hidden" id="path" value="<%=request.getContextPath()%>" />
		<input type="hidden" id="op" value="${op }" />
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="31" align="left" valign="middle" background="<%=path %>/images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="4%" align="center" valign="middle">&nbsp;</td>
              <td width="9%" height="12" align="center" valign="middle"><img src="<%=path %>/images/icon5.gif" width="7" height="7"></td>
              <td width="87%" class="table2_topic">ͳһȨ�޹���ϵͳ����������Դ����</td>
            </tr>
          </table></td>
          <td background="<%=path %>/images/8-2.gif">&nbsp;</td>
        </tr>
      </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top"><table width="99%" border="0" cellpadding="0" cellspacing="0" class="tabtre2bgin">
                <tr>
                  <td height="30" colspan="2" valign="middle"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
				<td width="99%" align="right">
				      <input name="Submit2322" type="submit" class="button0" value="���" onclick="add('<%=request.getContextPath()%>');" onmouseover="this.style.cursor='hand'">
                      <input name="Submit2322" type="submit" class="button0" value="��Ӹ����" onclick="addRoot('<%=request.getContextPath()%>');" onmouseover="this.style.cursor='hand'">
                     <%--<input name="Submit2322" type="submit" class="button0" value="�޸�" onclick="update('<%=request.getContextPath()%>');" onmouseover="this.style.cursor='hand'">
                      --%>
                      <input name="Submit2322" type="submit" class="button0" value="ɾ��" onclick="del('<%=request.getContextPath()%>');" onmouseover="this.style.cursor='hand'">
               </tr>
                  </table>
                  <td width="0%">                  </tr>
                <tr>
                  <td width="41%" align="center" valign="top">
                  <table width="99%" border="0" cellpadding="0" cellspacing="0" class="tabtre2bgin_a">
                    <tr>
						<th>��ѡ�е���Դ����Ϊ</th>
						   </tr>
						    <tr>
						    <td height="300" align="center" valign="top"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="1"></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top">
                          <iframe width="100%" height="400" frameborder="0" scrolling="auto" name="negi" 
							src="<%=request.getContextPath()%>/base/function/forwardFunction.do?method=inputShowFunTree">
						</iframe>
						</td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                  <td width="59%" align="center" valign="top"><table width="99%" border="0" cellpadding="0" cellspacing="0" class="tabtre2bgin_b">
                    <tr>
                          
						<th><div id="funName"></div>
						</th>
						</tr>
                    <tr>
                      <td height="300" align="center" valign="top">
					
					  <table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="1"></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top">
                          <iframe width="100%" height="400" frameborder="0" scrolling="auto"
							name="opf" src="">
						</iframe>
						</td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
               
                
              </table></td>
            </tr>
            <tr>
              <td height="4"></td>
            </tr>
          </table></td>
        </tr>
      </table>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30"></td>
        </tr>
      </table></td>
  </tr>
</table>

		<input type="hidden" id="funId" name="funId" value="" />
		<input type="hidden" id="funKey" name="funKey" value="" />
		<input type="hidden" id="sysId" name="sysId" value="" />
		<input type="hidden" id="parId" name="parId" value="" />
		<input type="hidden" id="isNode" name="isNode" value="" />
		<input type="hidden" id="insure" name="insure" value="" />
	</body>
</html>
