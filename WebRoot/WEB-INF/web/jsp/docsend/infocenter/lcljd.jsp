<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/web/inc/taglibs.jsp"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>

    <table width="99%" border="0" cellpadding="0" cellspacing="1" class="tabin1_in">
      	<thead>
       <tr>
        	<td width="20%" height="25" align="center">�ļ�����</td>
        	<td colspan="4" align="center"><bean:write name="xdocSendForm" property="fileTitle"/></td>
       </tr>
       <tr>
    		<td width="20%" height="25" align="center">������</td>
    		<td width="20%" align="center">����ʱ��</td>
    		<td width="20%" align="center">ǩ��ʱ��</td>
    	���� <td width="20%" align="center">����ʱ��</td>
    	   	<td align="center">������</td>
    	</tr>
    	<logic:iterate id="item" name="sclzdList">
    	<tr>
		    <td height="25" align="center">${item.stateName}</td>
    		<td align="center"><bean:write format="yyyy-MM-dd HH:mm" name="item" property="createTime"/></td>
    		<td align="center"><bean:write format="yyyy-MM-dd HH:mm" name="item" property="inputTime"/></td>
    		<td align="center"><bean:write format="yyyy-MM-dd HH:mm" name="item" property="closeTime"/></td>
    		<td align="center">${item.userName}</td>
		 </tr>
		</logic:iterate>
		</thead>
 	 </table> 
