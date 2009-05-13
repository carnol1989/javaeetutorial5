<HTML>
	<HEAD>
		<%@ page contentType="text/html;charset=gb2312"%>
		<%@ page import="com.baosight.layout.*"%>
		<%@ page import="com.baosight.layout.table.*"%>
		<%@ page import="com.baosight.layout.portlet.*"%>
		<%@ page import="java.sql.*"%>
		<%@ page import="java.util.*,com.baosight.mode.TbUser"%>
		<%
					TbUser tbUser = (TbUser) request.getSession().getAttribute(
					"SYSTEM_USER_SESSION");
			String loginType = (String) request.getAttribute("loginType");
			boolean bSuccess = true;//����һ�������ͱ���
			BasePortletClass baseClass = null;
			Vector portlets = new Vector();//���ڴ洢����Ҫ��ʾ��С����(ID)
			String userId = tbUser.getId();//���Session��ֵ
			UserEO user = new UserEO();
			LayoutEO layout = null;//����LayoutEO����
			if (userId == null || userId.equals("")) {//���sesiion��ֵΪnull��Ϊ��
				bSuccess = false;
				if (loginType != null && loginType.equals("1")) {
					response.sendRedirect("index_ju.jsp");
				} else if (loginType != null && loginType.equals("2")) {
					response.sendRedirect("index_xxzx.jsp");
				} else if (loginType != null && loginType.equals("3")) {
					response.sendRedirect("index_slzx.jsp");
				} else {
					response.sendRedirect("index.jsp");//ת��index.jsp
				}
			}
			if (userId != null) {
				System.out.println("-------" + userId);
				user.setId(userId);
				user.setName(tbUser.getName());
				user.setPassword(tbUser.getPwd());
				user.setUserAcc(tbUser.getUserAcc());
			}
			if (bSuccess)
				layout = LayoutEO.getInstance(user);//��ø��û������õĲ���
		%>
		<TITLE>���Ի���ҳ</TITLE>
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/calendar.css">
		<script type="text/javascript" src="js/prototype-1.4.0.js"></script>
	</HEAD>
	<link href="css/index-css.css" rel="stylesheet" type="text/css">
	<body style='overflow:scroll;overflow-x:hidden' leftmargin="0"
		topmargin="0">
		<input type="button" value="����´���" onclick="openpan()"/>
		<table width="885" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="#FFFFFF" id="parentTable">
			<TR>
				<TD width="310" id="left">
					<!-- ��������ʾ����С���ڿ�ʼ-->
					<%
						portlets = layout.getNarrowLeft();//���������е�С����
						for (int i = 0; i < portlets.size(); i++) {//ѭ��С����
							String portID = (String) portlets.get(i);
							PortletEO portlet = new PortletEO(Integer.parseInt(portID));
							if (portlet != null && portlet.getId() > 0) {
								String className = portlet.getJavaClassName();//��ø�С���ڶ�Ӧ��Java��
								try {//ʹ���෴�����װ�ظ���
							baseClass = (BasePortletClass) Class.forName(className)
									.newInstance();
							out.println(baseClass.render(user, portlet));//��ʾС����
								} catch (ClassNotFoundException cnfe) {
							continue;
								}
							}
						}
					%>
					<!-- ��ʾ����С���ڽ���-->
				</TD>
				<TD width="310" id=wide>
					<!-- ��������ʾ�м��С���ڿ�ʼ-->
					<%
						portlets = layout.getWide();//����м����е�С����
						for (int i = 0; i < portlets.size(); i++) {//ѭ��С����
							String portID = (String) portlets.get(i);
							PortletEO portlet = new PortletEO(Integer.parseInt(portID));
							if (portlet != null && portlet.getId() > 0) {
								String className = portlet.getJavaClassName();
								try {//ʹ���෴�����װ�ظ���
							baseClass = (BasePortletClass) Class.forName(className)
									.newInstance();
							baseClass.setSide("wide");//����Ϊ�м�
							out.println(baseClass.render(user, portlet));//��ʾС����
								} catch (ClassNotFoundException cnfe) {
							continue;
								}
							}
						}
					%>
					<!-- ��ʾ�м��С���ڽ���-->
				</TD>
				<TD width="310" id=right>
					<!-- ��������ʾ�Ҳ��С���ڿ�ʼ-->
					<%
						portlets = layout.getNarrowRight();//����Ҳ����е�С����
						for (int i = 0; i < portlets.size(); i++) {//ѭ��С����
							String portID = (String) portlets.get(i);
							PortletEO portlet = new PortletEO(Integer.parseInt(portID));
							if (portlet != null && portlet.getId() > 0) {
								String className = portlet.getJavaClassName();
								try {//ʹ���෴�����װ�ظ���
							baseClass = (BasePortletClass) Class.forName(className)
									.newInstance();
							baseClass.setSide("right");//����Ϊ�Ҳ�
							out.println(baseClass.render(user, portlet));//��ʾС����
								} catch (ClassNotFoundException cnfe) {
							continue;
								}
							}
						}
					%>
					<!-- ��ʾ�Ҳ��С���ڽ���-->
				</TD>
			</TR>
		</TABLE>
		<table width="885" border="0" cellpadding="0" cellspacing="0"
			align="center" bgcolor="#FFFFFF">
			<tr>
				<td align="center" valign="top">
					<table width="885" align="center" bgcolor="#FFFFFF" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<select
									onchange="javascript:window.open(this.options[this.selectedIndex].value)"
									name="select2">
									<option selected="selected">
										����ʡ��ˮ������
									</option>
									<option value="http://www.bjwater.gov.cn" />
										������
									<option value="http://www.shanghaiwater.gov.cn" />
										�Ϻ���
									<option value="http://www.tjwcb.gov.cn" />
										�����
									<option value="http://www.cqwater.gov.cn" />
										������
									<option value="http://www.water.hebnet.gov.cn" />
										�ӱ�ʡ
									<option value="http://www.sxwater.gov.cn" />

										ɽ��ʡ
									<option value="http://www.dwr.ln.gov.cn" />





										����ʡ
									<option value="http://slt.jl.gov.cn" />





										����ʡ
									<option value="http://www.e-gov.hl.cn/agriculture/shuili">
										������ʡ
									</option>
									<option value="http://www.jswater.gov.cn" />





										����ʡ
									<option value="http://www.zjwater.com" />





										�㽭ʡ
									<option value=" http://www.ahsl.gov.cn/   ">
										����ʡ
									</option>
									<option value="http://www.fjwater.gov.cn" />





										����ʡ
									<option value="http://www.jxfx.gov.cn/  ">
										����ʡ
									</option>
									<option value="http://www.hnsl.gov.cn/  ">
										����ʡ
									</option>
									<option value="http://www.hubeiwater.gov.cn" />





										����ʡ
									<option value="http://www.hnwr.gov.cn" />





										����ʡ
									<option value="http://www.slt.gd.gov.cn" />





										�㶫ʡ
									<option value="http://202.100.218.58/gov/jshuili/sljzy.htm">
										����ʡ
									</option>
									<option value="http://www.scwater.net/  ">
										�Ĵ�ʡ
									</option>
									<option value="http://www.gzmwr.gov.cn/ ">
										����ʡ
									</option>
									<option value="http://www.wcb.yn.gov.cn/ ">
										����ʡ
									</option>
									<option value="http://www.xzwater.gov.cn/  ">
										����������
									</option>
									<option value="http://210.83.3.18/  ">
										����ʡ
									</option>
									<option value="http://www.gssl.gov.cn/  ">
										����ʡ
									</option>
									<option value="http://www.nxsl.gov.cn/default.asp">
										����
									</option>
									<option value="http://www.qhsl.gov.cn/  ">
										�ຣʡ
									</option>
									<option value="http://www.info.gov.hk/wsd/index.htm  ">
										���
									</option>
								</select>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<select style="WIDTH: 135px;
                              id="
									menu4" 
                              onchange="javascript:window.open(this.options[this.selectedIndex].value)"
									name="select3">
									<option selected="selected">
										�����м�ˮ������
									</option>
									<option value="http://www.shanghaiwater.gov.cn" />
										�Ϻ�
									<option value="http://www.gzwater.gov.cn" />





										����
									<option value="http://www.szwrb.gov.cn" />





										����
									<option value="http://www.swj.dl.gov.cn" />





										����
									<option value="http://www.jnwater.gov.cn" />





										����
									<option value="http://slsd.wztelecom.zj.cn" />





										����
									<option value="http://www.sysl.gov.cn" />





										����
									<option value="http://sanfang.nanhai.gov.cn" />




										�Ϻ�
									<option value="http://www.zhanjiang.gov.cn/zjsl" />





										տ��
									<option value="http://www.huainan.gov.cn/shuili/index.htm">
										����
									</option>
									<option value="http://www.gygov.gov.cn/shuidianjv/shuilijv.htm">
										����
									</option>
									<option value="http://www.jqwater.net" />





										��Ȫ
									<option value="http://202.98.242.42" />





										����
									<option value="http://www.yqs-slj.zj001.net" />





										����
									<option value="http://www.gm.fswater.gov.cn" />





										����
									<option value="http://www.dh.jl.gov.cn/shuiliju/jzzc.htm">
										�ػ�
									</option>
									<option value="http://www.shuili.cangzhou.gov.cn" />





										����
									<option value="http://www.ycsl.gov.cn" />





										�˲�
									<option value="http://www.xfwater.com" />





										�差
									<option value="http://www.qzwater.com" />





										����
									<option value="http://jjsl.nease.net/2001zjh/2001zjh.htm">
										����
									</option>
									<option value="http://szszys.sosoo.net" />





										����
									<option value="http://www.cndx.net/cnslj/index.htm">
										����
									</option>
									<option value="http://www.yzsl.gov.cn" />





										����
									<option value="http://www.jszjsl.gov.cn" />





										��
									<option value="http://www.tzwater.com" />





										̩��
									<option value="http://www.wxwater.gov.cn" />





										����
									<option value="http://xntf.wx-e.com" />




										����
									<option value="http://www.zqwater.gov.cn" />





										����
									<option value="http://hsslj.heshan.net" />





										��ɽ
									<option value="http://www.njslw.com" />





										����
									<option value="http://www.shlj.sjz.net.cn" />





										ʯ��ׯ
									<option value="http://www.hsswj.gov.cn/hsswj/index.jsp">
										��ˮ
									</option>
									<option value="http://bzwater.533.net" />





										����
									<option value="http://www.lzsl.gov.cn" />





										����
									<option value="http://www.cqrcsl.com" />





										�ٲ�
									<option value="http://www.cqlpsl.com" />





										��ƽ
									<option value="http://www.cqtnsl.com" />





										����
									<option value="http://www.cqtlsl.com" />





										ͭ��
									<option value="http://www.cqbssl.com" />





										��ɽ
									<option value="http://www.cqkxsl.com" />





										����
									<option value="http://www.cqddksl.com" />





										��ɿ�
									<option value="http://www.cqwssl.com" />




										��ʢ
									<option value="http://www.cqwzsl.com" />




										����
									<option value="http://www.cqpssl.com" />





										��ˮ
									<option value="http://www.cqxssl.com" />





										��ɽ
									<option value="http://www.yywr.gov.cn" />





										����
									<option value="http://www.hhsl.gov.cn" />




										���
									<option value="http://slj.liuzhou.gov.cn" />





										����
									<option value="http://www.lljj.com" />




										����
									<option value="http://www.fswater.gov.cn" />





										��ɽ
									<option value="http://slj.lyg.gov.cn" />





										���Ƹ�
									<option value="http://www.qzsdj.gov.cn" />





										Ȫ��
								</select>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<select style="WIDTH: 140px; HEIGHT: 20px"
									onchange="javascript:window.open(this.options[this.selectedIndex].value)"
									name="select">
									<option selected="selected">
										ҵ����վ
									</option>
									<option value="http://www.shhes.org.cn" />





										�Ϻ���ˮ��ѧ��
									<option value="http://www.cjw.com.cn" />





										ˮ��������ˮ��ίԱ��
									<option value="http://www.yellowriver.gov.cn" />





										ˮ�����ƺ�ˮ��ίԱ��
									<option value="http://www.hu.mwr.gov.cn/ ">
										ˮ��������ˮ��ίԱ��
									</option>
									<option value="http://www.hwcc.gov.cn" />





										ˮ��������ˮ��ίԱ��
									<option value="http://www.pearlwater.gov.cn/ ">
										ˮ�����齭ˮ��ίԱ��
									</option>
									<option value=" http://www.slwr.gov.cn/">
										ˮ��������ˮ��ίԱ��
									</option>
									<option value=" http://www.tba.gov.cn/  ">
										ˮ����̫����������
									</option>
									<option value="http://rencai.chinawater.net.cn" />





										ˮ�����˲���Դ��������
									<option value=" http://www.waterinfo.com.cn/  ">
										ˮ������չ�о�����
									</option>
									<option value="http://www.ccwm.com.cn" />





										�й�ˮ���г���
									<option value="http://www.water-sh.com" />





										�Ϻ�������ˮ�������޹�˾
									<option value="http://www.shanghaiwater.com" />




										�Ϻ�������ˮ�б����޹�˾
									<option value="http://www.minhangwater.com/index.asp">
										�Ϻ�������ˮ�������޹�˾
									</option>
									<option value=" http://www.pudongwater.com/index.asp">
										�Ϻ��ֶ�����������ˮ���޹�˾
									</option>
									<option value="http://www.swec.net" />





										�Ϻ�ˮ�����������޹�˾
									<option value="http://www.ssrcc.com/" />




										�Ϻ������ݺ��ۺ����ν������޹�˾
									<option value="http://www.swcc.org.cn" />




										ˮ��������̬����������
									<option value="http://www.giwp.org.cn" />





										ˮ��ˮ���滮�����Ժ
									<option value=" http://www.hydroinfo.gov.cn/">
										�й�ˮ����Ϣ��
									</option>
									<option value=" http://www.irrigate.com.cn/    ">
										�й��Ź���Ϣ��
									</option>
									<option value="http://www.chinawater.net.cn" />





										�й�ˮ���Ƽ���Ϣ��
									<option value="http://www.shuiwang.com/   ">
										ˮ��
									</option>
									<option value="http://www.h2o-china.com" />




										�й�ˮ��
									<option value="http://www.e-water.com.cn/  ">
										����ˮ��
									</option>
									<option value="http://www.waterwaswater.com" />





										��ˮ��ˮ
									<option value="http://www.gpszx.com" />





										����ˮ����
									<option value="http://www.chinawater.net/  ">
										�й���ˮ��ˮ
									</option>
									<option value="http://www.h2o-china.com/general/index-g.asp">
										��ˮ���������
									</option>
									<option value="http://www.cnwaternews.com" />




										�й�ˮ����
									<option value="http://www.c-water.com.cn/  ">
										�й�ˮ��ҵ��
									</option>
									<option value="http://www.chinasewage.com" />





										�й���ˮ��
									<option value="http://www.chinawater.com.cn/ ">
										�й�ˮ������
									</option>
									<option value=" http://jhe.ches.org.cn/  ">
										ˮ��ѧ��
									</option>
									<option value="http://www.waterpub.com.cn" />





										�й�ˮ��ˮ�������
									<option value=" http://www.nceib.iwhr.com/">
										���ҽ�ˮ��ȱ������̼����о�����
									</option>
									<option value="http://www.bjwatergroup.com" />





										����������ˮ�����������ι�˾
									<option value="http://www.pdswater.com" />





										ƽ��ɽ������ˮ��˾
									<option value=" http://www.ytkfqwater.com.cn/">
										��̨���ü�������������ˮ��˾
									</option>
									<option value="http://www.zibowater.com" />





										�Ͳ�������ˮ��˾
									<option value="http://www.whwater.com" />





										�人������ˮ��˾
									<option value="http://www.xfgs.com.cn" />





										�差��ˮ�ܹ�˾
									<option value="http://www.tianjinwater.com.cn" />





										�������ˮ�������޹�˾
									<option value="http://www.supplywater.com" />





										��ɳ������ˮ��˾
									<option
										value="http://www.chinacity.net/zgcs/liaoning/shenyang/shen35/shen58.htm">
										����������ˮ�ܹ�˾
									</option>
									<option value="http://www.waterchina.com" />





										������ˮ�񣨼��ţ����޹�˾
									<option value="http://www.ddzwater.com.cn" />





										�������ü�������������ˮ��˾
									<option value="http://www.fswater.com" />




										��ɽˮ˾
									<option value="http://www.qqhrwater.com" />





										�������������ˮ��˾
									<option value="http://www.chwater.com" />





										�κ�������ˮ��˾
									<option value="http://www.ntws.com.cn" />





										��ͨ������ˮ��˾
									<option value="http://www.wuwater.com" />





										����������ˮ��˾
									<option value="http://jingtai.363.net/index.htm">
										����������ˮ��˾
									</option>
									<option value="http://www.tysy.com.cn" />





										��������ˮҵ�����ţ���˾
									<option value="http://www.xiamenwater.com" />





										����������ˮ�������޹�˾
									<option value="http://www.viewchina.org/qzss" />




										Ȫ��������ˮ��˾
									<option value="http://www.jnwater.com.cn" />





										����������ˮ��˾
								</select>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<select style="WIDTH: 105px; HEIGHT: 20px"
									onchange="javascript:window.open(this.options[this.selectedIndex].value)"
									name="select">
									<option selected="selected">
										����ˮ�����
									</option>
									<option value="http://www.wef.org" />




										Water Environment Federation
									<option value="http://www.awt.org" />





										Association of water Technologies
									<option value="http://www.awwa.org" />





										Americian Water Works Association
									<option value="http://www.water4people.org" />





										Water for People
									<option value="http://www.givewater.org" />





										Give Water
									<option value="http://www.worldwater.org" />





										The World`s Water
									<option value="http://www.waterwiser.org" />




										Water Wiser
									<option value="http://www.iwahq.org.uk" />




										International Water Association
									<option value="http://www.cleanwateraction.org" />




										Clean Water Action
									<option value="http://www.water.org.uk" />





										Water UK
									<option value="http://www.w-ww.com" />





										Water-Wastewater Web
									<option
										value=" http://www.wateronline.com/content/homepage/default.asp">
										Water online
									</option>
									<option value="http://water.usgs.gov" />





										Water Resources of the United States
									<option value="http://ga.water.usgs.gov/edu" />





										Water Science for Schools
									<option value="http://www.thames-water.com" />





										Thames Water
									<option value="http://www.uswaternews.com/homepage.htm">
										U.S. Water News
									</option>
									<option value="http://wow.nrri.umn.edu/wow" />





										Water on the Web
									<option value="http://www.thewaterpage.com" />





										The Water Page
									<option
										value="http://www.state.nv.us/cnr/ndwp/dict-1/waterwds.htm">
										Water Words Dictionary
									</option>
									<option value="http://www.nal.usda.gov/wqic">
										Water Quality Information Center
									</option>
									<option value="http://www.bottledwaterweb.com" />




										Bottled Water Web
									<option value="http://www.wcc.nrcs.usda.gov" />





										National Water and Climate Center
									<option value="http://www.water-technology.net" />





										Water Technology
									<option value="http://www.cleanwater.gov" />




										Cleanwater.gov
									<option value="http://www.southernwater.co.uk" />




										Southern Water
									<option value="http://www.fi.edu/city/water">
										Water in The City
									</option>
									<option value="http://www.anglianwater.co.uk" />





										Anglian Water
									<option value="http://www.sydneywater.com.au" />





										Sydney Water
									<option value="http://www.unesco.org/water" />





										United Nations Educational Scientific and Cultural
										Organization Water
									<option value="http://www.wcp.net" />




										Water Conditioning and Pur?9ification Magazine
									<option value="http://www.epa.gov/water">
										U.S. Environmental Protection Agency &gt; water
									</option>
									<option value="http://www.wsscc.org" />




										Water Supply &amp; Sanitation Collaborative Council
								</select>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<select class="tx1" style="WIDTH: 120px"
									onchange="javascript:window.open(this.options[this.selectedIndex].value) "
									name="select">
									<option selected="selected">
										�������š���λ
									</option>
									<option value="http://61.151.248.163">
										�Ϻ��з�Ѵ��Ϣ������
									</option>
									<option value="http://www.shswyouth.com">
										�Ϻ���ˮ��������
									</option>
									<option value="http://www.shsl.org.cn" />




										�Ϻ���ˮ������
									<option value="http://www.wsa.gov.cn" />




										�Ϻ��й�ˮ����





										<!--option 
                                value="http://paishui.shanghaiwater.gov.cn"/>
          
          
      
        
              �Ϻ�����ˮ����-->
									<option value="http://www.hydrology.sh.cn" />




										�Ϻ���ˮ����վ
									<option value="http://www.shanghaiwater.org" />




										�Ϻ��з�Ѵ��Ϣ���ģ��Ϻ���ˮ����Ϣ���ģ�
									<option value="http://www.shwaterplan.com" />




										�Ϻ���ˮ��滮���Ժ
									<option value="http://www.swedri.com" />




										�Ϻ���ˮ�񹤳�����о�Ժ���޹�˾
									<option value="http://www.shhb.com.cn" />



										�Ϻ��겨������ѯ�������޹�˾
									<option value="http://www.sscrpho.org" />



										�Ϻ����ݺӻ����ۺ������쵼С��칫��
								</select>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<select class="tx1" style="WIDTH: 120px"
									onchange="javascript:window.open(this.options[this.selectedIndex].value) "
									name="select">
									<option selected="selected">
										�������أ���Ѵ��
									</option>
									<option value="http://211.144.95.130:9080/website/index.jsp">
										�ֶ�������Ѵ��
									</option>
									<option value="http://31.16.1.9/shfx/jiuzai/xuhui.htm" />
										�������Ѵ��
									</option>
									<option value="http://31.16.1.9/shfx/jiuzai/changnin.htm" />
										��������Ѵ��
									</option>
									<option value="http://172.1.5.1/" />
										��������Ѵ��
									</option>
									<option value="http://172.12.1.100/" />
										բ������Ѵ��
									</option>
									<option value="http://31.16.1.9/shfx/jiuzai/hongke.htm" />
										�������Ѵ��
									</option>
									<option value="http://192.168.2.98/ypfx" />
										��������Ѵ��
									</option>
									<option value="http://31.16.1.9/shfx/jiuzai/huangpu.htm" />
										��������Ѵ��
									</option>
									<option value="http://31.16.1.9/shfx/jiuzai/luwan.htm" />
										¬������Ѵ��
									</option>
									<option value="http://172.9.1.100/" />
										��������Ѵ��
									</option>
									<option value="http://172.13.1.1/" />
										��ɽ����Ѵ��
									</option>
									<option value="http://172.7.1.100/" />
										��������Ѵ��
									</option>
									<option value="http://www.jdwater.gov.cn/">
										�ζ�����Ѵ��
									</option>
									<option value="http://172.8.1.1/" />
										�ɽ�����Ѵ��
									</option>
									<option value="http://192.69.1.1/" />
										��ɽ����Ѵ��
									</option>
									<option value="http://www.nanhui.gov.cn/nhsw/default.jsp">
										�ϻ�����Ѵ��
									</option>
									<option value="http://222.72.135.140/fxsw_new/index.asp">
										��������Ѵ��
									</option>
									<option value="http://192.1.8.100/" />
										��������Ѵ��
									</option>
									<option value="http://www.cmwater.gov.cn">
										�����ط�Ѵ��
									</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="15" bgcolor="#E1EAF1">
				</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#E1EAF1" class="zw">
					2007-2010&nbsp;&nbsp;�Ϻ���ˮ��� &nbsp;&nbsp;��Ȩ����
				</td>
			</tr>
		</table>
		</td>
		</tr>
		</table>
	</body>
	<script type="text/javascript">
//�ر�С����
function closePortlet(portlet_id,side)
{
   var url="layout.do?action=close&id="+portlet_id+"&side="+side;
   //alert(url);
   var myAjax = new Ajax.Request(
				url,
				{
					//����ʽ��POST
					method:'post',
					//ָ���ص�����
					onComplete: closePortCalback(portlet_id,side),
					//�Ƿ��첽��������
					asynchronous:true
				});
}
function closePortCalback(portlet_id,side)
{
   var elem = document.getElementById("portlet_all_"+portlet_id+"_"+side);
   if (elem!=null)
     elem.parentNode.removeChild(elem);
}

//�ı䴰��λ��
function change(){
	//ȡ�ø���С����ID
	var p_left = getPortlets(left);
	var p_right = getPortlets(right);
	var p_wide = getPortlets(wide);		
	//ʹ��Ajax��̬�ύ�����ݿ�
	var url = "layout.do?action=change&left="+p_left+"&right="+p_right+"&wide="+p_wide;
	var myAjax = new Ajax.Request(
		url,
		{
			method:'post',
			asynchronous:true
		});
}

//�����С��С����
function Toggle(item) {
   var max=item+"_max";
   var min=item+"_min";
   objMax=document.getElementById(max);
   objMin=document.getElementById(min);
   obj=document.getElementById(item);

   visible=(obj.style.display!="none")  
   if (visible) {
     obj.style.display="none";
     if ( objMax != null ) objMax.style.display="block";
     if ( objMin != null ) objMin.style.display="none";
   } else {
     obj.style.display="block";
     if ( objMax != null ) objMax.style.display="none";
     if ( objMin != null ) objMin.style.display="block";
   }
}
//��ȡָ�����ڵ�С����ID
function getPortlets(item){
	var rs = "";
	var arr = new Array();
	var tabs = item.getElementsByTagName("table");
	for(var i=0; i<tabs.length; i++){
		var t = tabs[i].id.match(/\d\d/g);
		if(t==null){
			t = tabs[i].id.match(/\d/g);
		}
		arr[i] = t;
	}
	rs = arr.toString();
	return rs;
}

//���С����ҳ��
function openpan(){
	var params = getPortlets(left);
	if(params!=""){
		params +=",";
	}	
	params += getPortlets(right);
	if(params!=""){
		params +=",";
	}
	var p_wide = getPortlets(wide);	
	params += p_wide;
	var url="pan.jsp?params="+params.toString();
    var win=showModalDialog(url,window,"dialogWidth:500px;dialogHeight:300px;center:yes;help:No;status:no;resizable:No;edge:no");
	if (win=='success'){
		alert("�����ɹ�!");
		window.location.reload();
	}    
}
function loginCheck()
{
	//����ĵ�ַ

	//����Ajax.Request���󣬶�Ӧ�ڷ�������
	var myAjax = new Ajax.Request(
	url,
	{
		//����ʽ��POST
		method:'post',
		//�������
		//parameters:params,
		//�Ƿ��첽��������
		asynchronous:true
	});
}
function pagego1(go)
{
   var link= document.getElementById("syhref1");
   if(go==1)
   {
     link.src="zwzl/wsbs.htm"; 
	 document.getElementById("deimage").background="imagine/l-4-2.gif";  
	}

	if(go==2)
   {
     link.src="zwzl/wsbs1.htm"; 
	 document.getElementById("deimage").background="imagine/2l-1.gif";  
	}
}	
function pagego2(go)
{
   var link= document.getElementById("syhref2");
   if(go==1)
   {
     link.src="zwzl/zfxxgk.htm"; 
     document.getElementById("deimage1").background="imagine/l-6-2.gif";
	}

	if(go==2)
   {
     link.src="zwzl/zfxxgk.htm"; 
     document.getElementById("deimage1").background="imagine/2l-2.gif";
	}
 
}		
</script>
	<script src="Scripts/scripts.js" language="javascript"></script>
	<script defer src="Scripts/init.js" language="javascript"></script>
	<!--�Զ�����init()����-->
</html>
