<%@ page contentType="text/html; charset=gb2312" language="java"errorPage="" %>
<%@ page import="com.baosight.mode.TbDocsendListitems"%>
<%@ page import="com.baosight.mode.TbDocsendSubject"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List areatypelist = (List)request.getAttribute("areatypelist");
List leibieciList = (List)request.getAttribute("leibieciList");
List leishuciList = (List)request.getAttribute("leishuciList");
//List gongwenTypeList = (List)request.getAttribute("gongwenTypeList");

%>
<html>
<head>
    <base href="<%=basePath%>">

    <title>�����</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="images/style.css" rel="stylesheet" type="text/css">
<script language="javascript">

function tijiao(){
	if (document.f1.choose1.value =="") {
		alert("��ѡ�����ʣ�");
		return false;
	}
	if (document.f1.choose.value =="") {
		alert("��ѡ�������ʣ�");
		return false;
	}
	if (document.f1.choose2.value =="") {
		alert("��ѡ�������࣡");
		return false;
	}
	window.dialogArguments.document.getElementById("topicWord").value=document.f1.choose1.value+","+document.f1.choose.value+","+document.f1.choose2.value;
	window.close();	 
}


function add(leng){
	  var pur = "";
  if(leng > 1){
	  for (var i=0; i<document.f1.del.length; i++) {
		if (document.f1.del[i].checked == true) {
			pur += document.f1.del[i].value + ",";	
		  }  
	  }
  }else if(document.f1.del.checked == true){
	pur = document.f1.del.value + ",";
  }
  if(pur!=""){
	pur=pur.substring(0,pur.length-1);
  }
     document.f1.choose.value=pur;  
}

function add1(pur){	 
     document.f1.choose1.value=pur;  
}
function add2(pur){	 
     document.f1.choose2.value=pur;  
}
function OptionChange()
{
	var style1=f1.type1;
	var style2=f1.type2;
	obj1tr=f1.all.tb1.getElementsByTagName("tr");
	obj2tr=f1.all.tb2.getElementsByTagName("tr");
	for (var i=1;i<obj1tr.length;i++) {
		child=obj1tr[i];
		if ((child.py==style2.value || style2.value=="") && (child.cls==style1.value || style1.value=="")){
			child.style.display="block";
		}else{
			child.style.display="none";
		}
	}
	for (var i=1;i<obj2tr.length;i++) {
		child=obj2tr[i];
		if ((child.py==style2.value || style2.value=="") && (child.cls==style1.value || style1.value=="")){
			child.style.display="block";
		}else{
			child.style.display="none";
		}
	}
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="f1" method="Post">
  <table width="99%" align="center" border="0" cellpadding="0" cellspacing="1" class="tabin_in">
    <tr> 
      <th colspan="2" height="24">��ѡ������ʵ����/����</th>
    </tr>
    <tr> 
      <td width="13%" nowrap align="left" height="24"><b>�������</b></td>
      <td align="left" > 
        <select name="type1" style="width:110px " onChange="OptionChange();">
        <option value="">ȫ��</option>
          <%
	               //ѭ������������ĸ���ֵ
				    long class2;String title2;
					
	                for(int m=1;m<areatypelist.size();m++){
					   class2 = ((TbDocsendSubject)areatypelist.get(m)).getClass_();
					  
					   title2 = ((TbDocsendSubject)areatypelist.get(m)).getTitle();
    	  %>
          <option value="<%=class2%>"><%=title2%></option>
          <%                 }
	%>
        </select>
      </td>
    </tr>
    <tr> 
      <td align="left" height="24"><b>����</b></td>
      <td align="left" > 
        <select name="type2" onChange="OptionChange();">
		  <option value="">ȫ�� </option>
          <option value="A"> A </option>
          <option value="B"> B </option>
          <option value="C"> C </option>
          <option value="D"> D </option>
          <option value="E"> E </option>
          <option value="F"> F </option>
          <option value="G"> G </option>
          <option value="H"> H </option>
          <option value="I"> I </option>
          <option value="J"> J </option>
          <option value="K"> K </option>
          <option value="L"> L </option>
          <option value="M"> M </option>
          <option value="N"> N </option>
          <option value="O"> O </option>
          <option value="P"> P </option>
          <option value="Q"> Q </option>
          <option value="R"> R </option>
          <option value="S"> S </option>
          <option value="T"> T </option>
          <option value="U"> U </option>
          <option value="V"> V </option>
          <option value="W"> W </option>
          <option value="X"> X </option>
          <option value="Y"> Y </option>
          <option value="Z"> Z </option>
        </select> </td>
    </tr>
    <tr> 
      <td align="left" height="24"><b>ѡ������</b></td>
        <td align="left">����:<input type="text" name="choose1" class="top_input" value=''>&nbsp;������:<input type="text" name="choose" class="tab_input" value=''>&nbsp;��������:<input type="text" name="choose2" class="top_input" value=''>
		<input type="button" value="�ύ" class="button0" onclick="tijiao()">
		<input type="button" value="����" class="button0" onclick="window.close()">
		</td>
    </tr>
  </table>
  <table width="99%" align="center">
  <tr><td width="33%" valign="top">
  <table width="100%" border="0" cellpadding="2" cellspacing="1" id="tb1" class="tabin_in">
    <tr> 
      <th colspan="2">�����б�</th>
    </tr>
    <% 
		// ������������������б�		
		for(int i=0;i<leibieciList.size();i++){
			TbDocsendSubject item1 = (TbDocsendSubject)leibieciList.get(i);
	
	if(!"".equals(item1.getPinyin())&&(item1.getPinyin()!=null)){%>
    <tr py="<%=item1.getPinyin() %>" cls="<%=item1.getClass_() %>"> 
      <td nowrap="nowrap"><input type="radio" name="del1" onclick="add1('<%=item1.getTitle()%>')">
        <%=item1.getPinyin()%></td>
      <td nowrap><%=item1.getTitle()%></td>
      <%}%>
    </tr><%}%>
  </table>
  </td>
  <td width="33%" valign="top">
  <table width="100%" border="0" cellpadding="2" cellspacing="1" id="tb2" class="tabin_in">
    <tr> 
      <th colspan="2">�������б�</th>
    </tr>
    <% 
		// ������������������б�		
		for( int i=0;i<leishuciList.size();i++){
				TbDocsendSubject item2 = (TbDocsendSubject)leishuciList.get(i);    
	if(!"".equals(item2.getTitle())){%>
    <tr py="<%=item2.getPinyin() %>" cls="<%=item2.getClass_() %>" > 
      <td nowrap="nowrap"><input type="checkbox" value="<%=item2.getTitle()%>" name="del" onclick="add(<%=leishuciList.size()%>)">
        <%=item2.getPinyin()%></td>
      <td nowrap><%=item2.getTitle()%></td>
      <% } %>
    </tr>
    <%}%>
  </table>
  </td>
  <td width="33%" valign="top">
  <table width="100%" border="0" cellpadding="2" cellspacing="1" class="tabin_in">
    <tr> 
      <th colspan="2">���������б�</th>
    </tr>
	<tr> 
      <td><input type="radio" name="del2" onclick="add2('����')">
        B</td>
      <td nowrap>����</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('�취��ϸ��')">
        B</td>
      <td nowrap>�취��ϸ��</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('����')">
        G</td>
      <td nowrap>����</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('�涨')">
        G</td>
      <td nowrap>�涨</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('��')">
        H</td>
      <td nowrap>��</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('�����Ҫ')">
        H</td>
      <td nowrap>�����Ҫ</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('����')">
        J</td>
      <td nowrap>����</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('����')">
        J</td>
      <td nowrap>����</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('����')">
        P</td>
      <td nowrap>����</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('��ʾ')">
        Q</td>
      <td nowrap>��ʾ</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('֪ͨ')">
        T</td>
      <td nowrap>֪ͨ</td>
    </tr>
    <tr>
      <td><input type="radio" name="del2" onclick="add2('ͨ��')">
        T</td>
      <td nowrap>ͨ��</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('���')">
        Y</td>
      <td nowrap>���</td>
    </tr>
    <tr> 
      <td><input type="radio" name="del2" onclick="add2('ָʾ')">
        Z</td>
      <td nowrap>ָʾ</td>
    </tr>
  </table>
  </td>
  </tr>
  </table>
  </form>
</body>
</html>
