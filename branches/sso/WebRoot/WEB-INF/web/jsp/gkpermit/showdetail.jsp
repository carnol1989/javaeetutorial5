<%@ page contentType="text/html;charset=GBK"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	String id = request.getParameter("id");
	String disply=request.getParameter("disply");
	String status=request.getParameter("status");

	String url=path+"/tbGovInfoPubMain.do?method=view&id="+id+"&disply="+disply+"&status="+status;
	
	String passWay = request.getParameter("passWay");
	String email=request.getParameter("email");
%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type='text/javascript' src='<%=basePath%>dwr/util.js'></script>
	<script type='text/javascript' src='<%=basePath%>dwr/engine.js'></script>
	<script language="javascript" src="<%=basePath%>js/prototype.js"></script>
	<style type="text/css">
	  table{
			font: 9pt Tahoma,Simsun,sans-serif;
			border-collapse: collapse;
		}
	</style>
	<link href="<%=path %>/css/CSS1.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/CSS2.css" rel="stylesheet" type="text/css">
	<link href="images/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
  <title>���蹫��</title>
  
  <script type="text/javascript">
  	function checked(){
		//����������Ϣ����;	
		var attr3=document.getElementById("attr3").value;
		if(containStringNumber(attr3,10))	
			document.getElementById("attr31").checked=true;
		if(containStringNumber(attr3,20))	
			document.getElementById("attr32").checked=true;
		if(containStringNumber(attr3,30))	
			document.getElementById("attr33").checked=true;
		if(containStringNumber(attr3,40))	
			document.getElementById("attr34").checked=true;
	}
	
	//�ж�һ���ַ����ַ����Ƿ����
	function containStringNumber(str,s){
		if(((str.split(s)).length-1)!=0)
			return true;
		else
			return false;
	}
</script>
</head>
  
<body onload="checked();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="5%" align="center" valign="middle">&nbsp;</td>
              <td width="11%" height="12" align="center" valign="middle"><img src="images/icon5.gif" width="7" height="7" /></td>
              <td width="84%" class="table2_topic">������Ϣ����</td>
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
                  <th width="94%" height="30" align="right" valign="bottom"><img src="images/fh.gif" width="46" height="25" border="0" onclick="window.location='<%=url%>'" 
				onmouseover="this.style.cursor='hand'"/></th>
                  <th width="6%" valign="bottom"></th>
                </tr>
                <tr>
              <td colspan="2" align="center"  valign="top">
              <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">	  
			  <tr height="24">
			    <td width="310"  height="24">�����ˣ����ˣ�����</td>
			    <td colspan="5">
					<c:if test="${govInfoPub.applyType==10}"> ${govInfoPub.applicant}</c:if>
				</td>
			  </tr>
			  <tr height="24">
			    <td width="310" >�����ˣ����˻���������֯������</td>
			    <td colspan="3">
					<c:if test="${govInfoPub.applyType==20}"> ${govInfoPub.applicant}</c:if>
				</td>
			    <td width="120" >����������:</td>
			    <td width="150" >
			    	<c:if test="${govInfoPub.applyType==20}"> ${govInfoPub.attr1}</c:if>
				</td>
			  </tr>	
			  <tr height="24">
			    <td width="310" rowspan="3">��ϵ��ʽ</td>
			    <td width="120" >ͨ�ŵ�ַ:</td>
			    <td colspan="2">
					<c:out value="${govInfoPub.applyAddr}"/>
				</td>
			    <td width="120" >��������:</td>
			    <td colspan="2">
					<c:out value="${govInfoPub.postcode}"/>
			    </td>
			  </tr>
			  <tr height="24">
			    <td width="120" >��ϵ�绰:</td>
			    <td width="230">
					<c:out value="${govInfoPub.phone}"/>
				</td>
			    <td width="120" >��ϵ��:</td>
			    <td colspan="2" width="270">
			    	<c:if test="${govInfoPub.applyType==10}"> ${govInfoPub.applicant}</c:if>
	    			<c:if test="${govInfoPub.applyType==20}"> ${govInfoPub.attr1}</c:if>
			    </td>
			  </tr>
			  <tr height="24">
			    <td width="120" >��������:</td>
			    <td colspan="4">
					<c:out value="${govInfoPub.email}"/>
				</td>
			  </tr>
			  <tr height="24">
			    <td  width="310" >������Ϣ����������أ�����������</td>
			    <td colspan="5"><c:out value="${govInfoPub.companyName}"/></td>
			  </tr>
			  <tr height="24">
			    <td  width="310" rowspan="2" >�����������Ϣ</td>
			    <td width="120" >����:</td>
			    <td colspan="2">
					<c:out value="${govInfoPub.descr}"/>
				</td>
			    <td width="120" >�ĺ�:</td>
			    <td width="150">
					<c:out value="${govInfoPub.docNum}"/>
			  </tr>
			  <tr height="24">
			    <td colspan="5" width="550">����������������: <c:out value="${govInfoPub.docName}"/></td>
			  </tr>
			  <tr height="24">
			    <td  width="310" >��ȡ������Ϣ�ķ�ʽ����ѡ��</td>
			    <td colspan="5">
			    	<input type="checkbox" <c:if test="${govInfoPub.passWay==20}"> checked="checked"</c:if> name="passWay" value="50" disabled/>�����ʼ� 
	    			<input type=checkbox <c:if test="${govInfoPub.passWay==17}"> checked="checked"</c:if> name="passWay" value="10" disabled/>�ʼ�
	    			<input type="checkbox" <c:if test="${govInfoPub.passWay==19}"> checked="checked"</c:if> name="passWay" value="20" disabled/>����
	    			<input type="checkbox" <c:if test="${govInfoPub.passWay==21}"> checked="checked"</c:if> name="passWay" value="30" disabled/>������ȡ
	    			<input type="checkbox" <c:if test="${govInfoPub.passWay==18}"> checked="checked"</c:if> name="passWay" value="40" disabled/>�ֳ����� 						
			    </td>
			  </tr>
			  <tr height="24">
			    <td width="310" >������Ϣ��������ʽ����ѡ��</td>
			    <td colspan="5">
			    	<input type="checkbox" <c:if test="${govInfoPub.offerWay==10}"> checked="checked"</c:if> name="offerWay" value="10" disabled/>�����ʼ�
	    			<input type="checkbox" <c:if test="${govInfoPub.offerWay==20}"> checked="checked"</c:if> name="offerWay" value="20" disabled/>ֽ���ı�
			  	</td>
			  </tr>
			  <tr height="24">
			    <td  width="310" >����������Ϣ����;</td>
			    <td colspan="5">
			    	<input type="checkbox" id="attr31" value="10" disabled/>��������Ҫ
			    	<input type="checkbox" id="attr32" value="20" disabled/>�������Ҫ
			    	<input type="checkbox" id="attr33" value="30" disabled/>���е���Ҫ
			    	<input type="checkbox" id="attr34" value="40" disabled/>����������Ϣ
					<input type="hidden" id="attr3" name="attr3" value="${govInfoPub.attr3}"/>
				</td>
			  </tr> 
			  <tr height="24">
			    <td  width="310" >�ر���������������������շѣ���Ҫ����</td>
			    <td colspan="5">�����ʼ���ʽ�ݲ��շ�</td>
			  </tr>
			  <tr height="24">
			    <td width="310">������ǩ�������£�</td>
			    <td colspan="3">
			    	&nbsp;
			    </td>
			    <td width="120" >����ʱ��</td>
			    <td width="150"><fmt:formatDate value="${govInfoPub.startTime}" pattern="yyyy-MM-dd"/></td>
			  </tr>	
			 </table>
			 <form action="<%=path%>/xxgkAction.do" method="post" name="oF" id="oF">
			 <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
			<tr height=24>
			<td>ѡ���蹫��������
				<select name="status"><option>��ѡ��</option>
     	   		<option value="128">������Ϣ����������飨����</option>
     	   		<option value="64">������Ϣ����������飨����</option>
        		<option value="256">������Ϣ����������飨�ģ�</option>
     	   		<option value="1024">������Ϣ����������飨�壩</option>
     	   		<option value="16384">������Ϣ����������飨�ˣ�</option>
        		<%--<option value="2048">��������Ϣ���������֪��</option>
        		--%></select>
       		</td>
		</tr>
    	<tr height=24>
    		<td>˵��      &nbsp;
    			<textarea name="remark" cols="90" rows="4"  id="remark"></textarea>
    		</td>
		</tr>
		<input name="bus_id" type="hidden" id="bus_id" value="<c:out value="${govInfoPub.id}"/>">
		<input name="method" type="hidden" id="method" value="createTbGovInfoPubAudit">
		<tr height=24>
			<td align="center">
				<input type="button" name="BCreateWrit" value="��������" onClick="javascript:showWrit();">
			</td>
		</tr>
	</table>
	</form>
	</td>
    </tr>
   
   </table></td>
            </tr>
            <tr>
              <td height="10"></td>
            </tr>
          </table></td>
        </tr>
      </table>

	<script type='text/javascript'>
	var vstatus = $('status').value;
	var oF1=document.forms[0];
	function doSubmit() {
		if(!IsEmpty($('status').value)&&confirm("ȷ�ϲ�����ɣ�"))
		oF1.submit();
	}
	function IsEmpty(s) {
		return (s=='')?true:false;
	}
	function showWrit(){
    	var vaction = null;
		var busId = "<c:out value="${govInfoPub.id}"/>";
		var rem = document.getElementById("remark").value;
		switch(parseInt($('status').value)){
		case 2048:{
			location.href = '<%=basePath%>/fzfxxgksqgzsaction.do?method=add&id='+busId+'&rem='+rem+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';
			break;}
		case 64:{
			location.href = '<%=basePath%>/zfxxgksqdfs3action.do?method=add&id='+busId+'&rem='+rem+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';
			break;}
		case 128:{
			location.href = '<%=basePath%>/zfxxgkDealaction.do?method=addTwo&id='+busId+'&rem='+rem+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';
			break;}
		case 256:{
			location.href = '<%=basePath%>/zfxxgksqdfs4action.do?method=add&id='+busId+'&rem='+rem+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';
			break;}
		case 1024:{
			location.href = '<%=basePath%>/reply5.do?method=reply5List&id='+busId+'&rem='+rem+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';
			break;}
		case 16384:{
			location.href = '<%=basePath%>/zfxxgksqdfaction.do?method=add&id='+busId+'&rem='+rem+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';
			break;}
		default:
		}
		//if(!IsEmpty($('status').value)){
		//	location.href = '<%=basePath%>'+vaction+'Action.do?method=getWrit&writId=&busId='+busId;
		//	window.open('<%=basePath%>'+vaction+'Action.do?method=getWrit&writId=&busId='+busId,'','');
		//}
	}
	
	</script>
</body>
</html>
