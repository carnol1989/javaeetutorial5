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
		<title>��������Ϣ���������֪��</title>
	</head>

	<body>
		<div align="center">
			<input type="button" name="bSave" value="����"
				onClick="javascript:doSubmit();">
			<input type="button" name="bEdit" value="�޸�">
			<input type="button" name="bPrint" value="��ӡ">
		</div>
		<form action="<%=path%>/writ2Action.do" method="post" name="oF"
			id="oF">
			<center>
				<table width="600" border="0">
					<tr>
						<td>
							<div class="wtitle">
								��������Ϣ���������֪��
							</div>
							<div align="right">
								<input type="text" name="textfield4"
									value="<c:out value="${tbWrit2.wsh}"/>">
							</div>
							<br>
							<input type="text" name="textfield4"
								value="<c:out value="${tbWrit2.wsh}"/>">
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;������λ����
							<input name="applydate" type="text" id="applydate" size="9"
								onfocus="new WdatePicker(this,null,false,'whyGreen')"
								value="<fmt:formatDate value="${govInfoPub.startTime}" pattern="yyyy-MM-dd"/>">
							��
							<label for="tjxs1">
								<input type="checkbox" name="tjxs" value="1" id="tjxs1">
								�����ʼ�
							</label>
							<label for="tjxs2">
								<input type="checkbox" name="tjxs" value="2" id="tjxs2">
								�ź�
							</label>
							<input type="checkbox" name="tjxs" value="3" id="tjxs3">
							<br>
							<label for="tjxs3">
								�籨
							</label>
							<label for="tjxs4">
								<input type="checkbox" name="tjxs" value="4" id="tjxs4">
								����
							</label>
							<label for="tjxs5">
								<input type="checkbox" name="tjxs" value="5" id="tjxs5">
								����
							</label>
							<label for="tjxs6">
								<input type="checkbox" name="tjxs" value="6" id="tjxs6">
								����
							</label>
							<label for="tjxs7">
								<input type="checkbox" name="tjxs" value="7" id="tjxs7">
								������ʽ�ύ���й�
							</label>
							<input type="text" name="textfield2"
								value="<c:out value="${tbWrit2.qtxs}"/>">
							<br>
							�Ĳ����Ѿ��յ��������ռ�֤����
							<input type="text" name="textfield3"
								value="<c:out value="${tbWrit2.sjzm}"/>">
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;���飬������λ���ύ�Ĳ��ϲ����ϡ��Ϻ���������Ϣ����
							<br>
							�涨����ʮһ���涨��������Ϣ����������Ҫ�󣬱����ز��ٰ���
							<br>
							���Ϻ���������Ϣ�����涨�������𸴡�
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��
							<div align="right">
								������ӡ�£�
							</div>
							<div align="right">
								<input
									value="<fmt:formatDate value="${tbWrit2.createdate}" pattern="yyyy-MM-dd"/>"
									name="createdate" type="text" id="createdate" size="9"
									onfocus="new WdatePicker(this,null,false,'whyGreen')">
							</div>
						</td>
					</tr>
				</table>
				<input name="method" type="hidden" id="method">
				<input type="hidden" name="id"
					value="<c:out value="${tbWrit2.id}"/>">
				<input type="hidden" name="busId"
					value="<c:out value="${tbWrit2.busId}" default="${busId}"/>">
				<input type="hidden" name="checkbox"
					value="<c:out value="${tbWrit2.tjxs}"/>">
		</form>
		</center>
		<script type="text/javascript">
  var writId = $('id').value;
  var oF1=document.forms[0];
  function doSubmit(){
     if(IsEmpty(writId))
     $('method').value = "CreateWrit2";
     else
     $('method').value = "UpdateWrit2";
     
     oF1.submit();
     
  }
   function IsEmpty(s){
        return (s=='')?true:false;
      }
  </script>
	</body>
</html>
