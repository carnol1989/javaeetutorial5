<%@ page contentType="text/html;charset=GBK"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String busId = request.getParameter("busId");
	pageContext.setAttribute("busId", busId);
%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type='text/javascript' src='<%=basePath%>dwr/util.js'></script>
		<script type='text/javascript' src='<%=basePath%>dwr/engine.js'></script>
		<script language="javascript" src="<%=basePath%>js/prototype.js"></script>
		<script type="text/javascript" src="<%=path%>/javascript/calendar.js"></script>
		<script language="javascript"
			src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>

		<style type="text/css">
	  table{
			FONT: ����_GB2312 С��;
	        line-height: 2.5;
			border-collapse: collapse;
		}
	.wtitle {
	FONT-WEIGHT: bold;
	FONT: С�� ����С���μ���;
	text-align: center;
    }
	</style>
		<title>�ǡ��Ϻ���������Ϣ�����涨����ָ������Ϣ��֪��</title>
	</head>

	<body>
		<div align="center">
			<input type="button" name="bSave" value="����"
				onClick="javascript:doSubmit();">
			<input type="button" name="bEdit" value="�޸�">
			<input type="button" name="bPrint" value="��ӡ">
		</div>
		<form action="<%=path%>/writ4Action.do" method="post" name="oF"
			id="oF">
			<div align="center">
				<table width="600" border="0">
					<tr>
						<td>
							<div class="wtitle">
								�ǡ��Ϻ���������Ϣ�����涨����ָ������Ϣ��֪��
							</div>
							<div align="right">
								<input type="text" name="wsh"
									value="<c:out value="${tbWrit4.wsh}"/>">
							</div>
							<br>
							<input type="text" name="textfield4"
								value="<c:out value="${tbWrit4.wsh}"/>">
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;������λ����
							<input name="applydate" type="text" id="applydate" size="9"
								onfocus="new WdatePicker(this,null,false,'whyGreen')"
								value="<fmt:formatDate value="${govInfoPub.startTime}" pattern="yyyy-MM-dd"/>">
							�յ���������λ����
							<br>
							��
							<input type="text" name="sqnc"
								value="<c:out value="${tbWrit4.sqnc}"/>">
							�����룬������
							<br>
							��֤����
							<input type="text" name="sjzm"
								value="<c:out value="${tbWrit4.sjzm}"/>">
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;���飬������λ�������ȡ����Ϣ�����ڡ��Ϻ���������Ϣ
								<br>
								�����涨���ڶ�����ָ��������Ϣ�ķ���
							</p>
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��
							<div align="right">
								������ӡ�£�
							</div>
							<div align="right">
								<input
									value="<fmt:formatDate value="${tbWrit4.createdate}" pattern="yyyy-MM-dd"/>"
									name="createdate" type="text" id="createdate" size="9"
									onfocus="new WdatePicker(this,null,false,'whyGreen')">
							</div>
						</td>
					</tr>
				</table>
				<input name="method" type="hidden" id="method">
				<input type="hidden" name="id"
					value="<c:out value="${tbWrit4.id}"/>">
				<input type="hidden" name="busId"
					value="<c:out value="${tbWrit4.busId}" default="${busId}"/>">
		</form>
		</center>
		<script type="text/javascript">
  var writId = $('id').value;
  var oF1=document.forms[0];
  function doSubmit(){
     if(IsEmpty(writId))
     $('method').value = "CreateWrit4";
     else
     $('method').value = "UpdateWrit4";
     
     oF1.submit();
     
  }
   function IsEmpty(s){
        return (s=='')?true:false;
      }
  </script>
	</body>
</html>
