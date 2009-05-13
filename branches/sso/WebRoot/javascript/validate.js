/******************************************************    
FileName:jsLibrary.js
Copyright  (c)  2003-xxxx *********��˾����������
Writer:Nick
create Date:2004-12-28
Rewriter:
Rewrite Date:
Impact:
******************************************************/

/*
==================================================================
����������
���ܣ�����Ƿ�Ҫ��ʾ��ʾ����
==================================================================
*/
function IfShow(ShowMsg){
	if (ShowMsg == "" || ShowMsg == null){
		return false;
	} else {
		return true;
	}
}


/*
==================================================================
���ܣ��滻�ո񣨽���������ո��滻Ϊһ���ո�
ʹ�ã�ReplaceSpace(obj) 
���أ�string
==================================================================
*/
function ReplaceSpace(str){ 
	while ( str.indexOf("  ") >= 0 ) {
		str = str.replace("  " ," ");
	}
	return str;
}

/*
==================================================================
���ܣ��ǿռ�飬�����Կո�
��ʾ��Ϣ�������Ϊ�գ������룡
ʹ�ã�isNull(obj,string) 
���أ�bool
==================================================================
*/
function isNull(obj,ShowMsg) {
	var show = IfShow(ShowMsg) ;

	//�ǿռ��
	if(obj.value == "") {
		if (show) alert(ShowMsg);
		//obj.focus();
		obj.select();  
		return false;
	} else {
		return true;
	}
}

/*
==================================================================
���ܣ������ַ���
��ʾ��Ϣ��δ�����ʼ���ַ���ʼ���ַ��Ч��
ʹ�ã�MailCheck(obj,string)
���أ�bool
==================================================================
*/
function MailCheck(obj,ShowMsg){
	var show = IfShow(ShowMsg) ;
 
	var strr;
	re=/([A-Za-z0-9_.]+@\w+\.\w+)(\.{0,1}\w*)(\.{0,1}\w*)/i;
	re.exec(obj.value);
	if (RegExp.$3!=""&&RegExp.$3!="."&&RegExp.$2!=".") {
		strr=RegExp.$1+RegExp.$2+RegExp.$3;
	} else if (RegExp.$2!=""&&RegExp.$2!=".") {
		strr=RegExp.$1+RegExp.$2;
	} else {
		strr=RegExp.$1;
	}

	if (strr!=obj.value) {
		if(show) alert(ShowMsg);
		obj.focus();
		obj.select();
		return false;
	}
	
	
	return true;

}

/*
==================================================================
���ܣ����������Ƿ�Ϊ����
��ʾ��Ϣ��δ���������Ĳ���һ���Ϸ������֣�
ʹ�ã�isNumeric(obj,string)
���أ�bool
==================================================================
*/
function isNumeric(obj,ShowMsg){ 
	var show = IfShow(ShowMsg) ;
	
	var IfTrue = obj.value.search(/^(-|\+)?\d+(\.\d+)?$/) != -1;

	if (IfTrue ==true) { 
		if(show) alert(ShowMsg);
		obj.focus();
		obj.select();
		return true;
	} else {
		return false;
	}
} 

/*
==================================================================
���ܣ���ӡ
ʹ�ã�Print()
���أ�
==================================================================
*/
function Print(){
	document.all.print.style.display = "none";
	window.print();
	window.close();
}

/*
==================================================================
���ܣ��ж��Ƿ�Ϊ����(��ʽ:yyyy-mm-dd)
��ʾ��Ϣ��δ�������������ڸ�ʽ����
ʹ�ã�isDate(obj,string)
���أ�bool
==================================================================
*/
function isDate(obj,ShowMsg){
	var show = IfShow(ShowMsg) ;
 
	if(obj.value==null){
		if (show) alert(ShowMsg);
		return false;
	}
 
    if(obj.value==""){
		if (show) alert(ShowMsg);
		return false;
	}
    
    var datePat=/^(\d{2}|\d{4})(\-)(\d{1,2})(\-)(\d{1,2})$/;
    
    var dateStr=obj.value;
    // is the format ok?
	var matchArray = dateStr.match(datePat); 


    if (matchArray==null){
		if (show) alert(ShowMsg);
        return false;
    }
    year=matchArray[1];
    month=matchArray[3];
    day=matchArray[5];

    if (year.length!=4 || month.length!=2 || day.length!=2){
		if (show) alert(ShowMsg);
        return false;
    }
    if (month < 1 || month > 12){
		if (show) alert(ShowMsg);
        return false;
    }
    if (day < 1 || day > 31){
		if (show) alert(ShowMsg);
        return false;
    }

    if ((month==4 || month==6 || month==9 || month==11) && day==31){
		if (show) alert(ShowMsg);
        return false;
    }

    if (month==2){
        var isleap=(year % 4==0 && (year % 100 !=0 || year % 400==0));
        if (day>29 || ((day==29) && (!isleap))){
			if (show) alert(ShowMsg);
            return false;
        }
    }
    return true;
}

/*
==================================================================
���ܣ����ڴ�С�ж�(��ʽ��yyyy-mm-dd)
��ʾ��Ϣ��δ���������Ŀ�ʼ���ڴ��ڽ������ڣ�
ʹ�ã�JudgeDate(obj1,obj2,string)
���أ�bool
==================================================================
*/
function JudgeDate(obj1,obj2,ShowMsg){
	var show = IfShow(ShowMsg) ;
 
	var eva = isDate(obj1,"") && isDate(obj2,"");
 
    if(obj1.value!="" && obj2.value!="" & eva != false){
		var date1 = obj1.value;
        var myDate1 = Date.parse(date1.replace("-","/"));
        var date2 = obj2.value;
        var myDate2 = Date.parse(date2.replace("-","/"));
        if(myDate1 > myDate2){
            if (show) alert(ShowMsg);
            return false;
        }else{
			return true;
        }
    }else{
		if (show) alert(ShowMsg);
		return false;
    }
}

/*
==================================================================
���ܣ��ַ�������,ȥ���ַ������ߵĿո�
ʹ�ã�Trim(string)
���أ�string
==================================================================
*/                                
            /*
            ==================================================================
            ���ܣ�ȥ����ߵĿո�
            ʹ�ã�LTrim(string)
   ���أ�string
            ==================================================================
            */
            function LTrim(str)
            {
                var whitespace = new String(" \t\n\r");
                var s = new String(str);
                
                if (whitespace.indexOf(s.charAt(0)) != -1)
                {
                    var j=0, i = s.length;
                    while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
                    {
                        j++;
                    }
                    s = s.substring(j, i);
                }
                return s;
            }
             
            /*
            ==================================================================
            ���ܣ�ȥ���ұߵĿո�
            ʹ�ã�RTrim(string)
   ���أ�string
            ==================================================================
            */
            function RTrim(str)
            {
                var whitespace = new String(" \t\n\r");
                var s = new String(str);
             
                if (whitespace.indexOf(s.charAt(s.length-1)) != -1)
                {
                    var i = s.length - 1;
                    while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
                    {
                        i--;
                    }
                    s = s.substring(0, i+1);
                }
                return s;
            }
            
//ȥ��ǰ��ո�            
function Trim(str)
{
    return RTrim(LTrim(str));
}             


/*
==================================================================
���ܣ���Ч�ַ��ļ�⣨���������������ַ���
��ʾ��Ϣ��δ�������������Ƿ��ַ�
ʹ�ã�CheckChar(obj,Lchar,string)
   Lchar��Ҫ���������ַ�
���أ�bool
==================================================================
*/
function CheckChar(obj,Lchar,ShowMsg)
{
 var show = IfShow(ShowMsg);

 var strlist = "";
 if(null != Lchar && Lchar != "") {
	strlist = Lchar; //"~!@#$%^&*?<>\"\'";
 } else {
	strlist = "~!@#$%^&*?<>\"\'";
 }
 
 //��Ч�ַ��ļ�� 
 if(obj.value!= "")
 {  
  var tmpbool=true;
  for (i=0;i<obj.value.length;i++)
  {
   if(strlist.indexOf(obj.value.substr(i,1))!=-1)
   {
    tmpbool=false;
    break;
   }
   else
   {}
  }
  
  if(tmpbool==false)
  {
   if (show) alert(ShowMsg + strlist);
   obj.focus();
   obj.select();
   return false;
  }
  else
  {
   return true;
  }
 }
 else
 {
  if (show) alert(ShowMsg + strlist);
  return false;
 }
  
}

/*
==================================================================
���ܣ��ж��Ƿ�Ϊ����������������������������+0��������+0
��ʾ��Ϣ���������������Ĳ���һ��������������
ʹ�ã�isInt(obj,string,int or string,string)
     (���Զ���,+ or - or empty,empty or 0,��ʾ��Ϣ)
     ��  ����
     +   ������
     -   ������
���أ�bool
==================================================================
*/
function isInt(obj,sign,zero,ShowMsg)
{
 var show = IfShow(ShowMsg);
 
 var objStr = obj.value;
    var reg;    
    var bolzero;    
    
    if(Trim(objStr)=="")
    {  
  if (show) alert(ShowMsg);
  obj.focus();
  obj.select();
        return false;
    }
    else
    {
        objStr=objStr.toString();
    }    
    
    if((sign==null)||(Trim(sign)==""))
    {
        sign="+-";
    }
    
    if((zero==null)||(Trim(zero)==""))
    {
        bolzero=false;
    }
    else
    {
        zero=zero.toString();
        if(zero==0)
        {
            bolzero=true;
        }
        else
        {
            if (show) alert(ShowMsg);
            obj.focus();
   obj.select();
            return false;
        }
    }
    
    switch(sign)
    {
        case "+-":
            //����
            reg=/(^-?|^\+?)\d+$/;            
            break;
        case "+": 
            if(!bolzero)           
            {
                //������
                reg=/^\+?[0-9]*[1-9][0-9]*$/;
            }
            else
            {
                //������+0
                //reg=/^\+?\d+$/;
                reg=/^\+?[0-9]*[0-9][0-9]*$/;
            }
            break;
        case "-":
            if(!bolzero)
            {
                //������
                reg=/^-[0-9]*[1-9][0-9]*$/;
            }
            else
            {
                //������+0
                //reg=/^-\d+$/;
                reg=/^-[0-9]*[0-9][0-9]*$/;
            }            
            break;
        default:
            if (show) alert(ShowMsg);
            obj.focus();
   obj.select();
            return false;
            break;
    }
    
    var r=objStr.match(reg);
    if(r==null)
    {
  if (show) alert(ShowMsg);
  obj.focus();
  obj.select();
        return false;
    }
    else
    {    
        return true;     
    }
}
/*
==================================================================
���ܣ��ж��Ƿ�Ϊ������������������������������������+0����������+0     
��ʾ��Ϣ���������������Ĳ���һ����������������
ʹ�ã�isFloat(obj,string,int or string,string)
       (���Զ���,+ or - or empty,empty or 0,��ʾ��Ϣ)
��������       
     ��  ������
     +   ��������
     -   ��������
���أ�bool
==================================================================
*/
function isFloat(obj,sign,zero,ShowMsg) 
{
 var show = IfShow(ShowMsg);
 
 var objStr = obj.value;
    var reg;    
    var bolzero;    
    
    if(Trim(objStr)=="")
    {
  if (show) alert(ShowMsg);
  obj.focus();
  obj.select();
        return false;
    }
    else
    {
        objStr=objStr.toString();
    }    
    
    if((sign==null)||(Trim(sign)==""))
    {
        sign="+-";
    }
    
    if((zero==null)||(Trim(zero)==""))
    {
        bolzero=false;
    }
    else
    {
        zero=zero.toString();
        if(zero==0)
        {
            bolzero=true;
        }
        else
        {
            if (show) alert(ShowMsg);
            obj.focus();
  obj.select();
            return false;
        }
    }
    
    switch(sign)
    {
        case "+-":
            //������
            reg=/^((-?|\+?)\d+)(\.\d+)?$/;
            break;
        case "+": 
            if(!bolzero)           
            {
                //��������                
    reg=/^\+?(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            }
            else
            {
                //��������+0
                reg=/^\+?\d+(\.\d+)?$/;
            }
            break;
        case "-":
            if(!bolzero)
            {
                //��������                
    reg=/^-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            }
            else
            {
                //��������+0
                reg=/^((-\d+(\.\d+)?)|(0+(\.0+)?))$/;
            }            
            break;
        default:
            if (show) alert(ShowMsg);
            obj.focus();
  obj.select();
            return false;
            break;
    }
    
    var r=objStr.match(reg);
    if(r==null)
    {
  if (show) alert(ShowMsg);
  obj.focus();
  obj.select();
        return false;
    }
    else
    {        
        return true;     
    }
}


/*
==================================================================
���ܣ���֤���֤�����Ƿ���Ч
��ʾ��Ϣ��δ������������֤�Ų���ȷ��
ʹ�ã�isIDno(obj,string)
���أ�bool
==================================================================
*/
function isIDno(obj,ShowMsg)
{
 var show = IfShow(ShowMsg);
 
 //aCity={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"};
 var aCity = "11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91"
 
 var iSum = 0;
 var info = "";
 var idCardLength = obj.value.length;

 if(!/^\d{17}(\d|x)$/i.test(obj.value)&&!/^\d{15}$/i.test(obj.value)) 
 {
  if (show) alert(ShowMsg);
  obj.focus();
  obj.select();
  return false;
 }
 
 //�ں����������x�൱������10,����ת����a
 obj.value = obj.value.replace(/x$/i,"a");
 
 var curCity = obj.value.substr(0,2);

 if(!(aCity.indexOf(curCity) > 0) )
 {
  if (show) alert(ShowMsg);
  obj.focus();
  obj.select();
  return false;
 }

 if (idCardLength==18)
 {
  sBirthday=obj.value.substr(6,4)+"-"+Number(obj.value.substr(10,2))+"-"+Number(obj.value.substr(12,2));
  var d = new Date(sBirthday.replace(/-/g,"/"))
  if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))
  {
   if (show) 
    alert(ShowMsg);
   obj.focus();
   obj.select();
   return false;
  }
 
  for(var i = 17;i>=0;i --)
  iSum += (Math.pow(2,i) % 11) * parseInt(obj.value.charAt(17 - i),11);
 
  if(iSum%11!=1)
  {
   if (show) 
    alert(ShowMsg);
   obj.focus();
   obj.select();
   return false;
  }
 
 }
 else if (idCardLength==15)
 {
  sBirthday = "19" + obj.value.substr(6,2) + "-" + Number(obj.value.substr(8,2)) + "-" + Number(obj.value.substr(10,2));
  var d = new Date(sBirthday.replace(/-/g,"/"))
  var dd = d.getFullYear().toString() + "-" + (d.getMonth()+1) + "-" + d.getDate();

  if(sBirthday != dd)
  {   
   if (show) 
    alert(ShowMsg);
   obj.focus();
   obj.select();
   return false;
  }
 }
 return true; 
} 


/*
==================================================================
���ܣ���֤�绰�����ʽ�Ƿ���ȷ
��ʾ��Ϣ��δ���������绰�����ʽ����ȷ��
ʹ�ã�isPhoneNo(obj,string)
���أ�bool
==================================================================
*/
function isPhoneNo(obj,ShowMsg)
{
 var show = IfShow(ShowMsg);
 
 var phoneNo = obj.value;
 var Endvalue = true;
 var allowstrlist = "1234567890()-";
 if(phoneNo!="")
 {   
  for (i=0;i<phoneNo.length;i++) 
  {
    if (allowstrlist.indexOf(phoneNo.substr(i,1)) == -1) 
    {
   Endvalue = false;   
   break;
    }
  }
  if(Endvalue == false)
  {
   if (show) 
    alert(ShowMsg);
   obj.focus();
   obj.select();
   return false;
  }
 }
 else
 {
  if (show) 
    alert(ShowMsg);
  obj.focus();
  obj.select();
  return false;
 }
 return true;
} 

/*
==================================================================
���ܣ������Сдת���ɺ��ִ�д
��ʾ��Ϣ��
ʹ�ã�MoneyToUpper('��,Ҽ,��,��,��,��,½,��,��,��,','Ԫ,ʰ,��,Ǫ,��,ʰ,��,Ǫ,��,ʰ,��,��,��,����,����,����,����,��Ԫ,���,���,',obj.value)
���أ�string 
str1 = "��,Ҽ,��,��,��,��,½,��,��,��,"
str2 = "Ԫ,ʰ,��,Ǫ,��,ʰ,��,Ǫ,��,ʰ,��,��,��,����,����,����,����,��Ԫ,���,���,"
==================================================================
*/
function MoneyToUpper(str1,str2,Num)
{
    var charList1 = str1.split(",");
    var charList2 = str2.split(",");
   
 for( i = Num.length-1;i>=0;i--)
 {
  //�滻tomoney()�еġ�,��
  Num = Num.replace(",","")
  //�滻tomoney()�еĿո�
  Num = Num.replace(" ","")
 }
 
 //�滻�����ܳ��ֵģ��ַ�
 Num = Num.replace("��","")
 //��֤������ַ��Ƿ�Ϊ����
 if(isNaN(Num)) 
 {
  alert("Error: Not a Number !");
  return "";
 }
 
   //---�ַ�������ϣ���ʼת����ת������ǰ�������ֱַ�ת��---
   var part = String(Num).split(".");
   var newchar = "";   
   //С����ǰ����ת��
 for(i = part[0].length - 1; i>= 0 ; i--)
 {
  //����������ʰ�ڵ�λ����ʾ
  if(part[0].length > 10)
  { 
   alert("Error Over Max Length !");
   return "";
  }
  var tmpnewchar = "";
  
  var perchar = part[0].charAt(i);
     
  tmpnewchar= charList1[perchar] + tmpnewchar;
  
  var indx = part[0].length-i-1;
  if (indx == 0 || indx == 4 || indx == 8 || indx == 9)
  {
   tmpnewchar = tmpnewchar + charList2[indx];
  }
  else
  {
   if(perchar!=0) tmpnewchar = tmpnewchar + charList2[indx];
  }
  newchar = tmpnewchar + newchar;
      
 } 

 //С����֮�����ת��
    if( String(Num).indexOf(".") != -1)
    {
  if(part[1].length > 2) 
  {
   part[1] = part[1].substr(0,2);
  }
  for(i=0;i<part[1].length;i++)
  {
   tmpnewchar = ""
   perchar = part[1].charAt(i)
       
   tmpnewchar = charList1[perchar] + tmpnewchar;              
   if(i==0)tmpnewchar =tmpnewchar + charList2[10];  //��
   if(i==1)tmpnewchar = tmpnewchar + charList2[11]; //��
   newchar = newchar + tmpnewchar;
  } 
     
 }    
  
 //alert(newchar);

 //�滻 ���� Ϊ ��
 while(newchar.search(charList2[13]) != -1)
 {
  newchar = newchar.replace(charList2[13], charList1[0]);  //���� to ��
  newchar = newchar.replace(charList2[14], charList2[8]);  //"����" to "��"
  newchar = newchar.replace(charList2[15], charList2[8]);  //"����" to "��"
 
  newchar = newchar.replace(charList2[16], charList2[4]);  //"����" to "��"
  newchar = newchar.replace(charList2[17], charList2[0]);  //"��Ԫ" to "Ԫ"
  newchar = newchar.replace(charList2[18], "");    //"���" to ""
  newchar = newchar.replace(charList2[19], "");    //"���" to ""   
 }
 
  newchar = newchar.replace(charList2[14], charList2[8]);  //"����" to "��"
  newchar = newchar.replace(charList2[15], charList2[8]);  //"����" to "��"
 
  newchar = newchar.replace(charList2[16], charList2[4]);  //"����" to "��"
  newchar = newchar.replace(charList2[17], charList2[0]);  //"��Ԫ" to "Ԫ"
  newchar = newchar.replace(charList2[18], "");    //"���" to ""
  newchar = newchar.replace(charList2[19], "");    //"���" to "" 

 newchar = newchar + charList2[12]; 

    //0.6Ԫ�����
 if(newchar.indexOf(charList2[0]) == 0)
  newchar = newchar.replace(charList2[0],"");
 
 return newchar;
}

/*
	��󳤶�У��
*/
function maxLength(obj, maxlength, ShowMsg){
	var show = IfShow(ShowMsg);
	//alert(obj.value.length);
	if(obj.value.length > maxlength) {
		if (show) alert(ShowMsg);
		obj.focus();
		return false;
	} else {
		return true;
	}
}

/*
	��С����У��
*/
function minLength(obj, minlength, ShowMsg){
	var show = IfShow(ShowMsg);
	
	if(obj.value.length < minlength) {
		if (show) alert(ShowMsg);
		obj.focus();
		return false;
	} else {
		return true;
	}
}

/*
	CheckBox��ѡ�еĸ���
	checkBoxName:��Ҫ�жϵ�checkbox���name
*/
function checkedNum(checkBoxName){
	var obj = document.all.tags("input");
	var checkNum = 0;

	var flag = IfShow(checkBoxName);
	for(i=0;i<obj.length;i++){
		if(obj[i].type == "checkbox" && obj[i].checked ==true){
			if(!flag || (obj[i].name == checkBoxName && obj[i].value != "")) {
				checkNum++;
			}
		}
	}

	return checkNum;
}