///////////////////////////////////////////////////////////////// INIT ////////////////////////////////////////////////////////////

//  Init!

var OutlookBar={
"format":
   {"heightpanel":25, "imageheight":32, "arrowheight":17,"heightcell":76,"coloroutlook":"#FFFFFF","arrange_text":"bottom", "rollback":false, "img_arrows_up":"img/arup.gif","img_arrows_dn":"img/ardn.gif"},
"panels":
[
   {"text":"��������", "panelCSS":"panel" ,"textCSS":"textpanel",
       "items":
       [
          {"text":"һ�ܰ���","textCSS":"a1", "image":'imagine/dl-a1.gif',    "url":'weekplannew.htm', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�������","textCSS":"a2", "image":'imagine/dl-a2.gif',  "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��������","textCSS":"a3","image":'imagine/dl-a5.gif',  "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�ڼ��չ���","textCSS":"a4","image":'imagine/dl-a7.gif', "url":'oaholidayaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�ճ̹���","textCSS":"a4","image":'imagine/dl-a7.gif', "url":'tbZwWeekSecheduleAction?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"ǩ����ѯ","textCSS":"a5","image":'imagine/dl-a6a.gif',    "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"}
      ]
   },
   {"text":"��ѴӦ��", "panelCSS":"panel" ,"textCSS":"textpanel",
       "items":
       [
          {"text":"��Ѵֵ��","textCSS":"a1", "image":'imagine/dl-a8.gif',    "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"ˮ�鱨Ѷ","textCSS":"a2", "image":'imagine/dl-a9.gif',  "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"WebGISӦ��ϵͳ","textCSS":"a3", "image":'imagine/dl-a10.gif',  "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�ֶ�Ԥ������","textCSS":"a1", "image":'imagine/dl-a11.gif', "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"����ƽ̨","textCSS":"a2", "image":'imagine/dl-a13.gif',    "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"����ƽ̨","textCSS":"a3", "image":'imagine/dl-a12.gif',    "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"}
          
      ]
   },
   {"text":"���ĵ���", "panelCSS":"panel" , "textCSS":"textpanel",
       "items":
       [
          {"text":"���¼�","textCSS":"a1", "image":'imagine/dl-a14.gif',    "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��������","textCSS":"a2", "image":'imagine/dl-a15.gif',  "url":'#', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"}
          
      ]
   },
  {"text":"ϵͳ����", "panelCSS":"panel" ,"textCSS":"textpanel",
       "items":
       [
          {"text":"ְ��ȼ�����","textCSS":"a1", "image":'imagine/dl-a1.gif',    "url":'pstlvlaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"Ȩ�����͹���","textCSS":"a2", "image":'imagine/dl-a2.gif',  "url":'righttypeaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�û��������","textCSS":"a3","image":'imagine/dl-a5.gif',  "url":'userlvlaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"Ȩ�޼������","textCSS":"a4","image":'imagine/dl-a7.gif', "url":'authlvlaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"���ż������","textCSS":"a5","image":'imagine/dl-a6.gif',    "url":'deptlvlaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"Ӧ��ϵͳ����","textCSS":"a1","image":'imagine/dl-a6.gif',    "url":'allappSys.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"������Դ����","textCSS":"a2","image":'imagine/dl-a6.gif',    "url":'base/function/navigation.do', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��ɫ����","textCSS":"a3","image":'imagine/dl-a6.gif',    "url":'roleaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��֯��������","textCSS":"a4","image":'imagine/dl-a6.gif',    "url":'orgmainaction.do', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��ɫȨ�޹���","textCSS":"a5","image":'imagine/dl-a6.gif',    "url":'base/roleAuth/navigation.do', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��ɫ�û�����","textCSS":"a1","image":'imagine/dl-a6.gif',    "url":'roleusermainaction.do', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�û�������ɫ","textCSS":"a1","image":'imagine/dl-a6.gif',    "url":'roletreeaction.do?method=roleOfUserList', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"}
      ]
   }, 
   {"text":"���Ի�", "panelCSS":"panel" ,"textCSS":"textpanel",
       "items":
       [
          {"text":"���Ի�����","textCSS":"a1", "image":'imagine/dl-a1.gif',    "url":'base/function/forwardFunction.do?method=resListByUser', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},       
          {"text":"�ڼ��չ���","textCSS":"a4","image":'imagine/dl-a7.gif', "url":'oaholidayaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"�ճ̹���","textCSS":"a4","image":'imagine/dl-a7.gif', "url":'tbZwWeekSecheduleAction.do?method=list&action=alllist', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
           {"text":"�������","textCSS":"a5", "image":'imagine/dl-a2.gif',  "url":'meetingaction.do?method=list&action=thismonth', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},


          {"text":"�����ҹ���","textCSS":"a5", "image":'imagine/dl-a2.gif',  "url":'meetingroomaction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          
          {"text":"����ͨѶ�����","textCSS":"a5", "image":'imagine/dl-a2.gif',  "url":'individualcommaction.do?method=list&groupname=', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"����ͨѶ����","textCSS":"a5", "image":'imagine/dl-a2.gif',  "url":'individualaction.do?method=list&pername=&perphone=', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          
          {"text":"����ͨѶ¼","textCSS":"a4", "image":'imagine/dl-a2.gif',  "url":'commonalityaction.do?method=list&action=all', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"����ͨѶ��","textCSS":"a4", "image":'imagine/dl-a2.gif',  "url":'commonalityCommAction.do?method=list', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          {"text":"��Ϣ��������","textCSS":"a4", "image":'imagine/dl-a2.gif',  "url":'infopubclaaction.do?method=maininfo', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"},
          
          {"text":"wenbenbianji","textCSS":"a4", "image":'imagine/dl-a2.gif',  "url":'infopubContentaction.do?method=test', "classCSS":"imgstyle", "overclassCSS":"imgstyle_over","target":"rightFrame"}
          
       ]
   }       
]
}
