<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<html>
	<head>
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			//�Ƿ�����
			String insureflag = (String) request.getAttribute("insureflag");
			boolean flag = true;
			if (insureflag != null) {
				if ("true".equals(insureflag)) {
					flag = false;
				} else {
					flag = true;
				}
			}
		%>
		<base href="<%=basePath%>">
		<title>����ƽ̨</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/css/CSS1.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/CSS2.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/images/style.css" rel="stylesheet"
			type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=path%>/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
		<script src="<%=path%>/javascript/validate.js"></script>
		<script type="text/javascript" src="<%=path%>/javascript/calendar.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=path%>/javascript/calendar-setup.js"></script>
		<script type="text/javascript" src="<%=path%>/js/calendarS.js"></script>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<script type="text/javascript">
			function inputTree(flag){
				var url = "";
				if(flag=="comm"){
					url = "<%=basePath%>shortInfo.do?method=inputCommonGroup";
				}
				if(flag=="indu"){
					url = "<%=basePath%>shortInfo.do?method=inputIndualGroup";
				}				
				openWin(url,"600px","600px","");
			}
			function openWin(url,width,height,other){
				var win = window.showModalDialog(url,window,"dialogWidth:"+width+";dialogHeight:"+height+";center:yes;resizable:no;status:no;scroll:auto;help:no;edge:raised"+other);
			}
			function checkin(){
					if(document.smsScheduleForm.messageContent.value==""){
						alert("�������ݲ���Ϊ�գ�");
						return false;
					}
					if(document.smsScheduleForm.messageContent.value.length>140){
						alert("�������ݳ���ָ�����ȣ�");
						return false;
					}
					var smscount=989065;
					var currentcount=0;
				    if(document.smsScheduleForm.destNumberPhone.value!=""){
						var pattern=/[^0-9; ]/;
						if(pattern.test(document.smsScheduleForm.destNumberPhone.value)==true){
							alert("�ֻ����������ʽ�������������룡");
							return false;
						}
					}
					if(document.smsScheduleForm.destNumberObject.value=="" && document.smsScheduleForm.destNumberPhone.value==""){
						alert("���Ͷ�����Ϊ�գ�");
						return false;
					}
				    return true;
				//	var frm = document.forms[0];
				//	frm.submit();
		}	
		function clean_click(){
		  document.smsScheduleForm.messageContent.value ="";
		   document.smsScheduleForm.destNumberObject.value ="";
		    document.smsScheduleForm.destNumberPhone.value ="";
		}	
		// ����ͨѶ¼
		function addbookList(idText,nameText,mobileText,groupsText){
		    window.open("<%=path%>/commonalityTree.do?method=input&idText="+idText+"&nameText="+nameText+"&mobileText="+mobileText+"&flag="+groupsText,"",'width=450,height=500,top=100, left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
		//	window.showModalDialog("<%=path%>/commonalityTree.do?method=input&idText="+idText+"&nameText="+nameText+"&mobileText="+mobileText+"&groupsText="+groupsText,window,'dialogwidth:450px;dialogheight:500px;help:0;center:yes;resizable:0;status:0;scroll:yes');
		}
		// ����ͨѶ¼
		function addbooIndividualkList(idText,nameText,mobileText,groupsText){
		  window.open("<%=path%>/individualTree.do?method=input&idText="+idText+"&nameText="+nameText+"&mobileText="+mobileText+"&groupsText="+groupsText,"",'width=450,height=500,top=100, left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
			//window.showModalDialog("<%=path%>/individualTree.do?method=input&idText="+idText+"&nameText="+nameText+"&mobileText="+mobileText+"&groupsText="+groupsText,window,'dialogwidth:450px;dialogheight:500px;help:0;center:yes;resizable:0;status:0;scroll:yes');
		}	
		function systemTime(){
		   	today = new Date();
			sday = fmtl(today.getYear(),4)+"-"+fmtl(today.getMonth()+1,2)+"-"+fmtl(today.getDate(),2);
			//stime = fmtl(today.getHours(),2)+":"+fmtl(today.getMinutes(),2);
			shours = fmtl(today.getHours(),2);
			sminutes = fmtl(today.getMinutes(),2);
			//ses = fmtl(today.getSeconds(),2);
			document.getElementById("scheduletime").value = sday;
			document.getElementById("sendTime_hour").value = shours;
			document.getElementById("sendTime_minute").value = ":"+sminutes+":00";
			//obj.value+="---${SYSTEM_USER_SESSION.name}ͬ־  "+sday+" "+stime;
		}
		function fmtl(s,l){
			ss = ""+s;
			if(ss.length<l){
				for(i=0;i<l-ss.length;i++){
					ss = "0"+ss;
				}
			}
			return ss;
		}
		function displaylist(divname) {
			var adv=document.getElementById(divname);
		           if(adv.style.display=="none") {
		                         adv.style.display="";
		                         //advtext.innerText="�ر��б�";
		              } else {
		                         adv.style.display="none";
		                        //advtext.innerText="��ʾ�б�";
		               }
		}
		
		</script>
		<style>
	a:link {text-decoration: none;}
	a:visited {text-decoration: none;}
	a:active {text-decoration: none;}
	a:hover {text-decoration: none;}
	</style>
	</head>
	<body onload="systemTime();">
		<html:form action="/shortInfo?method=executeSave">
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="288" height="40" align="left" valign="middle"
									background="<%=path%>/images/8-1.gif">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="5%" align="center" valign="middle">
												&nbsp;
											</td>
											<td width="11%" height="12" align="center" valign="middle">
												<img src="<%=path%>/images/icon5.gif" width="7" height="7" />
											</td>
											<td width="84%" class="table2_topic" align="right">
												��Ϣ����
											</td>
										</tr>
									</table>
								</td>
								<td background="<%=path%>/images/8-2.gif">
									&nbsp;
								</td>
							</tr>
						</table>
						<table width="100%" align="center" border="1" cellpadding="0"
							cellspacing="1" bgcolor="#0e88b9">
							<tr>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="table2bg">
										<tr>
											<td align="center" valign="top">
												<table width="98%" border="0" cellpadding="0"
													cellspacing="0" class="table2bgin">
													<tr>
														<th height="15" valign="bottom"></th>
													</tr>
													<tr>
														<td align="center" valign="bottom">

															<table width="98%" class="tabin_in" border="0"
																cellpadding="0" cellspacing="1">
																<tr>
																	<td bgcolor="deeef8" width="20%" align="center">
																		��������
																	</td>
																	<td bgcolor="f7f7f7" align="left">
																		<html:textarea styleClass="shuruk2"
																			property="messageContent" rows="7" cols="60"></html:textarea>
																		<br>
																		<strong>(<font color="#FF0000">ע��:</font>�������ݲ��ܳ���70�������ֻ�140��Ӣ���ַ���)</strong>
																	</td>
																</tr>
																<tr>
																	<td bgcolor="deeef8">
																		���Ͷ���
																	</td>
																	<td bgcolor="f7f7f7" align="left">
																		<html:text styleClass="shuruk2"
																			property="destNumberObject" size="60" maxlength="200"></html:text>
																		<br>
																		<input type="hidden" name="commId"/>
																		<input type="hidden" name="commNumber"/>
																		<input type="hidden" name="commDepart"/>
																		<input type="button" class="button0" value="����ͨѶ¼"
																			onclick="addbookList('commId','destNumberObject','commNumber','commDepart');"
																			onmouseover="this.style.cursor='hand'">
																		<input type="hidden" name="IndivId"/>
																		<input type="hidden" name="IndivNumber"/>
																		<input type="hidden" name="IndivDepart"/>	
																		<input type="button" class="button0" value="����ͨѶ¼"
																			onclick="addbooIndividualkList('IndivId','destNumberObject','IndivNumber','IndivDepart');"
																			onmouseover="this.style.cursor='hand'">
																	</td>
																</tr>
																<tr>
																	<td bgcolor="deeef8">
																		�ֻ�����
																	</td>
																	<td bgcolor="f7f7f7" align="left">
																		<html:text styleClass="shuruk2"
																			property="destNumberPhone" size="60" maxlength="200" />
																	</td>
																</tr>
																<tr>
																	<td bgcolor="deeef8">
																		&nbsp;
																	</td>
																	<td bgcolor="f7f7f7" align="left">
																		<strong>(<font color="#FF0000">��</font> </strong>��ͨ��ͨѶ¼ѡ�˿�ֱ����д�ֻ����룬�������֮���Էֺ�(
																		<strong><font color="ff0000">;</font> </strong>)�ָ���лл!
																		<strong>)</strong>
																	</td>
																</tr>
																<tr>
																	<td bgcolor="deeef8">
																		����ʱ��
																	</td>
																	<td bgcolor="f7f7f7" align="left">
																		<input type="radio" name="informRightNow" value="true"
																			checked>
																		��������
																		<input type="radio" name="informRightNow"
																			value="false">
																		��ʱ����
																		<html:text styleClass="shuruk2"
																			property="scheduletime" onfocus="setday(this)"
																			readonly="true" style="cursor:hand" size="10"></html:text>
																		<html:select styleClass="shuruk2"
																			property="sendTime_hour">
																			<html:options collection="hhList" property="value"
																				labelProperty="label" />
																		</html:select>
																		<html:select styleClass="shuruk2" property="sendTime_minute">
																			<html:options collection="mmList" property="value"
																				labelProperty="label" />
																		</html:select>

																	</td>
																</tr>
																<TR bgcolor="f7f7f7">
																	<TD colspan=2>
																		<input type="checkbox" name="sdjb" value="checked"
																			onClick="displaylist('jb')">
																		�ֶ�����Ԥ���ź�(��Ѵ��Ϣ������ͼ��)
																	</td>
																</tr>
																<TR bgcolor="f7f7f7">
																	<TD colspan=2>
																		<div id="jb" style="display:none">
																			<table width="100%" border=0 cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td>
																				<tr>
																					<td>
																						<input type='checkbox' name='jbname' id='jbname1'
																							value='��Ѵ��̨��ɫͼ��'>
																						��Ѵ��̨��ɫͼ��
																						<br>

																						<input type='checkbox' name='jbname' id='jbname2'
																							value='��Ѵ��̨��ɫͼ��'>
																						��Ѵ��̨��ɫͼ��
																						<br>
																						<input type='checkbox' name='jbname' id='jbname3'
																							value='��Ѵ��̨��ɫͼ��'>
																						��Ѵ��̨��ɫͼ��
																						<br>

																						<input type='checkbox' name='jbname' id='jbname4'
																							value='��Ѵ��̨��ɫͼ��'>
																						��Ѵ��̨��ɫͼ��
																						<br>


																						<input type='hidden' name='url2' id='url2'
																							value='' size=20>

																						<input type='hidden' name='text2' id='text2'
																							value='�ܽ�ǿ��ˮ����Ӱ��,δ��6Сʱ�����ۼƽ���������50mm���з�Ѵָ�Ӳ�������15:45������Ѵ��̨��ɫԤ���ź�,�뼰ʱ����3����Ӧ��'
																							size=20>

																					</td>
																					<td>
																						<input type='checkbox' name='jbname' id='jbname11'
																							value='ˮλ��ɫͼ��'>
																						ˮλ��ɫͼ��
																						<br>

																						<input type='checkbox' name='jbname' id='jbname12'
																							value='ˮλ��ɫͼ��'>
																						ˮλ��ɫͼ��
																						<br>
																						<input type='checkbox' name='jbname' id='jbname13'
																							value='ˮλ��ɫͼ��'>
																						ˮλ��ɫͼ��
																						<br>

																						<input type='checkbox' name='jbname' id='jbname14'
																							value='ˮλ��ɫͼ��'>
																						ˮλ��ɫͼ��
																						<br>

																						<input type='hidden' name='url3' id='url3'
																							value='' size=20>

																						<input type='hidden' name='text3' id='text3'
																							value='�Ϻ��з�Ѵ��Ϣ����2007��10��8��15:00�����߳�λ��ɫԤ���źţ���16��̨�硰��ɯ��Ӱ�죬Ԥ��10��9��00��05���ֽ����ݺӿ��ӳ���λ���ﵽ4.75�ף������Ѵ�йز��š��ؽ���ص�λ����Ӧ��׼����'
																							size=20>

																					</td>
																					<td>
																						<input type='checkbox' name='jbname' id='jbname21'
																							value='��Ѵ��̨��ɫ���ͼ��'>
																						��Ѵ��̨��ɫ���ͼ��
																						<br>

																						<input type='checkbox' name='jbname' id='jbname22'
																							value='��Ѵ��̨��ɫ���ͼ��'>
																						��Ѵ��̨��ɫ���ͼ��
																						<br>
																						<input type='checkbox' name='jbname' id='jbname23'
																							value='��Ѵ��̨��ɫ���ͼ��'>
																						��Ѵ��̨��ɫ���ͼ��
																						<br>

																						<input type='checkbox' name='jbname' id='jbname24'
																							value='��Ѵ��̨��ɫ���ͼ��'>
																						��Ѵ��̨��ɫ���ͼ��
																						<br>


																						<input type='hidden' name='url4' id='url4'
																							value='' size=20>

																						<input type='hidden' name='text4' id='text4'
																							value='���н�����ױ������Լ���,�з�Ѵָ�Ӳ�������17:35�����Ѵ��̨��ɫԤ���ź�,��ת�볣ֵ̬�ࡣ'
																							size=20>
																					</td>
																				</tr>
																			</table>
																		</div>
																	</td>
																</tr>



																<tr>
																	<td colspan=2 align=center bgcolor="f7f7f7">
																		<p>
																			<html:submit styleClass="button0" value="�ύ"
																				onclick="return checkin();"></html:submit>
																			&nbsp; &nbsp;&nbsp;
																			<input class="button0" type="button" value="ȡ��"
																				name="sss" onclick="clean_click()" />
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

																		</p>
																	</td>
																</tr>
																<TR bgcolor="f7f7f7">
																	<TD colspan=2>
																		<table width="100%" border=0 cellpadding="0"
																			cellspacing="0">
																			<tr>
																				<td>
																					<strong>ʹ�ö��Ž��շ���Ͷ��ŷ���ƽ̨���񣬽���ʾ������������ĳ��Ϻͽ��ܣ�</strong>
																					<br>
																					&nbsp;&nbsp;&nbsp;1�������й��йط��ɷ���Ĺ涨��
																					<br>
																					&nbsp;&nbsp;&nbsp;2�������÷������Ƿ���;��
																					<br>
																					&nbsp;&nbsp;&nbsp;3�������ŷ�����������С�
																					<br>
																					&nbsp;&nbsp;&nbsp;4������������ʹ�÷����йص�����Э�顢�涨������͹�����
																					<br>
																					&nbsp;&nbsp;&nbsp;5���û�����Լ����Ϻ��з�Ѵ��Ϣ���Ķ���ƽ̨�ϵ���Ϊ�е��������Ρ���ر��ܼ��ɣ���й¶�ڲ���Ϣ��
																					<br>
																					&nbsp;&nbsp;&nbsp;6���û���ŵ��ɢ���ʹ���������ɫ���Υ����Ϣ���������κηǷ��ġ�ɧ���Եġ��������˵ġ�������
																					<br>
																					&nbsp;&nbsp;&nbsp;�ġ������Եġ��˺��Եġ�ӹ�׵ģ��������Ϣ���ϡ�
																					<br>
																				</td>

																			</tr>
																		</table>
																	</TD>
																</TR>
															</table>
														</td>
													<tr>
														<td height="10"></td>
													</tr>
												</table>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td height="8"></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<html:hidden property="chkCommId"></html:hidden>
						<html:hidden property="chkInduId"></html:hidden>
</td></tr></table>
						</html:form>
	</body>
</html>

