<%@ page language="java"  import="java.util.*,com.baosight.mode.TbGovInfoPub" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String disply=request.getParameter("disply"); 
	String status=request.getParameter("status");
	String passWay = ((TbGovInfoPub)request.getAttribute("record")).getPassWay();
	String email = ((TbGovInfoPub)request.getAttribute("record")).getEmail();
	String docNum = ((TbGovInfoPub)request.getAttribute("record")).getDocNum();
	//String receipt=request.getParameter("receipt");
	
	String afterDate=(String)request.getAttribute("afterDate");//15�������պ������
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'weekSecheduleedit.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=basePath %>css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>css/CSS2.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>images/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
		<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script type="text/javascript">
	//����ҳ�水ť����ʾ
	function setButtonHidden(){
		var disply = "<%=disply%>";
		var status ="<%=status%>";
		var afterDate ="<%=afterDate%>";
		if(disply=="willAudit" || disply == "auditing"){ //����ǴӴ���˻��������ҳ������ҳ��
			replyDiv.style.display="none";
			btnDiv.style.display="block";
	        if(status=="262144" || disply == "auditing"){ // ״̬�Ѿ�Ϊ�ռ���ִ
	            var buttons=document.getElementById("btnDiv").getElementsByTagName("button");
	            buttons[0].style.display="none";
				for (i=1;i<buttons.length;i++){ 
					buttons[i].setAttribute('disabled',false);//���ð�ť��Ч
				}
	        }
	        if(status=="131072" && disply == "auditing"){//���ڴ�
			 	var afterDate = "<%=afterDate%>"; // ���ݿ���15�������պ������
			 	var t = afterDate.split('-');
				var date2=new Date();
				var date1=new Date(parseInt(t[0]),parseInt(t[1]-1),parseInt(t[2])+1);
				if(date1.valueOf()  > date2.valueOf()){ //��ǰʱ��С�����ݿ���15�������պ�����ڰ�ť��Ч
			 		var buttons=document.getElementById("btnDiv").getElementsByTagName("button");
	            	buttons[0].style.display="none";
					for (i=1;i<buttons.length;i++){ 
						buttons[i].setAttribute('disabled',true);//���ð�ť��Ч
					}
			 	}
			}
        }else{
         	btnDiv.style.display="none";
            replyDiv.style.display="block";
        }
	}

	//����checkbox��ѡ��
	function checked(){
		//����������Ϣ����;	
		var attr3=tbGovInfoPubMain.attr3.value;
		if(containStringNumber(attr3,10))	
			tbGovInfoPubMain.attr31.checked=true;
		if(containStringNumber(attr3,20))	
			tbGovInfoPubMain.attr32.checked=true;
		if(containStringNumber(attr3,30))	
			tbGovInfoPubMain.attr33.checked=true;
		if(containStringNumber(attr3,40))	
			tbGovInfoPubMain.attr34.checked=true;
	}
	
	//�ж�һ���ַ����ַ����Ƿ����
	function containStringNumber(str,s){
		if(((str.split(s)).length-1)!=0)
			return true;
		else
			return false;
	}	
	
	// �����ռ���ִҳ��
	function receipt(){
		var id=tbGovInfoPubMain.id.value;
		var passWay="<%=passWay%>";
		var email="<%=email%>";
		window.location='<%=basePath%>zfxxgkDealaction.do?method=addSjhc&id='+id+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>';		
	}
	
	// ����Ȩ������Ϣ��֪��ҳ��
	function obligeeMsg(){
		var id=tbGovInfoPubMain.id.value;
		var passWay="<%=passWay%>";
		var email="<%=email%>";
		var flag='0';
		if(passWay == '17'){
			if(confirm('�Ƿ����ʼ�֪ͨȨ����')){
				flag = '1';
			}
		}
		window.location='<%=basePath%>obligeeMsg.do?method=obligeeMsgList&id='+id+'&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>&flag='+flag;		
	}
	// ��תҳ��
	function forwardJsp(actionName,method){
		var id=tbGovInfoPubMain.id.value;
		window.location=actionName+'.do?method='+method+'&id='+id+"&disply=<%=disply%>&status=<%=status%>&passWay=<%=passWay%>&email=<%=email%>&docNum=<%=docNum%>";
	}
	
	// ����
	function returnl(){
		var disply = "<%=disply%>";
		if(disply == "willAudit"){ //�����
			window.location='<%=basePath%>tbGovInfoPubMain.do?method=list&action=all';
		}else{
			window.location='<%=basePath %>infoAudit.do?method=findAuditList&condition='+disply;
		}	
	}
	function print(){
		var id = tbGovInfoPubMain.id.value;
		var url = "<%=basePath%>tbGovInfoPubMain.do?method=view";
		var isOrNotPrint = "print";
		wholeURL = "<%=basePath%>print.do?method=add&id="+id+"&needPrintURL="+url+"&isOrNotPrint="+isOrNotPrint;
		window.open(wholeURL,'');
	}
	</script>		
</head>	

<body onload="setButtonHidden();checked();">
<html:form action="/tbGovInfoPubMain.do" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="288" height="40" align="left" valign="middle" background="<%=basePath %>images/8-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="5%" align="center" valign="middle">&nbsp;</td>
              <td width="11%" height="12" align="center" valign="middle"><img src="<%=basePath%>images/icon5.gif" width="7" height="7" /></td>
              <td width="84%" class="table2_topic">������Ϣ����</td>
            </tr>
          </table></td>
          <td background="<%=path %>/images/8-2.gif">&nbsp;</td>
        </tr>
      </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0e88b9">
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2bg">
            <tr>
              <td align="center" valign="top"><table width="98%" border="0" cellpadding="0" cellspacing="0" class="table2bgin">
                <tr>
                  <th width="94%" height="30" align="right" valign="bottom"><img src="<%=basePath%>images/fh.gif" width="46" height="25" border="0" onclick="returnl();" 
				onmouseover="this.style.cursor='hand'"/></th>
                  <th width="6%" valign="bottom"></th>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="top">
              <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">	  
			  <tr height="24">
			    <td width="310"  height="24">�����ˣ����ˣ�����</td>
			    <td colspan="5">
					<logic:equal value="10" name="record" property="applyType" >
						<bean:write name="record" property="applicant"/>
					</logic:equal>
				</td>
			  </tr>
			  <tr height="24">
			    <td width="310" >�����ˣ����˻���������֯������</td>
			    <td colspan="3">
					<logic:equal value="20" name="record" property="applyType" >
						<bean:write name="record" property="applicant"/>
					</logic:equal>
				</td>
			    <td width="120" >����������:</td>
			    <td width="150" >
			    	<logic:equal value="20" name="record" property="applyType" >
						<bean:write name="record" property="attr1"/>
					</logic:equal>
				</td>
			  </tr>	
			  <tr height="24">
			    <td width="310" rowspan="3">��ϵ��ʽ</td>
			    <td width="120" >ͨ�ŵ�ַ:</td>
			    <td colspan="2">
					<bean:write name="record" property="applyAddr"/>
				</td>
			    <td width="120" >��������:</td>
			    <td colspan="2">
					<bean:write name="record" property="postcode"/>
			    </td>
			  </tr>
			  <tr height="24">
			    <td width="120" >��ϵ�绰:</td>
			    <td width="230">
					<bean:write name="record" property="phone"/>
				</td>
			    <td width="120" >��ϵ��:</td>
			    <td colspan="2" width="270">
			    	<logic:equal value="10" name="record" property="applyType" >
						<bean:write name="record" property="applicant"/>
					</logic:equal>
			    	<logic:equal value="20" name="record" property="applyType" >
						<bean:write name="record" property="attr1"/>
					</logic:equal>
			    </td>
			  </tr>
			  <tr height="24">
			    <td width="120" >��������:</td>
			    <td colspan="4">
						<bean:write name="record" property="email"/>
				</td>
			  </tr>
			  <tr height="24">
			    <td  width="310" >������Ϣ����������أ�����������</td>
			    <td colspan="5"><bean:write name="record" property="companyName"/></td>
			  </tr>
			  <tr height="24">
			    <td  width="310" rowspan="2" >�����������Ϣ</td>
			    <td width="120" >����:</td>
			    <td colspan="2">
						<bean:write name="record" property="descr"/>
				</td>
			    <td width="120" >�ĺ�:</td>
			    <td width="150">
						<bean:write name="record" property="docNum"/>
			  </tr>
			  <tr height="24">
			    <td colspan="5" width="550">����������������: <bean:write name="record" property="docName"/></td>
			  </tr>
			  <tr height="24">
			    <td  width="310" >��ȡ������Ϣ�ķ�ʽ����ѡ��</td>
			    <td colspan="5">
			    	<html:checkbox property="passWay"  name="record" value="20" disabled="true">�����ʼ�</html:checkbox>
					<html:checkbox property="passWay"  name="record" value="17" disabled="true">�ʼ�</html:checkbox>
					<html:checkbox property="passWay"  name="record" value="19" disabled="true">����</html:checkbox>
					<html:checkbox property="passWay"  name="record" value="21" disabled="true">������ȡ</html:checkbox>
					<html:checkbox property="passWay"  name="record" value="18" disabled="true">�ֳ�����</html:checkbox>					
			    </td>
			  </tr>
			  <tr height="24">
			    <td width="310" >������Ϣ��������ʽ����ѡ��</td>
			    <td colspan="5">
			    	<html:checkbox property="offerWay"  name="record" value="10" disabled="true">�����ʼ�</html:checkbox>
			    	<html:checkbox property="offerWay"  name="record" value="20" disabled="true">ֽ���ı�</html:checkbox>
			  </tr>
			  <tr height="24">
			    <td  width="310" >����������Ϣ����;</td>
			    <td colspan="5">
			    	<input type="checkbox" name="attr31" value="10" disabled/>��������Ҫ
			    	<input type="checkbox" name="attr32" value="20" disabled/>�������Ҫ
			    	<input type="checkbox" name="attr33" value="30" disabled/>���е���Ҫ
			    	<input type="checkbox" name="attr34" value="40" disabled/>����������Ϣ
					<html:hidden property="attr3" name="record"/>
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
			    <td width="150"><bean:write name="record" property="startTime" format="yyyy-MM-dd" /></td>
			  </tr>	
			 </table></td>
                </tr>
                <tr>
                  <td height="10" colspan="2"></td>
                </tr>
                <tr>
                  <td height="20" colspan="2" align="center" valign="top"><table width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
                      <td align="left">
			<html:hidden property="id" />
		
			<div align="center" id="btnDiv">
				<%if (disply.equals("willAudit")){ %>
					<button  class="button0" onclick="if(confirm('ȷ�ϸ�����Ϊ��Ч����'))forwardJsp('tbGovInfoPubMain','delete');">��Ч����</button>
				<%}else{ %>
						<button  class="button0" onclick="forwardJsp('infoAudit','delete');">��Ч����</button>
				<%} %>
						<button class="button0" onclick="receipt();">�ռ���ִ</button>
						<button  class="button0" onclick="forwardJsp('fzfxxgksqgzsaction','add');" disabled="disabled">��������Ϣ</button>
						<button  class="button0" onclick="forwardJsp('zfxxgkDealaction','addOne');" disabled="disabled">ͬ��</button>
						<button  class="button0" onclick="forwardJsp('xxgkAction','getGovInfoPub');" disabled="disabled">��ͬ��</button>
						<button  class="button0" onclick="forwardJsp('reply6','reply6List');" disabled="disabled">����ͬ��</button>
						<button  class="button0" onclick="forwardJsp('zfxxgkbzsqgzsaction','add');" disabled="disabled">��������</button>
						<button  class="button0" onclick="forwardJsp('obligeeOpinion','obligeeOpinionList');" disabled="disabled">�����ѯ</button>	
						<button  class="button0" onclick="obligeeMsg();" disabled="disabled">Ȩ���˸�֪��</button>
						<button  class="button0" onclick="forwardJsp('zfxxgkcfsqgzsaction','add');" disabled="disabled">�ظ�����</button>
						<button  class="button0" onclick="forwardJsp('yqdfgzsaction','add');" disabled="disabled">���ڴ�</button>
						<button class="button0" onclick="print();" disabled="disabled">��ӡ</button>
			</div>
			<div align="center" id="replyDiv" >
				<%
				//String status = request.getParameter("status");
					if(status.equals("8")){
				%>
				<button class="button0" onclick="forwardJsp('zfxxgkDealaction','addOne');">���飨һ��</button>
				<%}else if(status.equals("128")){%>
				<button class="button0" onclick="forwardJsp('zfxxgkDealaction','addTwo');">���飨����</button>
				<%}else if(status.equals("64")){%>
				<button class="button0" onclick="forwardJsp('zfxxgksqdfs3action','add');">���飨����</button>
				<%}else if(status.equals("256")){%>
				<button class="button0" onclick="forwardJsp('zfxxgksqdfs4action','add');">���飨�ģ�</button>
				<%}else if(status.equals("1024")){%>
				<button class="button0" onclick="forwardJsp('reply5','reply5List');">���飨�壩</button>
				<%}else if(status.equals("2048")){%>
				<button class="button0" onclick="forwardJsp('fzfxxgksqgzsaction','add');">��������Ϣ��������</button>
				<%}else if(status.equals("16384")){%>
				<button class="button0" onclick="forwardJsp('zfxxgksqdfaction','add');">���飨�ˣ�</button>
				<%}else if(status.equals("16")){%>
				<button class="button0" onclick="forwardJsp('reply6','reply6List');">���飨����</button>
				<%}else if(status.equals("32")){%>
				<button class="button0" onclick="forwardJsp('zfxxgkbzsqgzsaction','add');">��������</button>
				<%}else if(status.equals("2")){%>
				<button class="button0" onclick="forwardJsp('obligeeOpinion','obligeeOpinionList');">�����ѯ</button>
				<%}else if(status.equals("8200") || status.equals("12298")){%>
				<button class="button0" onclick="forwardJsp('reply7','reply7List');">���飨�ߣ�</button>
				<%}else if(status.equals("262144")){%>
				<button class="button0" onclick="forwardJsp('zfxxgkDealaction','addSjhc');">�����ռ���ִ</button>
				<%}else if(status.equals("32768")){%>
				<button class="button0" onclick="forwardJsp('obligeeMsg','obligeeMsgList');">Ȩ���˸�֪��</button>
				<%}else if(status.equals("65536")){%>
				<button class="button0" onclick="forwardJsp('zfxxgkcfsqgzsaction','add');">�ظ�����</button>
				<%}else if(status.equals("131072")){%>
				<button class="button0" onclick="forwardJsp('yqdfgzsaction','add');">���ڴ�</button> 
				<%} %>
			</div>
			</td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="20" colspan="2"></td>
                </tr>
                
              </table></td>
            </tr>
            <tr>
              <td height="10"></td>
            </tr>
          </table></td>
        </tr>
      </table>
</html:form>	
	</body>
</html>



