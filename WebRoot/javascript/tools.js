//�����ύ����ҳ��ʹ��
function tSubmint() {
	var objects = opener.document.body.getElementsByTagName("object");
	var i;
	for(i = 0; i < objects.length; i++) {
		var classid = objects[i].getAttribute("classid");
		if(classid == "clsid:49C1B3F0-4F6D-4907-9CE8-CD34C04343C8") { 
			var hiddenName = objects[i].getAttribute("field");
		
			var hidden = opener.document.getElementById(hiddenName);	
			hidden.value = objects[i].GetStoreData();
		}
	}
	 opener.document.forms[0].submit();
	
}

function setSelectResult(elemName,data)
{
	var e = opener.document.getElementsByName(elemName)[0];
	if(e.value == "" || e.value == null)
	{
	   e.value = data;	
	}
	else
	{
	   e.value += "," + data;
	}
}

/**
*	ί�д�������
	TODO
*/
function processwtbutton(select,isaccepthidden)
{
	var val = select.selectedIndex;
	var value = select.options[val].text;
	//alert(value);
	var onclick = (document.getElementsByName("wtbutton")[0].onclick);
	isaccepthidden.value = value;
	//alert(onclick.toString());
	var str = onclick.replace("isaccept=", "haha");
//	.replace("isaccept=", "isaccept=" + value);
	//alert(str);
}

//�����Ϊ��
function checkselectid()
{
  var a =document.forms[0].selectedid.value;
      if(a==null || a == "")
      {
		    alert('��ѡ�����в���')
         return false;
	  }
	  return true;
    
}

// �ж�����Ľ��
function isMoney(obj)
{
   var str=obj.value;
   if(str=="") return false;
   if(!isNum(str))
   {
     alert("ֻ���������֣�");
     obj.value = "";
     obj.focus();
     return;
   }
}

//�������Ƿ���ڿ�ʼ
function checkArea() {
    var se = getInput('start');
    var ee = getInput('end');
    if (se === null || ee === null) {
        return true;
    }
    if (se.value > ee.value) {
        window.alert("\u7ed3\u675f\u65f6\u95f4\u4e0d\u80fd\u5927\u4e8e\u5f00\u59cb\u65f6\u95f4");
        se.focus();
        return false;
    }
    return true;
}

//�õ���ĳ���ǵ�Ԫ��
function getInput(attrName) {
    var ele = document.forms[0].elements;
    for (var i = 0; i < ele.length; i += 1) {
        var e = ele[i];
        var attr = e.getAttribute(attrName);
        if (attr !== null && attr !== "") {
            return e;
        }
    }
    return null;
}
//ѡ������
function setMutiwindowreturns()
{
  window.returnValue=document.forms[0].result.value;
  window.close();
}

//�����ύ���ӱ�ҳ��ʹ��
function ttSubmint() {
	var objects = document.body.getElementsByTagName("object");
	var i;
	for(i = 0; i < objects.length; i++) {
		var classid = objects[i].getAttribute("classid");
		if(classid == "clsid:49C1B3F0-4F6D-4907-9CE8-CD34C04343C8") { 
			var h = objects[i].field;
			var hiddenName = objects[i].getAttribute("field");
			//alert(objects[i].id);
			//alert(hiddenName);
			var hidden = document.getElementById(hiddenName);		
		    //alert( objects[i].GetStoreData().substring(0, 30));
			hidden.value = objects[i].GetStoreData();           
	
			}
	}
	
document.forms[0].submit();
}


function deletehandwrite(f)
{
  var hiddenname =  f.getAttribute("field");
  document.forms[0].deletehw.value=hiddenname;
  ttSubmint();
}

//��ۿռ�ʹ��
function setSessionAndAddress(session,address)
{
    var objects = document.body.getElementsByTagName("object");
	var i;
	for(i = 0; i < objects.length; i++) {
		var classid = objects[i].getAttribute("classid");
		if(classid == "clsid:49C1B3F0-4F6D-4907-9CE8-CD34C04343C8") { 
			objects[i].SetSessionID(session);
			objects[i].SetHttpAddr(address);
		}
	}
}
//��дǩ��
 function  handwrite(ctrlname,layerName)
 {

   ctrlname.SetDivName(layerName);
   ctrlname.SetSignData(joinInputValue());

    ctrlname.HandWriteEx(2,0x0000FF,400,300);
  var layerObj = document.getElementById(layerName);
   if(ctrlname.GetPosW() > 0) {
		layerObj.style.width = ctrlname.GetPosW() + "px";
	}
   if(ctrlname.GetPosH() > 0) {
		layerObj.style.height = ctrlname.GetPosH() + "px";
	}
   ttSubmint();
 }
 
 
 //�Ӹ�ӡ��,���� ӡ�¿ؼ���ǩ��������
function addmanyseal(ctrlname,layerName)
{
 ctrlname.SetDivName(layerName);
   ctrlname.SetSignData(joinInputValue());
//����
ctrlname.AddSealCtrl();
var layerObj = document.getElementById(layerName);
   if(ctrlname.GetPosW() > 0) {
		layerObj.style.width = ctrlname.GetPosW() + "px";
	}
   if(ctrlname.GetPosH() > 0) {
		layerObj.style.height = ctrlname.GetPosH() + "px";
	}
   ttSubmint();
}
 
 
 
 //��ʾӡ�£�ǩ������
function showdata() {
 
    var objects = document.body.getElementsByTagName("object");
	var i;
	for(i = 0; i < objects.length; i++) {
	    var obj = objects[i];
		var classid = obj.classid;
		if(classid == "clsid:49C1B3F0-4F6D-4907-9CE8-CD34C04343C8") { 
			var hiddenName = obj.field;
			var layerName = obj.layer;
			var layer = document.getElementById(layerName);
			var hidden = document.getElementById(hiddenName);	
			//alert(obj.id);
                  //   alert(hiddenName );
                  //   alert(layerName );
                  //   alert(hidden.value);
			
                       obj.SetDivName(layerName);
			obj.SetStoreData(hidden.value);
	     if(obj.GetPosW() > 0) {
		   layer.style.width = obj.GetPosW() + "px";
	       } 
         if(obj.GetPosH() > 0) {
		   layer.style.height = obj.GetPosH() + "px";
	      }
		   
	  }
	}
 }

//ˢ��ǰһ��ҳ�棬�رձ�ҳ��
function refurbishAndClose()
{
   opener.location.reload();
   window.close();
}
//���ù���˽�£���ۿؼ�ʹ��
function setgongsizhang(f)
{
  if(f.id =="����" )
  {
  document.forms[0].gongsizhang.value = "1";
  } 
  else if(f.id == "˽��")
 {
 document.forms[0].gongsizhang.value = "2";
 }
}


function uploadSealFile(fileName)
{
   try
   {
    
   }
   catch(e)
   {
    alert("�ļ������ڻ���Ȩ�����ļ���");
    return;
   }
  
document.forms[0].zhuan.style.display="block";
document.forms[0].action.value="tijiao";
document.forms[0].submit();

}




//��ǩ��������֤
function verifySign(ctrlname,sign)
{
  alert();
  if(sign.length>0)
  {
  
  ctrlname.SetSignData(joinInputValue());
  ctrlname.SetStoreData(sign); 
  ctrlname.VerifyDoc();//  ����ֵ��:-1.δ�������ݣ�����δͨ��������ͨ����
  }
  else
  {
   alert("û��ǩ������");
  }
}

// �ѽ�input �е����ݴ������������б�ǩ��sign="sign"
function joinInputValue()
{
  var result = "";
  for(var i = 0; i < document.forms[0].elements.length; i++)
  {
    var element = document.forms[0].elements[i];  
    if(((element.type == "text")||(element.type == "textarea"))
     &&(element.sign=="sign"))
    {
      result = result + element.value;
    }
  }
  return result;
}




//�Ӹ�ӡ��,���� ӡ�¿ؼ���ǩ��������
function addseal(ctrlname,hiddenField)
{

ctrlname.SetDivName("layer1");
//����ǩ������

ctrlname.SetSignData(joinInputValue());
//����

ctrlname.AddSealCtrl();
if(document.all.DHtmlSeal1.GetPosW() > 0) {
		document.all.layer1.style.width = document.all.DHtmlSeal1.GetPosW() + "px";
	}
if(document.all.DHtmlSeal1.GetPosH() > 0) {
		document.all.layer1.style.height = document.all.DHtmlSeal1.GetPosH() + "px";
	}

//�����������ǩ��
var ret = ctrlname.GetStoreData();

 if(ret != null && ret != "#signdata#" && ret != "")
 {
  hiddenField.value += ret;

  document.forms[0].event.value="saveseal";

document.forms[0].submit();
  } 
}


function showseal(f)
{
document.forms[0].DHtmlSeal1.SetDivName("Layer1");
document.forms[0].DHtmlSeal1.SetStoreData(document.forms[0].sign.value);
if(document.all.DHtmlSeal1.GetPosW() > 0) {
		document.all.Layer1.style.width = document.all.DHtmlSeal1.GetPosW() + "px";
	}
if(document.all.DHtmlSeal1.GetPosH() > 0) {
		document.all.Layer1.style.height = document.all.DHtmlSeal1.GetPosH() + "px";
	}
}





function deleteseal()
{
  document.forms[0].event.value="deleteseal";
ttSubmint();
}

//ɾ���ϴ��ĸ���ӡ�� 
function deleteSeal(f)
{
	if(window.confirm("�����Ҫɾ��ӡ����")){
		document.forms[0].deleteid.value=f;
		document.forms[0].submit();
	  }
	 else
	 {
	    return;
	 }
}



function uploadFile(fileName,maxSize)
{
//   try
//   {
//   var fso, f, s;
//   fso = new ActiveXObject("Scripting.FileSystemObject");
//   f = fso.GetFile(fileName);
//   if(f.size-maxSize*1048576>0)
//   {
//    alert("�ϴ����ļ�̫��");
//    return;
//   }
//   }
//   catch(e)
//   {
//    alert("�ļ������ڻ���Ȩ�����ļ���");
//    return;
//   }
document.forms[0].zhuan.style.display="block";
document.forms[0].action.value="confirm";
document.forms[0].submit()
}

function uploadImageFile(fileName,maxSize)
{
   try
   {
 
   }
   catch(e)
   {
    alert("�ļ������ڻ���Ȩ�����ļ���");
    return;
   }
document.forms[0].zhuan.style.display="block";
document.forms[0].action.value="confirm";
document.forms[0].submit()
}


//�ϴ��ļ����޴�С����
function uploadunlimitfile(f,uploadfilename)
{
	  
    if( uploadfilename == null || uploadfilename == "")
    {
    	alert("��ѡ���ļ�!");
    	return;
    }
    var ele =f.elements;
    var tip = "";
    for(var i = 0; i < ele.length; i++)
    {
       if(ele[i].notnull == "notnull")
       {
          if(ele[i].value == "")
          {
            tip += ele[i].cname+",";
          }
       }
    }
    if(tip!="")
    {
       tip = tip.substring(0, tip.length - 1);
       alert(tip + "����Ϊ�ա�");
    }
    else
    {
       f.zhuan.style.display="block";
       f.action.value="confirm";
       f.submit();
    }
}



/**
* �����ļ����ļ��ϴ��ĸ����ж�
* @param file �ļ��ϴ���Ԫ��
* @param maxSize �ϴ��ļ����ܳ����Ĵ�С
* @return void
*/
function doFileUpload(file,maxSize)
{
   //���û��ѡ���ļ�
   if(file.value == null || file.value == "")
   {
      //������ʾ��Ϣ������
      alert("��ѡ��Ҫ�ϴ����ļ�");
      return;
   }
   //У���ϴ��ļ��Ƿ񳬹��˹涨��С
   try
   {
   var fso, f, s;
   //fso = new ActiveXObject("Scripting.FileSystemObject");
   //f = fso.GetFile(file.value);
   //if(f.size-maxSize>0)
   //{
    //alert("�ϴ����ļ�̫��");
    //return;
   //}
   }
   catch(e)
   {alert("test");
    alert("��Ȩ�����ļ�!\r\n��������������ActiveX�ؼ�����ȫ���ù���");
    return;
   }
   document.forms[0].action.value="addfile";
   document.forms[0].submit();
   document.getElementById("zhuan").style.display="block";
}
// ��textareaÿ��ǰ��Ŀո�ȥ��
function procTextArea()
{
  for(var i = 0; i < document.forms[0].elements.length; i++)
  {
    var element = document.forms[0].elements[i];
    if(element.type == "textarea")
    {
      var result = "";
      var source = element.value;
      for(var j = 0; j < source.length; j++)
      {
        if(source.charAt(j)  != ' ' && source.charAt(j)  != '\t')
        {
          result += source.charAt(j);
        }
      }
      element.value = result;
    }
  }
}

// ѯ���û��Ƿ�ȷ��ɾ��
function confirmDelete(url)
{
  if(window.confirm("�����Ҫɾ����һ����"))
  {
    window.open(url);
  }
}

// ѯ���û��Ƿ�ȷ���޸�
function confirmModify(url)
{
  if(window.confirm("ȷʵҪ�޸Ĵ��"))
  {
    window.open(url);
  }
}

// ѯ���û��Ƿ�ȷ�ϸò���
function confirmOperater(url)
{
if(window.confirm("ȷ��Ҫ���иò�����"))
  {
    window.open(url);
  }
}

// ����󻯷�ʽ�򿪴���
function openMaxWindow(url)
{
  //var height=740;
  //var width=1024;
  var top=0;
  var left=0;
  //if(screen.availWidth>1024){
	//left=(screen.availWidth-1024)/2-2
  //}

 // if(screen.availHeight>800){
	//top=(screen.height-800)/2-2
  //}
//2007��3��2�գ�ע�͵����漸�У���ҳ���޸�Ϊ�ʺ���Ļ��С
  var win = window.open(url, "_blank", "toolbar=no, menubar=no, scrollbars=auto, resizable=no,location=no, status=no, resizable=yes");
  win.moveTo(left,top);
  win.resizeTo(screen.availWidth, screen.availHeight);
  win.focus();
}

// ���ı�����׷������
function append(area, hidden)
{
var s = window.showModalDialog("appendWithUserAndDate.jsp");
area.value=hidden.value + s;
}

// �ж�һ���ִ��Ƿ�ȫ����
function isNumber(str)
{
  if (str == "") return false;
  for(var i = 0; i < str.length; i++)
  {
    if(str.charAt(i) < '0' || str.charAt(i) > '9' )
    {
      return false;
    }
  }
  return true;
}

// �ж�һ���ִ��Ƿ���������"."
function isNum(str)
{
  if (str == "") return false;
  for(var i = 0; i < str.length; i++)
  {
    if(str.charAt(i) < '0' || str.charAt(i) > '9' )
    {

      if(str.charAt(i) !='.')
      {
        return false;
      }
    }
  }
  return true;
}

// �ж�һ���ִ��Ƿ���������","
function isNumber1(str)
{
  if (str == "") return false;
  for(var i = 0; i < str.length; i++)
  {
    if(str.charAt(i) < '0' || str.charAt(i) > '9' )
    {
      if(str.charAt(i) !=',')
      {
        return false;
      }
    }
  }
  return true;
}

// �ж�һ���ִ��Ƿ���������":"
function isNumber2(str)
{
  if (str == "") return false;
  for(var i = 0; i < str.length; i++)
  {
    if(str.charAt(i) < '0' || str.charAt(i) > '9' )
    {
      if(str.charAt(i) !=':')
      {
        return false;
      }
    }
  }
  return true;
}

// �ж����������
function checkNumber(obj)
{
   var str=obj.value;
   if(str=="") return false;
   if(!isNumber2(str))
   {
     alert("��������ֲ��Ϸ���");
     obj.value = "";
     obj.focus();
     return;
   }
}
// �ж����������
function checkNumber2(obj)
{
   var str=obj.value;
   alert(str);
   if(str=="") return false;
   if(!isNumber2(str))
   {
     alert("��������ֲ��Ϸ���");
     obj.value = "";
     obj.focus();
     return;
   }
}

// ���ڵ���
function checkNum(obj)
{
  var str=obj.value;
  if(str=="")
  {
    obj.value = "";
    obj.focus();
    return;
  }
  if(!isNumber(str))
  {
    alert("��������ֲ��Ϸ�,���������֣�");
    obj.value = "";
    obj.focus();
    return;
  }
  else
  {
    if(str.length < 8 )
    {
      alert("��������ֳ���С��8��");
      obj.value = "";
      obj.focus();
      return;
    }
  }
}

// ������������,����
function checkNumren(obj)
{
   var str=obj.value;
   if(str=="")
   {
    obj.value = "";
    obj.focus();
    return;
   }
   if(!isNumber(str))
   {
    alert("��������ֲ��Ϸ�,����������  ��");
    obj.value = "";
    obj.focus();
    return;
   }
   else
   {
     if(str.length > 2 )
     {
      alert("��������ֳ��Ȳ��ܴ���2  ��");
      obj.value = "";
      obj.focus();
      return;
    }
  }
}

// �ж�����ʱ�
function checkNumyoubian(obj)
{
   var str=obj.value;
   if(str=="")
   {
    obj.value = "";
    obj.focus();
    return;
   }
   if(!isNumber(str))
   {
    alert("��������ֲ��Ϸ�,����������  ��");
    obj.value = "";
    obj.focus();
    return;
   }
   else
   {
     if(str.length > 6)
     {
      alert("��������ֳ��Ȳ��ܴ���6,����������  ��");
      obj.value = "";
      obj.focus();
      return;
    }
  }
}

// ���ڵ���
function checkNumdate(obj)
{
  var str=obj.value;
  if(str=="")
  {
    obj.value = "";
    obj.focus();
    return;
  }
  if(!isNumber(str)&&str.length<8)
    {
      alert("��������ڲ��Ϸ�  ��");
      obj.value = "";
      obj.focus();
      return;
    }
}

// ��õ�ǰʱ��yyyy-MM-dd
 function getNowDate(obj)
  {
var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }    date=window.showModalDialog("timeOfNow.jsp","","dialogWidth:0px;dialogHeight:0px;center:no");
obj.value=date.substring(0,10);
}

// ��õ�ǰʱ��HH:mm:ss
 function getNowTime(obj)
  {
var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
  date=window.showModalDialog("timeOfNow1.jsp","","dialogWidth:0px;dialogHeight:0px;center:no");
  obj.value=date.substring(11,20);
}


// �ύ����
function chooseCalendar(a,b)
{
  b.value = a.name;
  document.forms[0].submit();
}

//
function showTable(tableObject,argument)
{
  if(argument.statues=="show")
  {
    tableObject.style.display="none";
    argument.value="��";
    argument.statues="hidden";
    argument.src="../imagine/mainclosea.gif";
  }
  else
  {
    tableObject.style.display="block";
    argument.value="�ر�";
    argument.statues="show";
    argument.src="../imagine/mainopena.gif";
  }
}

function thisPageSubmit(f)
{
   if(window.event.keyCode == 13)
   {
      checknotnull2(f);
   }
}

// ��ҳ����ʾģ����"��"��"�ر�"��ť��Ч���л�
function changeMouseOverColor(argument)
{
  if(argument.statues=="show")
  {
    argument.src="../imagine/maincloseb.gif";
  }
  else
  {
    argument.src="../imagine/mainopenb.gif";
  }
}

// ��ҳ����ʾģ����"��"��"�ر�"��ť��Ч���л�
function changeMouseOutColor(argument)
{
  if(argument.statues=="show")
  {
    argument.src="../imagine/mainclosea.gif";
  }
  else
  {
    argument.src="../imagine/mainopena.gif";
  }
}

// �ж��б���n�У���n���Ƿ�����
function listCheck(f)
{
  var str;
  for(var i = 0; i < f.length; i++)
  {
    if(f.elements(i).type == "text")
    {
      var name=f.elements(i).name;
      if(name.indexOf(".pagenumber")!=-1||name.indexOf(".rownumber")!=-1)
      {
      str = f.elements(i).value;
      if(!isNumber(str))
      {
        alert("���������֣�");
        f.elements(i).value = "";
        f.elements(i).focus();
        return;
      }
      else
      {
        if(str.charAt(0)=='0'||str.charAt(0)=='-')
        {
          alert("����������ֲ��Ϸ���");
          f.elements(i).value = "";
          f.elements(i).focus();
          return;
        }
      }
      }
    }
  }
  f.submit();
}




/**
 * ���б�source���ƶ�ѡ�����Ա���б�target��
 * @param source
 * @param target
 * @param result ���ڲ������ݵĽ��
 */
function move(source, target)
{
  var i = 0;
  for(i = 0; i < source.options.length; i++)
  {
    if(source.options(i).selected == true)
	  {
      var oOption2 = document.createElement('OPTION');
      oOption2.text = source.options(i).text;
      target.add(oOption2);
      source.remove(i);
      i--;
    }
  }
}

/**
 * �ƶ�source�е�����ѡ���target��
 * @return
 */
function moveAll(source, target)
{
  var i = 0;
  for(i = 0; i < source.options.length; i++)
  {
    var oOption2 = document.createElement('OPTION');
    oOption2.text = source.options(i).text;
    target.add(oOption2);
    source.remove(i);
    i--;
  }
}

/**
 * ���б��е�����ѡ������ӵ��ı���������
 */
function listToText(source, target)
{
  // ��Ŀ�����
  target.value = "";
  // ��Դ��������ӵ�Ŀ���У���','�ָ�
  var i = 0;
  for(i = 0; i < source.options.length; i++)
  {
    if(i != 0)
    {
      target.value += ",";
    }
    target.value += source.options(i).text;
  }
}






/**
 * ����ѡ�����б仯
 * @param result �����б仯��ѡ����ļ��ϣ���","�ָ���
 * @param item Ҫ���õ�ѡ���
 */
function setAlterItem(result, item)
{
  var source = result.value;
  var target = item.name;
  var resourceName = document.forms[0].resourcename.value;
 
  if(resourceName != null)
  {
     setAlterItemResouece(result,item);
  }
  else
  {
  // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {
    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {
    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }
  // ���ý��
  result.value = source;
  }
}


function setAlterItemForPost(result, item)
{
  var source = result.value;
  var target = item.name;

 // var resourceName = document.forms[0].resourcename.value;
 // if(resourceName != null)
 // {
 //    setAlterItemResouece(result,item);
 // }


  // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {
    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {

    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }
  // ���ý��
  result.value = source;

}

/**
 * ����ѡ�����б仯
 * @param result �����б仯��ѡ����ļ��ϣ���","�ָ���
 * @param item Ҫ���õ�ѡ���
 */
function setAlterItemForNews(result, item)
{
  var source = result.value;
  var target = item.name;
 // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {
    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {

    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }

  // ���ý��
  result.value = source;

 }



/**
 * ����ѡ�����б仯
 * @param result �����б仯��ѡ����ļ��ϣ���","�ָ���
 * @param item Ҫ���õ�ѡ���
 */
function setCheckAlterItem(result, context)
{
  var source = result.value;
  var target = context
 // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {
    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {

    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }
  // ���ý��
  result.value = source;
 }
/**
 * ����ѡ�����б仯
 * @param result �����б仯��ѡ����ļ��ϣ���","�ָ���
 * @param item Ҫ���õ�ѡ���
 */
function setAlterItemResouece(result, item)
{
  var source = result.value;
  var target = item.name;
  var resourceName = document.forms[0].resourcename.value;
  // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {
    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {
    var start = resourceName.indexOf(target);
    if(start != -1)
    {
    var end = resourceName.lastIndexOf("_",start);
    var ends = resourceName.lastIndexOf(",",start);
    var newvalue = resourceName.substring(ends+1,end);
    var lastIndex = resourceName.lastIndexOf(",");
    var length = resourceName.length;
    var typename = resourceName.substring(lastIndex+1,length);
    var message =  typename + " '" + newvalue + "' ���ӣ������Ҫ���估��������ѡ����";
       if(window.confirm(message))
       {
         // ���仯����ӵ��仯������
         if(source != "")
          {
              source += ',';
          }
             source += target;
       }
       else
        {
           item.checked = false;
         }
    }
    else
    {
    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
    }
  }
  // ���ý��
  result.value = source;
}
/**
 * ����ѡ�����б仯,���ύ
 * @param result �����б仯��ѡ����ļ��ϣ���","�ָ���
 * @param item Ҫ���õ�ѡ���
 */
function setAlterItemAndSubmit(result, item)
{

  var source = result.value;
  var target = item.name;

  // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {

    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {

    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }

  // ���ý��
  result.value = source;
  orientation();

  //����action��
  document.forms[0].checked.value = "checked" ;
  document.forms[0].submit();
  }



/**
 * ����ѡ�����б仯,���ύ
 * @param result �����б仯��ѡ����ļ��ϣ���","�ָ���
 * @param item Ҫ���õ�ѡ���
 */
function setAlterItemAndSubmitForDepartment(result, item)
{

  var source = result.value;
  var target = item.name;

  // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {

    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {

    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }

  // ���ý��
  result.value = source;
  orientation();


  document.forms[0].submit();
  }



function setwithotherAlterItem(result, item,other)
{
  var source = result.value;
  var target = item.name;
  // �ڱ仯��������
  var index = indexOf(source, target);
  // û�ҵ�
  if(index != -1)
  {

 var oth=new Number(other.value);
 var tempt=new Number(item.value);
other.value=oth-tempt;

    // �õ��仯��ĳ���
    var length = index + target.length;
    if(length != source.length)
    {
      length += 1;
    }
    // �ӱ仯������ɾ���仯��
    source = source.substring(0, index) + source.substring(length);
    // ɾ������','
    if(source.charAt(source.length - 1) == ',')
    {
      source = source.substring(0, source.length - 1);
    }
  }
  // �ҵ���
  else
  {

 var oth=new Number(other.value);
 var tempt=new Number(item.value);
other.value=oth+tempt;
    // ���仯����ӵ��仯������
    if(source != "")
    {
      source += ',';
    }
    source += target;
  }
  // ���ý��
  result.value = source;
}






/**
 * �õ�ѡ����������ѡ�������е��ַ���λ�á�
 * @param source ��ѡ�������ַ���
 * @param target ѡ��������
 * @return �ַ���λ�ã�û���ҵ�������-1
 */
function indexOf(source, target)
{
  // ����ѡ����������ѡ����
  var index = source.indexOf(target);
  while(index != -1)
  {
    // ����ҵ���ѡ����ǰ����','��˵����һ��������ѡ�������
    var end = index + target.length;
    if((index == 0 || source.charAt(index - 1) == ',') &&
      (end == source.length || source.charAt(end) == ','))
    {
      return index;
    }
    // ���򣬼�������
    index = source.indexOf(target, index + 1);
  }
  return index;
}
//ɾ����ַ���е�next
function deleteNext()
{
//ɾ����ĵ�ַ���е�ǰ�벿��
var  firststring;
//ɾ����ĵ�ַ���еĺ�벿��
var  laststring;
//���ȵõ���ַ���е����ݡ�
var next=window.location.href;
//�õ�option�ĵ�
 var con=next.indexOf(".option");
if(con!=-1)
{

var pre=next.lastIndexOf("?",con);
var p=next.lastIndexOf("&",con);
if(pre!=-1)
{

firststring=next.substring(0,pre+1);


}
if(p!=-1)
{
firststring=next.substring(0,p);

}
if(pre!=-1&&p!=-1)
{
first=next.substring(0,p);



}
var last=next.indexOf("&",con);

if(pre!=-1&&last!=-1)
{
 laststring=next.substring(last+1,next.length);


}
if(p!=-1&&last!=-1)
{
laststring=next.substring(last,next.length);

}
if(p!=-1&&pre!=-1&&last!=-1)
{
laststring=next.substring(last,next.length);
}
window.location.href=firststring+laststring;
}


}

function  tijiao(a,re)
{
  a.href=a.href+"&"+"test="+re.value;
}

// �û��޸������������
function passwordcheck()
{
  if(document.forms[0].newPassword.value.length<6||document.forms[0].affirmPassword.value.length<=6)
  {
    alert("�������������5λ ��");
  }
  else
  {
    if(document.forms[0].newPassword.value!=document.forms[0].affirmPassword.value)
    {
      alert("������벻һ�� ��");
      document.forms[0].newPassword.value="";
      document.forms[0].affirmPassword.value="";
    }
    else
    {
     document.forms[0].submit();
    }
  }
}

//�����Ϊ�գ����ύ
function checknotnull(f)
{
  if(checkNotNullWithoutSubmit(f) == true) {
    f.submit();
  }
}

//��ѯ�ύ
function searchchecknotnull(f)
{
    f.submit();
}

//����ʱ��εĶ���
function TimeSegment(name) {
  this.name = name;
}

//���������ҵ��������ֵ�ʱ���
function getTimeSegment(segments, name) {
  var i = -1;
  for(i in segments) {
    if(segments[i].name == name) {
      return segments[i];
    }
  }
  var segment = new TimeSegment(name);
  segments[i + 1] = segment;
  return segment;
}

//�õ�ҳ�������п�ʼʱ�������ʱ���
function getTimeSegments(form) {
  var segments = new Array();  
  var ele = form.elements;
  var tip = "";
  for(var i = 0; i < ele.length; i++)
  {
    //�п�ʼ��ǣ����������ҵ��������ÿ�ʼʱ��
    if(ele[i].timestart != undefined) {
      segment = getTimeSegment(segments, ele[i].timestart);
      segment.timestart = ele[i].value;      
    }
    //�н�����ǣ����������ҵ��������ý���ʱ��
    else if(ele[i].timeend != undefined) {
      segment = getTimeSegment(segments, ele[i].timeend);
      segment.timeend = ele[i].value;      
    }
  }
  return segments;
}

//���ʱ����Ƿ�Ϸ�
function checkTimeSegment(segment) {
  if(segment.timestart > segment.timeend) {
    alert(segment.name + "����ʼʱ�䲻�ܴ��ڽ���ʱ�䣬������ѡ��");
    return false;
  }
  return true;
}

//��鿪ʼʱ���Ƿ�С�ڽ���ʱ��
function flowCheckTimeSegment(f) {
  var segments = getTimeSegments(document.forms[0]);
  for(i in segments) {
    if(checkTimeSegment(segments[i]) == false) {
      return false;
    }
  }
  return true;  
}

//������ת�����Ϊ��
function flowchecknotnull(f)
{
  var ele =f.elements;
  var tip = "";
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
        tip += ele[i].cname+",";
      }
    }
  }
  if(tip!="")
  {
    tip = tip.substring(0, tip.length - 1);
    alert(tip + "����Ϊ�ա�");
    return false;
  }
  else
  {
    return true;
  }
}

//��������е���������
function flowCheck(f) {
  if(flowchecknotnull(f) == false) {
    return false;
  }
  if(flowCheckTimeSegment(f) == false) {
    return false;
  }
  return true;
}

//�����Ϊ��
function onerecord(f)
{
  var ele =f.elements;
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
        alert("����Ϊ�գ����������룡");
        ele[i].focus();
        return;
      }
    }
  }
  if(window.confirm("ȷ�ϸ��������"))
  {
    f.onerecord.value = "onerecord";
    f.submit();
  }
}


//�����Ϊ��
function checknotnull2(f)
{
  var ele =f.elements;
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
        alert("�û��������벻��Ϊ�գ����������룡");
        ele[i].focus();
        return;
      }
    }
  }
  document.forms[0].submit();
}

//�����Ϊ��
function checknotnullforlogin(f)
{
  var ele =f.elements;
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
       alert("��������û��������벻��ȷ��");
        ele[i].focus();
        return;
      }
    }
  }
  document.forms[0].submit();
}

//ֻ��鲻����Ϊ�գ����ύ�������Ƿ���ɹ�
function checkNotNullWithoutSubmit(f) {
  var ele =f.elements;
  var tip = "";
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
        tip += ele[i].cname+",";
      }
    }
  }
  if(tip!="")
  {
    tip = tip.substring(0, tip.length - 1);
    alert(tip + "����Ϊ�ա�");
    return false;
  }
  return true;
}

function processfirstsubmit(f,str)
{
  var ele =f.elements;
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
        alert("����Ϊ�գ����������룡");
	var obj=f.reallysubmit;
        if(obj!="")
        {
          obj.value="";
        }
        ele[i].focus();
        return;
      }
    }
  }
  document.forms[0].reallysubmit.value='true';
  window.open(str);
}

//���ô���
function wrongmessagebox()
{
  alert("��������û��������벻��ȷ��");
}

//���óɹ�
function passwordupdate()
{
  alert("���������ѳɹ���");

    opener.location.reload();
  //opener.top.left.location.reload();
  window.close();
}



function submitCheck()
{
var ele =document.forms[0].elements;
   //��鳤��
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].minlength!=null&&ele[i].minlength!="")
    {
      if(ele[i].value.length<ele[i].minlength)
      {
      alert("���Ȳ�������"+ele[i].minlength);
      ele[i].focus();
      return;
      }
    }
  }
  //����
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].notnull == "notnull")
    {
      if(ele[i].value == "")
      {
        alert("����Ϊ��!����������  ��");
	    ele[i].focus();
        return;
      }
    }
  }
  //�������
  for(var j=0;j<ele.length;j++)
  {
  if(ele[j].number=="number")
    {
	  var str=ele[j].value;
      if(!isNum(str))
	   {
	      alert("��������ֲ��Ϸ�  ��");
          ele[j].value = "";
          ele[j].focus();
          return;
	   }
     }
  }
  document.forms[0].submit();
}

//�û��༭ģ���е��ж�
function checkAllIsNull()
{
  if(document.forms[0].name.value.length<1)
  {
    alert("����������Ϊ�գ�");
  }
  else if(document.forms[0].ename.value.length<1)
  {
    alert("��½������Ϊ�գ�");
  }
   else
  {
    document.forms[0].submit();
  }
}

function transtree(a,hide)
{
  hide.value=a.name;
  	NS = (document.layers) ? 1 : 0;
	IE = (document.all) ? 1: 0;
	if(IE) { diffY = document.body.scrollTop; diffX = document.body.scrollLeft; }
	if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; }
  for(var i = 0; i < hide.form.elements.length; i++)
  {
    var element = hide.form.elements[i];
    if(element.type == "hidden")
    {
      if(element.id == "xlocation")
      {
        element.value = diffX;
      }
      else if(element.id == "ylocation")
      {
        element.value = diffY;
      }
    }
  }
  hide.form.submit();
}

function reallsubmit()
{
  document.forms[0].reallysubmit.value="reall";
  document.forms[0].submit();
}

function selectedsubmit()
{

  document.forms[0].reallysubmit.value="reall";
  document.forms[0].submit();
}

function selectedsubmit2()
{
	 document.forms[0].reallysubmit.value="reall";
  document.forms[0].submit();
  window.close();

}

function doEmptey(a)
{
  a.value="";
}

// �������뽹��Ϊ�û���
function setFocus()
{
  document.forms[0].loginUser.focus();
}

//
function settradeinputvalue(obj,t,form)
{
  var url="page.jsp?templatename="+t;
  var temp=window.showModalDialog(url, null, "dialogWidth:800px; dialogHeight:600px; dialogLeft:180px; dialogTop:80px");
  if(temp !=""&& isNumber1(temp))
  {
    obj.value=temp;
    if(form!="")
    {
      form.submit();
    }
  }
}

//�Ӵ򿪵�windowsģ̬�Ի����а�ֵ����obj
function selectedValuef(obj,t)
{

  var temp=window.showModalDialog(t, null, "dialogWidth:500px; dialogHeight:375px; center:yes");
  if(temp !="")
  {
    obj.value=temp;
  }
}

//�Ӵ򿪵�windowsģ̬�Ի����а�ֵ����obj
function selectedValue(obj,t)
{
  var temp=window.showModalDialog(t, null, "dialogWidth:500px; dialogHeight:375px; dialogLeft:150px; dialogTop:100px");
  if(temp !="")
  {
    obj.value=temp;
  }
}

function setwindowreturn()
{
  if(document.forms[0].resultdarpent.value.indexOf(",")!=-1)
  {
    alert("�㲻�ܶ�ѡ  ��");
    return;
  }
  window.returnValue=document.forms[0].resultdarpent.value;
  window.close();
}

function setMutiwindowreturn()
{
  window.returnValue=document.forms[0].resultdarpent.value;
  window.close();
}
function setMutiwindowreturns()
{
  window.returnValue=document.forms[0].result.value;
  window.close();
}
//����ѡ�����ݣ����Զ�ѡ
function setWindowReturnForMultable()
{
  window.returnValue=document.forms[0].resultdarpent.value;
  window.close();
}

function testtest(a,b,c)
{
  alert(a);
  document.all(a).style="display:display";
}

//�����ǩѡ�����б�ǩ������type="tab"����
//div:Ҫ��ʾ��ǩ
function tabClick(div)
{
  //����ÿһ��Ԫ��
  var elements = document.all;
  for(var i = 0; i < elements.length; i++)
  {
    //����Ǳ�ǩ
    if(elements[i].type == "tab")
    {
      //����
      elements[i].style.display = "none";
    }
  }
  //��ʾҪ��ʾ�ı�ǩ
  div.style.display="block";
}
function setthirdValue(a,b,c)
{
c.value=a.value+"-"+b.value;
}

//������ѡ�еĽڵ㲢�ύ
function setTreeSelected(selectedid, treeForm)
{
   orientation();
  document.forms[0].selectedid.value = selectedid;
  document.forms[0].submit();
}

function setvaluebyselected(source,a,b)
{
var value = source.options[source.selectedIndex].value;

if(value=="����")
{
tabClick(a)
}
else
{

tabClick(b)
}




}

 function tested()
  {
    opener.document.forms[0].sellsmen.value=document.all('returnvalue').value;

  window.close();

  }



function tabsubmit(obj)
{

document.forms[0].tab.value=obj;
 document.tabform.submit();

}

//��ʼ��
function init()
{
  var es = document.forms[0].elements;
  document.forms[0].result.value = "";
  for(var i = 0; i < es.length; i++)
  {
    if(es[i].type == "select")
    {
      if(document.forms[0].result.value != "")
      {
        document.forms[0].result.value += ","
      }
      document.forms[0].result.value += es[i].name + "-" + es[i].value;
    }
  }

}


function submitresult(x,y,z,p,q,a,b,c,f,str)
{

checkprocessdef(x,y,z,p,q)


if(getsuplit(a,b,c))
{

 processfirstsubmit(f,str)
}
}



//��֤���֤
function datefromID(sex,sele,IDid,birth)
{
if(IDid.value=="")
{

return;
}
if(!isNumber(IDid.value))
{
alert("������ȷ��д���֤ ��");
IDid.value="";

IDid.focus();

return;

}

if(sele.options[sele.selectedIndex].text=="���֤")
{

var lastBit = IDid.value.substring(IDid.value.length - 1,IDid.value.length );

if( sex.options[sex.selectedIndex].text == '��')
{
	if((lastBit != '1') && (lastBit != '3') && (lastBit != '5') && (lastBit != '7') && (lastBit != '9'))
	{
	alert("������ȷ��д�������֤ ��");
        IDid.value="";
         birth.value="";
        IDid.focus();
	return;
	}
}

if( sex.options[sex.selectedIndex].text == 'Ů')
{
	if((lastBit != '0')&&(lastBit != '2')&&(lastBit != '4')&&(lastBit != '6')&&(lastBit != '8'))
	{
	alert("������ȷ��дŮ�����֤ ��");
         IDid.value="";
         birth.value="";
          IDid.focus();
       return;
	}
}


/////
   var IDlength123=IDid.value.length;
   if(IDlength123==15)
   {
     var y=IDid.value.substring(0,6)+19;

	 var p=y+IDid.value.substring(6,15);
	//��͵Ľ��
	var h=0;
	//2��n�η�
	var w=1;
	//�����Ѿ�������17λ���֤��
	for(var i=1;i<=17;i++)
	{
	   //ȡһλ
	   var s=p.charAt(17-i);

	   w*=2;
	   var xx=w%11;
	   h+=xx*s;

	}

	var wwww=h%11;
	var ai;
	if(wwww==0)
	{ai=1;}
	else if(wwww==1)
	{ai=0;}
	else if(wwww==2)
	{ai="x";}
	else if(wwww==3)
	{ai=9;}
	else if(wwww==4)
	{ai=8;}
	else if(wwww==5)
	{ai=7;}
	else if(wwww==6)
	{ai=6;}
	else if(wwww==7)
	{ai=5;}
	else if(wwww==8)
	{ai=4;}
	else if(wwww==9)
	{ai=3;}
	else if(wwww==10)
	{ai=2;}

	IDid.value=p+ai;

	IDlength123=IDid.value.length;

   }
   if(IDlength123==18)
  {
   birth.value=IDid.value.substring(6,14);
  // var currentdate=new Date().getYear();

 //  var subdateyear=IDid.value.substring(6,10);
 //  age.value=currentdate-subdateyear;

  }
   else{
   alert("��������֤�Ų���ȷ ��");
   return;
   }
}

}

// ���س������¼
function loginonkey()
{
  if(window.event.keyCode ==13)
  {
    document.forms[0].submit();
  }
}

// ѡ������
function chooseCalendar(a,b)
{
  b.value=a.name;
  document.forms[0].submit();
}

function checkvalue(obj)
{
   var str=obj.value;
   if(!isNum(str))
   {
    alert("����������ֲ���ȷ!");
    obj.value = "";
    obj.focus();
    return;
   }
   else
  {
var temp = new Number(str);
if(temp>1)
{
alert("�����ֵ���ܴ���1!");
    obj.value = "";
    obj.focus();
    return;
}
 }
}



// �ж���������������Ƿ�һ��
function checkrepair(a,b)
{
  var atemp = a.value;
  var btemp = b.value;
  if(atemp!=btemp)
  {
    alert("��������ĺ��벻һ�£����������롣");
    b.value="";
    a.focus();
  }
}

//��֤�Ƿ������֤����
function datefromshen(a,b)
{
  var temp = a.value;
  if(temp=="���֤")
  {
    if(b.value.length != 15 && b.value.length != 18)
    {
      alert("����������֤�����λ������ȷ��");
      b.value="";
      b.focus();
    }
  }
}

//��������ѡ���û�
function chatselectuser(a)
{
  top.right.document.forms[0].sayto.value=a.username;
  top.right.document.forms[0].useridsayto.value=a.userid;
}

// �������������Ƿ������Ļ�
function chatprivateselect(a)
{
  if(a.value == "false")
  {
    a.value="true";
  }
  else
  {
    a.value ="false";
  }
}

// �������й������Ķ�λ
function scrollgoto()
{
  document.body.scrollTop=10000;
}

//�������е�xmlhttp����
function sendxmlhttp(s)
{
  var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  xmlhttp.Open("POST", "s", false);
  xmlhttp.Send("<timesheet>b</timesheet>");
  divPublic.innerHTML=divPublic.innerHTML+xmlhttp.responseText;
  setTimeout("send()",3000);
}

//
function setResult(result,radio)
{
  result.value=radio.value;
}

// ��һ������
function openResult(url,result)
{
  url=url+'&amp;result='+result.value;
  window.open(url, "_blank", "scrollbars=yes");
}

// ����һ������
function gotoanotherurl(obj,tname)
{
  var href="page.jsp?templatename="+tname+"&keyword="+obj.value;
  window.open(href);
}

//
function reallsubmit2()
{
  if(this.document.all("result").value.length<2)
    {
      alert("��û��ѡ���ˣ�");
      return;
    }

  if(this.document.all("result").value.length>8)
    {
      alert("��һ��ֻ��ת��һ�����");
      return;
    }
 document.forms[0].reallysubmit.value="reall";
 document.forms[0].submit();
}

function checkActivityNull()
{
  if(this.document.all("result").value.length<2)
    {
      alert("��û��ѡ����");
      return;
    }
}
function conformStopProcess()
 {
    if(window.confirm("�û��ֹ���ܱ������������Ҫ������"))
       {
          this.document.all("action").value="stopProcess";
          document.forms[0].submit();
       }
 }
function conformStopActivity()
 {
 if(this.document.all("result").value.length<2)
  {
   alert("��û��ѡ����");
   return;
  }
    if(window.confirm("�û��ֹ���ܱ������������Ҫ������"))
       {
          this.document.all("action").value="stopActivity";
          document.forms[0].submit();
       }
 }
function suspendProcess()
{

this.document.all("action").value="suspendProcess";
document.forms[0].submit();
}
function resumeProcess()
{

this.document.all("action").value="resumeProcess";
document.forms[0].submit();
}

function suspendActivity()
{
checkActivityNull();
this.document.all("action").value="suspendActivity";
document.forms[0].submit();
}

function resumeActivity()
{
checkActivityNull();
this.document.all("action").value="resumeActivity";
document.forms[0].submit();
}

function callbackActivity()
{
checkActivityNull();
this.document.all("action").value="callbackActivity";
document.forms[0].submit();
}

function setTransmitID()
{
  if(this.document.all("result").value.length<2)
    {
      alert("��û��ѡ����Ҫ�����Ļ��");
      return;
    }
  if(this.document.all("result").value.indexOf(",") != -1)
    {
      alert("��һ��ֻ��ת��һ�����");
      return;
    }
    this.document.all("action").value="transmitActivity";

var nexturl="page.jsp?templatename=ת����Աѡ��&amp;activityID="+this.document.all("result").value;
  window.open(nexturl,'_blank','toolbar=no,menubar=no,location=no,scrollbars=yes,top=115,left=210,width=804,height=596');
  document.forms[0].submit();
}

//����ǹ���
function setFunctionType(lalye,linktype,pagenames,processnames,link)
{
 lalye.style.display="block";
 linktype.value="function";
 pagenames.disabled=false;
 processnames.disabled=true;
 link.value="";
 link.readOnly=true;
}

//���������
function setProcessType(lalye,linktype,pagenames,processnames,link)
{
 lalye.style.display="block";
 linktype.value="process";
 pagenames.disabled=true;
 processnames.disabled=false;
 link.value="";
 link.readOnly=true;
}

//������Զ��������
function setDefineType(lalye,linktype,pagenames,processnames,link)
{
 lalye.style.display="block";
 linktype.value="defineself";
 pagenames.disabled=true;
 processnames.disabled=true;
 link.readOnly=false;
}

//
function checkFunctionNull2()
{
  if(document.forms[0].functionlink.value!=null&&document.forms[0].functionlink.value!="")
  {
    document.all["add"].style.display="none";
  }
  else
  {
    document.all["add"].style.display="block";
  }
}



//����
 var  days = new Array();
    var  aDate ;
    var  dateObj;
  //�����һ�괥�����¼�
   function nextyear()
   {
        var i = aDate.getYear();
		i++;
		aDate.setYear(i);
		useDateSetArray();
		showDate();
   }
   //�����һ�괥�����¼�
   function previousyear()
   {
       var i = aDate.getYear();
	   if(i!=2000)
	   {
		i--;
		}
		aDate.setYear(i);
		useDateSetArray();
		showDate();
   }
   //����¸��´������¼�
   function  nextmonth()
   {
       var i = aDate.getMonth();
		i++;
		aDate.setMonth(i);
		useDateSetArray();
		showDate();
   }
  //����ϸ��´������¼�
  function previousmonth()
  {

       var i = aDate.getMonth();
	i--;
	aDate.setMonth(i);
	useDateSetArray();
	showDate();
  }
  //��������Ϊ����µĵ�һ�죬���ڼ���
  function setFristDayOfMonth()
  {
     //��õ�ǰ����
     aDate = new Date();
     //��������Ϊ����µĵ�һ��
     aDate.setDate(1);
     //�����ڸ�ʽ����������
     useDateSetArray();
     //���������õ����ڲ���
     showDate();
  }
  function useDateSetArray()
  {
         //����µ�����
	 var dayNumber = 31;
         //�õ�ѡ������
	 var year = aDate.getYear();
         //�õ�ѡ�����
	 var dayOfWeek = aDate.getDay();
	 //�õ�ѡ�����
         var month = aDate.getMonth();
	  //�����С�¸�30��
          if(month==3 || month ==5 || month  ==8 || month ==10)
	  {
	     dayNumber = 30;
	  }
          //����Ƕ���
	  if(month==1)
	 {
                //���������
	            if(year%100 == 0 &&  year%400 ==0)
		    {
			           dayNumber = 29;
			}
                      //�����������
			if(year%100 == 0 &&  year%400 !=0)
			{
			            dayNumber = 28;
			 }
		   //���������
                   if(year%100 != 0 &&  year%4 == 0)
			 {
			         dayNumber = 29;
			  }
                        //�����������
			  if(year%100 != 0 &&  year%4 != 0)
			  {
			           dayNumber = 28;
			   }
	 }
	   //һ�����еĵ�һ�ܵ�ǰ�漸��λ�����
	   for(var i= 0; i<dayOfWeek;i++)
		  {
		     days[i] ="";
		  }
              //������
		  for(var i = 0; i < dayNumber; i++)
		  {

                       days[i+dayOfWeek] ="" +(i + 1);

		  }
                  //һ�����е����һ�ܵĺ��漸��λ�����

		  for(var i=dayNumber+dayOfWeek; i < 42;i++)
		  {
		     days[i] ="";
		  }

  }

//��ʾ��������
function showDate()
  {
         //��ǰ����
         var now = new Date();
         //��
         var dayofmonth;
	 //ѡ��������е��·�
         var  monthofdate=document.all("monthofdate");
	 //ѡ��������е����
        var yearofdate = document.all("yearofdate");
	 //���·����õ�ҳ����
	   monthofdate.innerHTML= aDate.getMonth()+1+"��";
	  //��������õ�ҳ����
          yearofdate.innerHTML=aDate.getYear()+"��";
	  //�������õ�ҳ����
	  for(var i = 0 ;i <42 ; i++)
	  {
             dayofmonth = document.all("dayofmonth_"+i);
             dayofmonth.innerHTML = days[i];
              //���ѡ������ں͵�ǰ������ͬ��ͻ����ʾ
             if(now.getYear()==aDate.getYear()&&now.getMonth()==aDate.getMonth()&&now.getDate()==days[i])
             {
                dayofmonth.bgcolor="#000000";
             }
	     days[i] ="";
          }

  }
//ѡ�������¼�
function onclickday(obj)
{
  //ѡ�е���
  var month = aDate.getMonth()+1;
  //ѡ�е���
  var dayOfMonth = obj.innerHTML;
  //����λ����ʾ��
  if(month<10)
  {
    month="0"+month;
  }
  //����λ����ʾ��
  if(dayOfMonth < 10)
 {
   dayOfMonth = "0"+dayOfMonth;
 }
 //���������ø�ԭ����
 dateObj.value=""+aDate.getYear()+"-"+month+"-"+dayOfMonth;
 //���ڲ�����
 document.all("datepart").style.visibility="hidden";
}
//����ѡ�����ڲ�
function statrdate(obj)
{
   var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
  //��סԭ����
  dateObj = obj;
  //��ʼ�����ڶ���
   //��õ�ǰ����
     aDate = new Date();
     //��������Ϊ����µĵ�һ��
     aDate.setDate(1);
     //�����ڸ�ʽ����������
     useDateSetArray();
     //���������õ����ڲ���
     showDate();
  //�������ڲ��λ��
   document.all("datepart").style.left=event.x+document.body.scrollLeft;
  document.all("datepart").style.top=event.y+document.body.scrollTop;
  //�������ڲ�Ϊ��ʾ״̬
  document.all("datepart").style.visibility="visible";
}

//��̳����ѡ�����
function selectFace(obj)
{
  document.forms[0].f_face.value=obj.value;
}

//��Աͷ��
function selectPortrait(obj)
{
  document.forms[0].result.value=obj.value;
}

// ���ı�����׷������
function append2(area, hidden)
{
  var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
  if(hidden.value == "")
  {
    hidden.value = area.value;
  }
  var s = window.showModalDialog("append.jsp");
  area.value=hidden.value + s;
}
function appendapp(area)
{
  var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
  var s = window.showModalDialog("append.jsp","","dialogWidth:0px;dialogHeight:0px;center:no");
  area.value= s;
}
function appendNameAndDate(area)
{
var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
  var s = window.showModalDialog("appendWithUserAndDate.jsp","","dialogWidth:300px;dialogHeight:200px;center:yes");

  area.value= area.value + s + "\n";
  var i=area.value.indexOf("undefined");
  if(i>=0)
  {
     area.value=area.value.substring(0,i);
  }
}

//�ж��ǲ��ǺϷ���email��ַ
function isRightEmail(email)
{
  var str=email.value;
  var length=str.length;
  var a=str.indexOf("@");
  var b=str.lastIndexOf(".");
  if(a<1||b==length-1||b-a<2)
  {
    email.value="";
    alert("���ǺϷ���email�����������룡");
  }
}
//�ǹ���ʱ����ӵİ�ť���
function checkFunctionNull()
{
if(document.forms[0].functionlink.value!=null&&document.forms[0].functionlink.value!="")
{
     var img=document.all("addfunction").replaceimg;
     document.all("addfunction").src=img;
     document.all("addfunction").onclick="";

}
}
//ѡ������
function calendarSelect(obj)
{
   var url = document.location.href;
   //�����ֻ��״ֱ̬�ӷ���
   if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
   var name=obj.name;
   var date=window.open("calendarSelect.jsp?item="+name,"","fullscreen=yes,scrollbars");
   date.blur();
   date.resizeTo(195,175);
   date.moveTo(200,200);
   date.focus();
}

// ��õ�ǰʱ��yyyy-MM-dd hh:00
 function getTimeOfNow(obj)
  {
var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
 var date=window.showModalDialog("timeOfNow.jsp","","dialogWidth:0px;dialogHeight:0px;center:no");
obj.value=date;
}
// ��õ�ǰ�û���������
 function getUserNameAndDate(obj)
  {
  var url = document.location.href;
    //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }    var date=window.showModalDialog("userNameAndDate.jsp","","dialogWidth:0px;dialogHeight:0px;center:no");
obj.value=date;
}
//���������еĶ�������
function superviseAwake()
{
  window.open("page.jsp?templatename=�������ѱ���ʾģ��","_blank", "status=no,toolbar=no,menubar=no,location=no,top=100,left=150,width=495,height=309");
}
//���������еĶ���������û����д��ᱨ�������
function noReturnAwake()
{
  window.open("page.jsp?templatename=�ް�ᱨ�����ѱ���ʾģ��","_blank", "status=no,toolbar=no,menubar=no,location=no,top=100,left=150,width=495,height=309");
}

//ִ����Աѡ�����Ĳ�ѯ
function searchUser(searchtype)
{
document.all('searchtype').value=searchtype.name;
document.forms[0].submit();
}
//�ж�b��ֵ�Ƿ����a��ֵ
function stringCompare(a,b)
{
  //������ݲ���
  if(a.value!=""&&b.value!="")
  {
    //ȡ�ó���С����ѭ���ĳ���
    var length= a.value.length;
    if(a.value.length>b.value.length)
    {
      length=b.value.length;
    }
    var aChar;
    var bChar;
    for(var i=0;i<length;i++)
    {
       //ȡ�õ����ַ����ַ�ֵ
       aChar=a.value.charCodeAt(i);
       bChar=b.value.charCodeAt(i);
       //���ַ�ֵ�Ĵ�С���ж�
       if(aChar>bChar)
       {
         alert("����ʱ�䲻��С�ڿ�ʼʱ�䣬������ѡ��");
         b.value="";
         return false;
       }
       if(aChar<bChar)
       {
         return false;
       }
    }
    //���ߵ���˵����ǰlengthλ��ȣ��Ƚϳ���
    if(b.value.length>a.value.length)
    {
       alert("���ݲ��Ϸ������������룡");
         b.value="";
         return false;
    }
  }
}
//�û��޸�����ʱ���ж�
function checkPassword()
{
  if(document.all('oldPassword').value.length<6
   ||document.all('newPassword').value.length<6
    ||document.all('affirmPassword').value.length<6)
  {
    alert("�û����벻��С��6λ��");
    return false;
  }
  else if(document.forms[0].newPassword.value != document.forms[0].affirmPassword.value)
  {
    document.forms[0].newPassword.value="";
    document.forms[0].affirmPassword.value="";
    alert("������������벻һ�£����������룡")
  }
  else
  {
    document.forms[0].submit();
  }
}
//д��ekey
function writeEkey(content)
{
	if(content!="")
	{
          if(content.length<100)
		{
		this.document.BSEkey.WriteEkey(content);
		}
	}
}
//��ekey�е�����
function readEkey()
{
 this.document.all("ekeyuser").value= this.document.BSEkey.ReadEkey();
}

//����ϴ����ļ���ַ�Ƿ�Ϊ��
function checkuploadfile(src,obj)
{
if(document.forms[0].file.value=="")
{
  if(window.confirm("��û��ѡ���ļ� "));
  {
   window.close();
  }
}
else
{
  inProcessUpload(src,obj)
}
}
//�ļ���ʼ�ϴ�ʱҪ��ʾ����Ϣ
function inProcessUpload(src,obj)
{
  obj.style.visibility="visible";
  src.style.visibility="hidden";
}
//�ö�ѡ������ѡ�Ķ���
function setSingleItem(result, item)
{
  if(result.value == item.name)
  {
    result.value ="";
  }
  else
  {
  result.value = item.name;
  }
   //�ҵ����еĶ�ѡ�����ó�δѡ��״̬
   var ele =document.forms[0].elements;
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].type == "checkbox")
    {
        if(ele[i].name != item.name)
        {
            ele[i].checked="";
        }
    }
  }
}

//��ȫѡ���Ƿ�ѡ��
function IsSelect(form,comid,obj)
{
  if(obj.checked==false)
  {
    selectNo(form,comid);
  }
  else
  {
    selectAll(form,comid);
  }
}


//��ȫѡ���Ƿ�ѡ��
function IsSelectForPost(form,comid,obj)
{

  if(obj.checked==false)
  {
    selectNo(form,comid);
  }
  else
  {
    selectAllForPost(form,comid);
  }
}


//��ȫѡ���Ƿ�ѡ��
function IsSelectForNews(form,comid,obj)
{
  if(obj.checked==false)
  {
    selectNo(form,comid);
  }
  else
  {
    selectAllForNews(form,comid);
  }
}
//��ȫѡ���Ƿ�ѡ��::Ӧ������Դ����
function IsSelectResource(form,comid,obj)
{
  //�õ�obj��˳��
  var order = obj.order;
  if(obj.checked==false)
  {
    selectNoResource(form,comid,order);
  }
  else
  {
    selectAllResource(form,comid,order);
  }
}

//ȫѡ
function selectAll(form,comid)
{
  var elements = form.elements;
  var str="";
  //���comid������
  comid.value = "";
  for(var i=0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.type=="checkbox")
    {
      e.checked=true;
      if(e.name!="selectall")
      {
        setAlterItem(comid, e);
      }
    }
  }
}


//ȫѡ
function selectAllForPost(form,comid)
{
  var elements = form.elements;
  var str="";
  //���comid������
   comid.value = "";
  for(var i=0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.type=="checkbox")
    {
      e.checked=true;
      if(e.name!="selectall")
      {
        setAlterItemForPost(comid, e);

      }
    }
  }
}



//ȫѡ
function selectAllForNews(form,comid)
{
  var elements = form.elements;
  var str="";
  for(var i=0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.type=="checkbox")
    {
      e.checked=true;
      if(e.name!="selectall")
      {
        setAlterItemForNews(comid, e);
      }
    }
  }
}

//ȫѡ::Ӧ������Դ����
function selectAllResource(form,comid,order)
{
  var elements = form.elements;
  var str="";
  comid.value = "";
  for(var i=0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.type=="checkbox")
    {
      if(e.order==order)
      {
       e.checked=true;
      if(e.name!="selectall")
      {
        setAlterItem(comid, e);
      }
      }
    }
  }
}

//ȫ��ѡ
function selectNo(form,comid)
{
  var elements = form.elements;
  var str="";
  for(var i=0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.type=="checkbox")
    {
      e.checked=false;
    }
  }
  comid.value="";
}

//ȫ��ѡ::Ӧ������Դ����
function selectNoResource(form,comid,order)
{
  var elements = form.elements;
  var str="";
  for(var i=0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.type=="checkbox")
    {
      if(e.order==order)
      {
      e.checked=false;
      }
    }
  }
  comid.value="";
}

// ѯ���û��Ƿ�ȷ���˳�ϵͳ
function confirmExit()
{
 if(window.confirm("��ȷ��Ҫ�˳�����ʡˮ������������ϵͳ��"))
  {
    return true;
}
 else
 {
    return false;
  }
}

//ѯ���û��Ƿ�ȷ��ɾ��,�ǳ���ɾ��
function confirmNotRealDelete(comid)
{
	var elements = document.forms[0].elements;
	var flag = true;
	for(var i = 0; i < elements.length; i++) {
		var e = elements[i];
		if (e.name == comid.value) {
			if (e.value != "") {
				flag = false;
        		if(window.confirm("�����Ҫɾ����ѡ����ɾ�����ʼ������浽�������У�"))
      			{
       			   document.forms[0].action.value="deleteselected";
         	       document.forms[0].submit();
                }
			}
		}
	}
	if(flag)
  	{
   		alert("����ѡ����Ҫɾ���ļ�¼���ٽ���ɾ����");
  	}
}

//ѯ���û��Ƿ�ȷ��ɾ��(����ɾ��ʹ��)
function confirmDeleteSelected(comid)
{
  var elements = document.forms[0].elements;
  var flag = true;
  for(var i = 0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.name==comid.value)
    {
      if(e.value!="")
      {
        flag = false;
        if(window.confirm("�����Ҫɾ����ѡ����ɾ�����޷��ָ���"))
        {
          document.forms[0].action.value="deleteselected";
          document.forms[0].submit();
        }
      }
    }
  }
  if(flag)
  {
    alert("����ѡ����Ҫɾ���ļ�¼���ٽ���ɾ����");
  }
}


//��ѡ�е�ʵ�����ɾ����� isdeleted="true"
function adddeletemarker(comid)
{
   var elements = document.forms[0].elements;
  var flag = true;
  for(var i = 0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.name==comid.value)
    {
      if(e.value!="")
      {
        flag = false;
        if(window.confirm("�����Ҫɾ����ѡ����ɾ�����޷��ָ���"))
        {
          document.forms[0].action.value="adddeletemarker";
          document.forms[0].submit();
        }
      }
    }
  }
  if(flag)
  {
    alert("����ѡ����Ҫɾ���ļ�¼���ٽ���ɾ����");
  }
}


//ѯ���û��Ƿ�ȷ��ɾ��(����ɾ��ʹ��)
function confirmDeleteOfEnd(title,hao)
{
  var post = title;
  var id = hao;
  //�õ����ӵ�id��
   var hasChildIDS = document.forms[0].resourcename.value;

  //�������
   if(hasChildIDS.indexOf(post) == -1)
   {
     window.open("delete.jsp?id=" + id + "&amp;tablename=t_oapost");
   }
   //�������
   else
   {
        //��ʾ
        if(window.confirm("��ѡ�е���Դ�������ӣ���ȷ��Ҫɾ����"))
        {
          window.open("delete.jsp?id=" + id + "&amp;tablename=t_oapost");
        }
   }
}



function confirmDeleteSelectedForPost(comid)
{

 var elements = document.forms[0].elements;
  for(var i = 0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.name==comid.name)
    {

      if(e.value!="")
      {

        if(window.confirm("�����Ҫɾ����ѡ����ɾ�����޷��ָ���"))
        {
          document.forms[0].action.value="deleteselected";
          document.forms[0].submit();
        }
      }
      else
      {
        alert("����ѡ����Ҫɾ���ļ�¼���ٽ���ɾ����");
      }
    }
  }
}


//ѯ���û��Ƿ�ȷ��ɾ��(����ɾ��ʹ��)
function confirmDeleteResource(comid)
{
  var elements = document.forms[0].elements;
  for(var i = 0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.name==comid.value)
    {
      if(e.value!="")
      {
        if(window.confirm("�����Ҫɾ����ѡ�ļ�¼��ɾ�����޷��ָ���"))
        {
          document.forms[0].action.value="deleteselected";
          document.forms[0].submit();
        }
      }
      else
      {
        alert("����ѡ����Ҫɾ���ļ�¼���ٽ���ɾ����");
      }
    }
  }
}

//����option��index����action��ֵ
function setActionByOption(object)
{

  var index = object.selectedIndex;
  if(index==0)
  {
   document.forms[0].action.value = "firstoption";
  }
  else
  {
    document.forms[0].action.value = "otheroption";
  }

  document.forms[0].submit();
}


//����option��index����action��ֵ
function setActionByOption2(object)
{

  var index = object.selectedIndex;
  if(index==0)
  {
   document.forms[0].action.value = "firstoption";
  }
  else
  {
    document.forms[0].action.value = "otheroption";
  }
  object.options[object.selectedIndex].selected.value = "true";
  document.forms[0].submit();
}

function orientation()
{
  	NS = (document.layers) ? 1 : 0;
	IE = (document.all) ? 1: 0;
	if(IE) { diffY = document.body.scrollTop; diffX = document.body.scrollLeft; }
	if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; }
  for(var i = 0; i < document.forms[0].elements.length; i++)
  {
    var element = document.forms[0].elements[i];
    if(element.type == "hidden")
    {
      if(element.id == "xlocation")
      {
        element.value = diffX;
      }
      else if(element.id == "ylocation")
      {
        element.value = diffY;
      }
    }
  }
}

//��õ�ǰʱ�䣬��ȷ���� ��ʽδ;HH:MM:SS
// ��õ�ǰʱ��yyyy-MM-dd
 function getNowTime(obj)
  {
  var url = document.location.href;
  //�����ֻ��״ֱ̬�ӷ���
  if(url.indexOf("readonly=readonly")>0)
  {
    return false;
  }
  date=window.showModalDialog("timeOfNow1.jsp","","dialogWidth:0px;dialogHeight:0px;center:no");
  obj.value=date.substring(11,19);
}

//����û������ʱ�� ʱ���ʽ����δHH:MM:SS
function checkInputTime(f)
{
   checkNumber(f);
}

function showfiltrate(inherit)
{
  if(inherit.options[inherit.selectedIndex].text =="��")
    {
      document.forms[0].action.value=inherit.name+"false";
    }
  else
    {
      document.forms[0].action.value=inherit.name+"true";
    }
  document.forms[0].submit();
}

function setRightType(ch,action)
{
  orientation();
  if(ch.checked==true)
    {
      action.value=ch.name+"true";
    }
  else
    {
      action.value=ch.name+"false";
    }
  document.forms[0].submit();
}

//�ǲ��Ǵ�����
function isInteger(number)
{
	if(!isNumber(number))
	{
		alert("����������!");
		return false;
	}
	return true;
}

//������һ��ҳ���ѡ��ֵ
function selectNode(obj,str)
{
  var v = window.showModalDialog("page.jsp?templatename="+str,"","dialogWidth:800px;dialogHeight:600px;center:yes");

  if(v!=null)
  {
    obj.value = v;
  }
}
//����������ѡ��Ľڵ㷵�ؽڵ�����
function setReturnValue()
{
var value;
  	if(document.forms[0].result.value != null
    	||document.forms[0].result.value != "")
    {
      value = document.forms[0].result.value;
	}
	else
	{
       alert("result is null");
	}

   window.returnValue = value;
   window.close();
}

//��̳ѡ��ͷ��ť
function selectHead(obj)
{
  var v = window.showModalDialog("page.jsp?templatename=��Աͷ��༭ģ��","","dialogWidth:626px;dialogHeight:470px;dialogLeft:210px;dialogTop:115px");

  if(v != null)
  {
    obj.value = v;
  }
}
//LOGOѡ��ť
function selectLogo(obj)
{
  var v = window.showModalDialog("page.jsp?templatename=logo�༭ģ��","","dialogWidth:250px; dialogHeight:180px; center:yes");

  if(v != null)
  {
    obj.value = v;
  }
}
//�����·��򿪴���
function lowerRightOpen(url)
{
  var win = window.open(url, "right", "scrollbars=yes");
  win.focus();
}


//�����·��򿪴���
function openerlowerRightOpen(url)
{
  var win = opener.open(url, "right", "scrollbars=yes");
  win.focus();
}

//ռ������鿴ģ����������ʱ��ѡ��
function setcalendarpreviou()
{
	 this.document.forms[0].action="previou";
	 this.document.forms[0].submit();
}


//����ѡ������
function setselectoption(object)

{
  var index = object.selectedIndex;
  if(index==0)
  {
   document.forms[0].action.value = "firstoption";
  }
  else
  {
    document.forms[0].action.value = "otheroption";
  }
   object.condvalue=object.options[object.selectedIndex].text;

  document.forms[0].submit();
}


//������Աѡ����
function setconditionaction(name)
{
	 name.value='search';

	document.forms[0].submit();
}

//����ɾ����־
function deleteOperateLog()
{
  document.forms[0].deleteLogs.value='yes';
  if(window.confirm("�����Ҫ���һ����ǰ����־�𣿸ò������޷��ָ���"))
  {
    document.forms[0].submit();
  }
}

//��̳�˳�
function exitForum(obj1,obj2)
{
  obj1.value='exit';
  if(window.confirm(obj2))
  {
    document.forms[0].submit();
  }
}

function exitFrame(obj)
{
  if(window.confirm(obj))
  {
    window.parent.close();
  }
}
//�û��Ѵ���
function wrongUserMessageBox()
{
  alert("���û����Ѵ��ڣ�");
}
//��֯�Ѵ���
function wrongOrganizationMessageBox()
{
  alert("����֯�Ѵ��ڣ�");
}

function confirmOperate(obj)
{
  if(window.confirm(obj))
  {
    document.forms[0].submit();
    return true;
  }
  return false;
}

function cutUserAndRole(obj)
{
  if(window.confirm(obj))
  {
    document.forms[0].deleteid.value="userid";document.forms[0].submit();
  }
}
//����ҳ��selectedresult�������ֵ
function setSelected(result)
{
  document.forms[0].selectedresult.value=result;
}

//�����ļ��������ж��޸�ɾ���ļ���ʱ�Ƿ�ѡ�����ļ���,����û���û�и�Ŀ¼����ͬ�ⴴ��һ��
function readyToGo(url,where,how)
{
	var unexpand = top.contents.document.getElementsByTagName("unexpand").item(0);
	var expand = top.contents.document.getElementsByTagName("expand").item(0);
	var curexpand = top.contents.document.getElementsByTagName("curexpand").item(0);
	var leaf = top.contents.document.getElementsByTagName("leaf").item(0);
	var curunexpand = top.contents.document.getElementsByTagName("curunexpand").item(0);
	var curleaf = top.contents.document.getElementsByTagName("curleaf").item(0);
	//����и�Ŀ¼��
	if(expand || unexpand || curexpand || leaf || curunexpand || curleaf)
	{
		//�û�û��ѡ��Ҫ�������ļ���
		if(url.indexOf("nodeid")>=0 || url.indexOf("null")>=0)
		{
			alert("����ѡ���ļ���");
			return;
		}
		//ѡ����
		else
		{
			window.open(url,where,how);
			return;
		}

	}
	else //�޸�Ŀ¼
	{
		//����Ǵ���Ŀ¼��ͬ�ⴴ��
		if(url.indexOf("parentid")>=0)
		{
			window.open(url,where,how);
			return;
		}
		else
		{
			alert("���ȴ���һ����Ŀ¼");
			return;
		}
	}
}

function readyToDelete(url)
{
	if(url.indexOf("nodeid")>=0 || url.indexOf("null")>=0)
	{
		alert("����ѡ��Ҫɾ�����ļ���");
		return;
	}
	else
	{
		if(confirm("                ------- ����  -------                "+"\r\n\r\n"+
		           "ִ�иò����Ὣ���ļ�������ɾ����"+"\r\n\r\n"+
				   "��ȷ����������"))
		{
			window.open(url,"_blank","toolbar=no,menubar=no,location=center,top=0,left=0,width=1,height=2");
		}
	}
}

// �ж��б���n�У���n���Ƿ�����
function numberListCheck(f)
{
  var size=0;
  for(var i = 0; i < f.length; i++)
  {
    if(f.elements(i).type == "text")
    {
      size++;
    }
  }
  var str;
  for(var i = 0; i < f.length; i++)
  {
    if(f.elements(i).type == "text")
    {
      str = f.elements(i).value;
      if(!isNumber(str))
      {
        alert("���������֣�");
        f.elements(i).value = "";
        f.elements(i).focus();
        return;
      }
      else
      {
        if(str.charAt(0)=='0'||str.charAt(0)=='-')
        {
          alert("����������ֲ��Ϸ���");
          f.elements(i).value = "";
          f.elements(i).focus();
          return;
        }
      }
     if(str-size>0)
     {
       alert("�����������̫��");
       f.elements(i).focus();
       return;
      }
    }
  }
  f.submit();
}

//�ж��ǲ����ֻ������б�
function isMobileNumberList(str)
{
    var arrayList = str.split(",");
	for(i=0;i<arrayList.length;i++)
	{
		var phoneNumber = arrayList[i];
		//��������ֻ�����
		if(!(phoneNumber.length==11/* && phoneNumber.indexOf("13")==0*/))
		{
			return false;
		}
	}
	return true;
}

function setHelpFolder(obj)
{
  if(obj.style.display=="none")
  {
    obj.style.display="block";
  }
  else
  {
    obj.style.display="none";
  }
}

//ѯ���û��Ƿ�ȷ��ɾ��( �ʼ�����ɾ��ʹ��)
function confirmDeleteMail(comid)
{
  var elements = document.forms[0].elements;
  for(var i = 0;i<elements.length;i++)
  {
    var e = elements[i];
    if(e.name==comid.value)
    {
      if(e.value!="")
      {
        if(window.confirm("�����Ҫɾ����ѡ�ļ�¼��ɾ�����޷��ָ���"))
        {
          document.forms[0].action.value="deletedmail";
          document.forms[0].submit();
        }
      }
      else
      {
        alert("����ѡ����Ҫɾ���ļ�¼���ٽ���ɾ����");
      }
    }
  }
 }

 //����ģ��ʹ�ã�����ѡ���ģ������ҳ���ϵ��ϴ�������ͼƬ��ť



 function setButtons(sele)
 {
 	//�õ�ѡ�е�ģ����
	if(sele != null)
	{
 	 var a = sele.options[sele.selectedIndex].text
	}
	//����ǲ���������
  	if(a != null && a.indexOf('����') > 0)
  	{
	 document.forms[0].attachment.style.display = "block";

  	}
	//������
	else
	{

	    //ɾ��������ť
	    document.forms[0].attachment.style.display = "none";
	}
	//����ǲ���ͼƬ��
  	if(a != null&&a.indexOf('ͼƬ') >  0)
  	{
	 	//ɾ��ͼƬ��ť
        document.forms[0].addimage.style.display = "block";
	}
	//����Ǵ�ͼƬ��
	else
	{
	    //ɾ��ͼƬ��ť
        document.forms[0].addimage.style.display = "none";


	}
 }


//��ݹ���������ʹ�ã����ѡ��Ĺ��߸����Ƿ񳬹��������
function checkmaxnumber()
{
var number  = 0;
  for(var i = 0; i < document.forms[0].elements.length; i++)
  {
    var element = document.forms[0].elements[i];
    if(element.type == "checkbox" )
    {
       if(element.checked == true)
         {
		 number= number + 1;
      }
    }
  }
  if(number > 6)
  {
   alert("��ݹ������Ϊ������");
   return;
  }
  else
  {
    document.forms[0].action.value='goto';
    document.forms[0].reallysubmit.value="reall";
    document.forms[0].submit();
  }

}
function checkDocumentName()
{
if(document.forms[0].filename.value!=""&&document.forms[0].name.value!="")
{
document.forms[0].action.value="confirm";
document.forms[0].submit();
}
else
{
alert("ģ�������ϴ�·��������Ϊ�ա�");
}
}

// ����󻯷�ʽ�򿪴�����������ַ���Ĵ���
function openMaxUrlWindow(url)
{
  var height = screen.availHeight;
  if(screen.availHeight == screen.height)
  {
     height -= 50;
  }
  var win = window.open(url, "_top");
  win.moveTo(0, 0);
  win.resizeTo(screen.availWidth, height);
  win.focus();
}

//���ã�����iWebOffice
function load(web_url,record_id,file_name,file_type,user_name,edit_type,show_type,template_name,form_name){
	

  //�������Ա������ã�ʵʼ��iWebOffice
  form_name.weboffice.WebUrl=web_url;    //WebUrl:ϵͳ������·������������ļ������������籣�桢���ĵ�����Ҫ�ļ�
  form_name.weboffice.RecordID=record_id; //RecordID:���ĵ���¼���
  form_name.weboffice.FileName=file_name;   //FileName:�ĵ�����
  form_name.weboffice.Template=template_name;   //Template:ģ����
  form_name.weboffice.FileType=file_type;   //FileType:�ĵ�����  .doc  .xls  .wps
  form_name.weboffice.UserName=user_name;  //UserName:�����û������ۼ�������Ҫ
  form_name.weboffice.EditType=edit_type;  //EditType:�༭����  ��ʽһ����ʽ��  <�ο������ĵ�>                                     //�ڶ�λ����Ϊ0,1 ����:0������ע,1������ע�����Բο�iWebOffice2006��EditType���ԣ���ϸ�ο�������Ƥ��
  form_name.weboffice.ShowType=show_type;          //�ĵ���ʾ��ʽ  1:��ʾ������ע  2:��ʾ��д��ע  0:��ʾ�ĵ��˸�
  // form_name.weboffice.WebLoadTemplate();  	 //�򿪸��ĵ�    ����OfficeServer  �����ĵ�OPTION="LOADFILE"    ����ģ��   OPTION="LOADTEMPLATE"     <�ο������ĵ�>
 }


function   multiplication(obj1,obj2,obj3)
{
	var value1 = obj1.value;
	var value2 = obj2.value;
	if(value1 == null  || value1 == "")
	{
		value1 = 0;
	}
	if(value2 == null || value2=="")
	{
		value2 = 0;
	}
	var sum = parseFloat(value1) * parseInt(value2);
	obj3.value = sum;
}

//������Ŀ ���������Ƿ������֣�����������
function checkAndSum(obj1,obj2,obj3)
{
	if(!isNum(obj1.value))
	{
		alert("����������");
		obj1.focus();
		return false;
		
	}
	multiplication(obj1,obj2,obj3);
}



//������Ŀ ���obj1����ֵ�Ƿ� ������  obj2����ֵ
function checkMaxNumber(obj1,obj2)
{
	 var value1 = parseFloat(obj1.value);
	 if(value1 <=0)
	 {
	 	alert("���������������0");
	    return false;
	 }
	 var value2 = parseFloat(obj2.value);
	 if(value1 > value2)
	 {
	 	alert("������������Ϊ: " + value2);
	 	obj1.focus();
	 	obj1.value = value2;
	 	return false;
	}
	return true;
}




//���Ĭ�����������Ƿ�������ͬ������
function checkInputSameNumber(elem)
{
  //�õ�����Ԫ�ص����ƺ�����ֵ
  var elemName = elem.name;
  var elemValue = elem.value;
  //��֤�Ƿ�����������
  for(var i = 0; i < document.forms[0].elements.length; i++)
  {
    var element = document.forms[0].elements[i];
    if(element.type == "text"  && element.name != elemName)
    {
      var va = element.value;
      if(elemValue == va)
      {
       elem.focus();
        //�������ظ�
        alert('���������ظ���ֵ!');
        return ;
      }
    }
  }
}



function todocedit()
{
  
  var templatefilename = document.forms[0].templateFileName.value;
  var parentid = document.forms[0].parentid.value;
  url = "docedit.jsp?parentid="+parentid+"&amp;templateFileName="+templatefilename+   "&amp;sub=confirm";
  window.open(url,'_blank','status=no,toolbar=no,menubar=no,location=no,top=0,left=0,width=1015,height=768');
}
//�߰�
function cuiban()
{
var ids=document.getElementById("result").value;
if(ids=="")
{
  alert("����ѡ����Ȼ���ٽ��д߰졣");
  return;
}
if(ids.indexOf(",")!=-1)
{
  alert("һ�β���ֻ�ܶ�һ������д߰졣");
  return;
}
window.open("page.jsp?ids="+ids+"&amp;templatename=�ް�����ѡ��ģ��","_blank","toolbar=no,menubar=no,location=center,top=200,left=260,width=495,height=309");
}
/**
 * �ж������һ�������Ƿ��ظ�
 */
function isRepeat(r){
	var ele =r.elements;
	for(var i = 0; i < ele.length - 1; i++){
		for(var j = i+1; j < ele.length; j++){
			if(ele[i].value == ele[j].value){
				alert("��Ų����ظ�");
				return true;
			}else if(i == ele.length-2){
				return false;
			}
		}
	}
}
/**
 * �ж��������Ƿ���ͬ
 */
function isSameness(p1,p2){
	if(p1 == p2){
		return true;
	}
	alert("���������ֵ��һ�£�");
	return false;
}


/**
 * ���Ԫ�ص�ֵ�ĳ����Ƿ���ڲ���
 */
function checklength(f){
	var ele = f.elements;
  var tip = "";
  for(var i = 0; i < ele.length; i++)
  {
    if(ele[i].limitlen != null && ele[i].limitlen > 0 )
    { 
     var len = ele[i].limitlen;
      if(ele[i].value.length != len)
      {
        tip +=  ele[i].cname +"����Ϊ" + len + "λ! ";
      }
    }
  }
  
  if(tip!="")
  {
    alert(tip);
    return false;
  }
  else
  {
    return true;
  }
}


/**
*���Ϲ黹�ύ
*/
function datumreturn(datumid)
{
   var id = datumid;
  if(window.confirm("�Ƿ�黹��"))
  {
    document.forms[0].returnid.value = id;
    document.forms[0].action.value='return';
    document.forms[0].submit();
  }
}
