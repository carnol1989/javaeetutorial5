var OUTLOOKBAR_DEFINITION = {
	format:{
		target:'rightFrame',
		blankImage:'images1/b.gif',
		rollback:true,
		animationSteps:3,
		animationDelay:20,
		templates:{
			panel:{
				common:'<table width="100%" height="37" border="0" cellspacing="0" cellpadding="0" background="images1/panel_middle_{state}.gif"><tr><td><img src="images1/panel_left_{state}.gif" width="10" height="37" /></td><td align="center"><div style="font: bold 11pt trebuchet ms, arial;">{text}</div></td><td align="right"><img src="images1/panel_right_{state}.gif" width="10" height="37" /></td></tr></table>',
				normal:{state:'n'}
			},
			item:{
				common:'<table border="0" width="100%"><tr><td><table width="100%" bgcolor="{borderColor}" border="0" cellspacing="1" cellpadding="0"><tr><td><table width="100%" border="0" bgcolor="{backgroundColor}" cellspacing="0" cellpadding="5"><tr align="center"><td><img src="images1/icon_{icon}_{state}.gif" width="48" height="48" /></td></tr><tr align="center"><td><span style="font: 9pt verdana;">{text}</span></td></tr></table></td></tr></table></td></tr></table>',
				normal:{borderColor:'#D0D0D0', backgroundColor:'#D0D0D0', state:'n'}
			},
			upArrow:{
				common:'<img src="images1/btn_up_{state}.gif" width="24" height="24" />',
				normal:{state:'n'}
			},
			downArrow:{
				common:'<img src="images1/btn_down_{state}.gif" width="24" height="24" />',
				normal:{state:'n'}
			}
		}
	},
	panels:[
		{text:"��������", url:'',
			items:[
				{text:"һ�ܰ���", icon:'01', url:'weekplannew.htm'},
				{text:"�������", icon:'02', url:''},
				{text:"��������", icon:'03', url:''},
				{text:"�ڼ��չ���", icon:'04', url:'oaholidayaction.do?method=list'},
				{text:"�ճ̹���", icon:'05', url:'tbZwWeekSecheduleAction.do?method=list&action=alllist'},
				{text:"ǩ����ѯ", icon:'06', url:''}
			]
		},	
		{text:"��ѴӦ��", url:'',
			items:[
				{text:"��Ѵֵ��", icon:'01', url:''},
				{text:"ˮ�鱨Ѷ", icon:'02', url:''},
				{text:"WebGISӦ��ϵͳ", icon:'03', url:''},
				{text:"�ֶ�Ԥ������", icon:'04', url:''},
				{text:"����ƽ̨", icon:'05', url:''},
				{text:"����ƽ̨", icon:'06', url:''}
			]
		},
		{text:"ϵͳ����", url:'',
			items:[
				{text:"ְ��ȼ�����", icon:'01', url:'pstlvlaction.do?method=list'},
				{text:"Ȩ�����͹���", icon:'02', url:'righttypeaction.do?method=list'},
				{text:"�û��������", icon:'02', url:'userlvlaction.do?method=list'},
				{text:"Ȩ�޼������", icon:'02', url:'authlvlaction.do?method=list'},
				{text:"���ż������", icon:'02', url:'deptlvlaction.do?method=list'},
				{text:"Ӧ��ϵͳ����", icon:'02', url:'allappSys.do?method=list'},
				{text:"������Դ����", icon:'02', url:'base/function/navigation.do'},
				{text:"��ɫ����", icon:'02', url:'roleaction.do?method=list'},
				{text:"��֯��������", icon:'02', url:'orgmainaction.do'},
				{text:"��ɫȨ�޹���", icon:'02', url:'base/roleAuth/navigation.do'},
				{text:"��ɫ�û�����", icon:'02', url:'roleusermainaction.do'},
				{text:"�û�������ɫ", icon:'02', url:'roletreeaction.do?method=roleOfUserList'}
			]
		},
		{text:"���Ի�", url:'',
			items:[
				{text:"��Ϣ��������", icon:'01', url:'infopubclaaction.do?method=maininfo'},
				{text:"���Ի�����", icon:'01', url:'base/function/forwardFunction.do?method=resListByUser'},
				{text:"�ڼ��չ���", icon:'02', url:'oaholidayaction.do?method=list'},
				{text:"�ճ̹���", icon:'02', url:'tbZwWeekSecheduleAction.do?method=list&action=alllist'},
				{text:"�������", icon:'02', url:'meetingaction.do?method=list&action=thismonth'},
				{text:"�����ҹ���", icon:'02', url:'meetingroomaction.do?method=list'},
				{text:"����ͨѶ�����", icon:'02', url:'individualcommaction.do?method=list&groupname='},
				{text:"����ͨѶ����", icon:'02', url:'individualaction.do?method=list&pername=&perphone='},
				{text:"����ͨѶ¼", icon:'02', url:'commonalityaction.do?method=list&action=all'},
				{text:"����ͨѶ��", icon:'02', url:'commonalityCommAction.do?method=list'}
			]
		}								
		
	]
};
