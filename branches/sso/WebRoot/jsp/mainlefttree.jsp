<%@ page contentType="text/html; charset=gb2312" pageEncoding="GBK" %>
<%@include file="commons.jsp"%>
<%@ page import="java.util.*"%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title>�������</title>
    <LINK href="catalog.files/dtree.css" type=text/css rel=StyleSheet>
    <SCRIPT src="catalog.files/dtree.js" type=text/javascript></SCRIPT>
    <SCRIPT src="catalog.files/op.js" type=text/javascript></SCRIPT>
    <META content="MSHTML 6.00.2800.1593" name=GENERATOR>

  	<LINK REL="STYLESHEET" HREF="<%= request.getContextPath() %>/css/CSS1.css" TYPE="text/css">
  </head>  
  <body onload="javascript: d.openAll();">
  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="219" height="533" valign="top" background="../imagine/l-dt.gif"><table width="90%" align="center" cellpadding="0" cellspacing="0">
 <tr>
          <td height="20">
		  </td>
        </tr>
        <tr>
          <td valign="top">
<table width="100%" cellpadding="0" cellspacing="0">
              <tr align="center" class="bg-zwbt"> 
 <td width="50%" height="18"><a href="javascript: d.openAll();">ȫ����</a></td>
 <td height="18"> <a href="javascript: d.closeAll();">ȫ���۵�</a></td>
               </tr>
              <tr> 
                <td height="1" colspan="2" bgcolor="8ccbd9" ></td>
              </tr>
            </table></td>
        </tr>
        
</table>
<SCRIPT type=text/javascript>
    d = new dTree('d');
    
	d.config.folderLinks=true;
	
	//id, pid, name, url, title, target, icon, iconOpen, open	

	d.add('a0','-1',' ','','Govment Resource','right');	
	
	d.add('b0','a0','��������','','��������','right');
		d.add('b1','b0','ְ��ȼ�����','<%=path%>/pstlvlaction.do?method=list','ְ��ȼ�����','right');
		d.add('b2','b0','Ȩ�����͹���','<%=path%>/righttypeaction.do?method=list','Ȩ�����͹���','right');
		d.add('b3','b0','�û��������','<%=path%>/userlvlaction.do?method=list','�û��������','right');
		d.add('b4','b0','Ȩ�޼������','<%=path%>/authlvlaction.do?method=list','�û��������','right');
		d.add('b5','b0','���ż������','<%=path%>/deptlvlaction.do?method=list','�û��������','right');
		d.add('b6','b0','Ӧ��ϵͳ����','<%=path%>/allappSys.do?method=list','Ӧ��ϵͳ����','right');
		
	d.add('c0','a0','��Դ����','','��Դ����','right');
		d.add('c1','c0','������Դ����','<%=path%>/base/function/navigation.do','������Դ����','right');	
		d.add('c2','c0','��ɫ����','<%=path%>/roleaction.do?method=list','��ɫ����','right');
	d.add('d0','a0','Ȩ�޹���','','Ȩ�޹���','right');
		d.add('d1','d0','��֯��������','<%=path%>/orgmainaction.do','��֯��������','right');	
		d.add('d2','d0','��ɫȨ�޹���','<%=path%>/base/roleAuth/navigation.do','��ɫȨ�޹���','right');	
		d.add('d3','d0','��ɫ�û�����','<%=path%>/roleusermainaction.do','��ɫ�û�����','right');		
	
	
	d.selectedNode=Node('b0','a0','��������','','��������','right');
	document.write(d);
	
</SCRIPT>
</td>
</tr>

</table>



</body>
</html:html>
