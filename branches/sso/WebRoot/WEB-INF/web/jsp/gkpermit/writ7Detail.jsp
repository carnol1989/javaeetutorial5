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
		<title>������Ϣ���蹫����֪��</title>
	</head>

	<body>
		<div align="center">
			<input type="button" name="bSave" value="����"
				onClick="javascript:doSubmit();">
			<input type="button" name="bEdit" value="�޸�">
			<input type="button" name="bPrint" value="��ӡ">
		</div>
		<form action="<%=path%>/writ7Action.do" method="post" name="oF"
			id="oF">
			<center>
				<table width="600" border="0">
					<tr>
						<td>
							<div class="wtitle">
								������Ϣ���蹫����֪��
							</div>
							<div align="right">
								�� ���� ��-����
							</div>
							<br>
							�������������������ƣ�
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;��������
							<input name="applydate" type="text" id="applydate" size="9"
								onfocus="new WdatePicker(this,null,false,'whyGreen')"
								value="<fmt:formatDate value="${govInfoPub.startTime}" pattern="yyyy-MM-dd"/>">
							�յ���������λ����
							<br>
							����ִ�� �� ���� ��-��
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;���飬������λ�������ȡ��������Ϣ��
							<p></p>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="reason1">
								<input type="checkbox" name="reason" value="checkbox"
									id="reason1">
								&nbsp;���ڹ�������
							</label>
							<input name="method" type="hidden" id="method">
							<input type="hidden" name="id"
								value="<c:out value="${tbWrit7.id}"/>">
							<input type="hidden" name="busId"
								value="<c:out value="${tbWrit7.busId}" default="${busId}"/>">
							<input type="hidden" name="checkbox"
								value="<c:out value="${tbWrit7.checkbox}"/>">
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="reason2">
								<input type="checkbox" name="reason" value="checkbox"
									id="reason2">
								&nbsp;������ҵ���ܻ��߹������ܵ�����ҵ���ܱ�й¶��
							</label>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="reason3">
								<input type="checkbox" name="reason" value="checkbox"
									id="reason3">
								&nbsp;���ڸ�����˽���߹������ܵ��¶Ը�����˽Ȩ��ɲ����ֺ���
							</label>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="reason4">
								<input type="checkbox" name="reason" value="checkbox"
									id="reason4">
								&nbsp;�������ڵ��顢���ۡ���������е�
							</label>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="reason5">
								<input type="checkbox" name="reason" value="checkbox"
									id="reason5">
								&nbsp;������ִ���йأ���������ܻ�Ӱ���顢���顢ȡ֤��ִ������߻���в����������ȫ��
							</label>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="reason6">
								<input type="checkbox" name="reason" value="checkbox"
									id="reason6">
								&nbsp;�з��ɡ�����涨���蹫�����������Σ�����Ϊ
							</label>
							<br>
							<textarea name="text1" cols="70" rows="2" wrap="VIRTUAL">
								<c:out value="${tbWrit7.text1}" />
							</textarea>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��Ϻ���������Ϣ�����涨����ʮ����һ���
							<input name="text2" type="text" size="4"
								value="<c:out value="${tbWrit7.text2}"/>">
							���
							<br>
							��ʮ�����ڣ����������������λ�������ȡ��������Ϣ����
							<br>
							���ز��蹫����
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;��Ա������������������յ�������֮����60����������
								<br>
								�����������3������������Ժ�����������ϡ�
							</p>
							&nbsp;&nbsp;&nbsp;&nbsp;�ش˸�֪��
							<div align="right">
								������ӡ�£�
							</div>
							<div align="right">
								<input
									value="<fmt:formatDate value="${tbWrit7.createdate}" pattern="yyyy-MM-dd"/>"
									name="createdate" type="text" id="createdate" size="9"
									onfocus="new WdatePicker(this,null,false,'whyGreen')">
							</div>
						</td>
					</tr>
				</table>
			</center>
		</form>
		<script type="text/javascript">
  var writId = $('id').value;
  var oF1=document.forms[0];
  function doSubmit(){
     if(IsEmpty(writId))
     $('method').value = "CreateWrit7";
     else
     $('method').value = "UpdateWrit7";
     
     oF1.submit();
     
  }
   function IsEmpty(s){
        return (s=='')?true:false;
      }
  </script>
	</body>
</html>
