<%@ page language="java"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<script type="text/javascript">
<!--
var swqk = new Array("����","���","�༭","��ǩ","�༭����","��������","����","","");
var zywg = new Array("��Դ","����","�����¼�","�ر��Ƽ�","����","","","","");
var fg = new Array("��������","ʵ��ʱ��","����","����","���","����","����","��׼��","");
var zhb = new Array("�б굥λ","����λ","�ؼ���","����","����","��Ч����","New��־","","");
var zhp = new Array("�����¼�","ͼ��ߴ�","����ص�","�ļ���С","��������","�ļ�����","����","","");
var yx = new Array("��Ӱ����","�����¼�","��������","����ص�","�ļ�����","�ļ���С","ͼ��ߴ�","����","����ʱ��");
var shy = new Array("��������","�����¼�","¼������","�ļ�����","�ļ���С","¼�Ƶص�","����","����ʱ��","");
var hdp = new Array("�õ�Ƭ����","�����¼�","�����ص�","����","����","","","","");
var swqkSel = new Array(["23","ר������Ҫ"],["20","ˮ����־"],["14","ˮ�����"],["18","ˮ������"],["21","ˮ�����"],
["17","ˮ�񹤻�"],["15","ˮ��̬"],["19","ˮ��"],["22","�ֳ��칫�����Ҫ"],["24","������ϯ�����Ҫ"],["16","�����Ѷ"]);
var zywgSel =new Array(["28","��ժ"],["25","����"],["27","�㱨"],["26","��������"]);
var fgSel = new Array(["29","����"],["30","��׼"]);
var zhbSel = new Array(["31","�б�"],["32","����"]);
var zhpSel = new Array(["34","��Ƭ"],["33","ͼƬ"]);
var yxSel = new Array(["35","Ӱ��"]);
var shySel = new Array(["36","����"]);
var hdpSel = new Array(["37","�õ�Ƭ"]);
var selectOps;
var showText ;//Ҫ��ʾ����Ϣ�ı�
function init(addType){//showText.length
	if ("xw"==addType) {
		document.getElementById("xw").style.display="block";
	}
	else {
	showTextSet(addType);
	 for (var i=0;i<9;i++) {
	 	if (showText[i]!="")
			document.getElementById("col"+i).innerHTML=showText[i];
		else {
			document.getElementById("col"+i).style.display="none";
			document.getElementById("col"+i+'1').style.display="none";
		}
		document.getElementById("addType").style.display="block";
	}
	initOptions(selectOps);
	}
}
function showTextSet(addType) {
	if ("swqk"==addType) {
		showText=swqk;
		selectOps=swqkSel;
	}
	else if ("zywg"==addType) {
		showText=zywg;
		selectOps=zywgSel;
	}
	else if ("fg"==addType) {
		showText=fg;
		selectOps=fgSel;
	}
	else if ("zhb"==addType) {
		showText=zhb;
		selectOps=zhbSel;
	}
	else if ("zhp"==addType) {
		showText=zhp;
		selectOps=zhpSel;
	}
	else if ("yx"==addType) {
		showText=yx;
		selectOps=yxSel;
	}
	else if ("shy"==addType) {
		showText=shy;
		selectOps=shySel;
	}
	else if ("hdp"==addType) {
		showText=hdp;
		selectOps=hdpSel;
	}
	
}
function initOptions(xmlDoc) {
				var initS1 = document.getElementById("infoType");
				for (var j = initS1.options.length; j > 0; j--) {
					initS1.removeChild(initS1.options[j - 1]);
				}
				var currentElement = null;
				for (var i = 0; i < xmlDoc.length; i++) {
					currentElement = document.createElement("option");
					var value = xmlDoc[i][0];
					var text = xmlDoc[i][1];;
					currentElement.setAttribute("value", value);
					var txtInfo = document.createTextNode(text);
					currentElement.appendChild(txtInfo);
					initS1.appendChild(currentElement);
				}
			}
			//-->
</script>
	</head>

	<body>
	</body>
</html>

