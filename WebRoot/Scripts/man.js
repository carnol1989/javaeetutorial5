function Hashtable()
{
    this._hash = new Object();  // ����Object����
    //��ϣ�����ӷ���
    this.add = function(key,value){
                if(typeof(key)!="undefined"){
                    if(this.contains(key)==false){
                          this._hash[key]=value;
                          return true;
                    } else {
                           return false;
                    }
                } else {
                          return false;
                }
            }
    //��ϣ����Ƴ�����
    this.remove = function(key){delete this._hash[key];}
    //��ϣ���ڲ���������
    this.count = function(){var i=0;for(var k in this._hash){i++;} return i;}
   //ͨ����ֵ��ȡ��ϣ���ֵ
    this.items = function(key){return this._hash[key];}
    //�ڹ�ϣ�����ж�ĳ��ֵ�Ƿ����
    this.contains  = function(key){ return typeof(this._hash[key])!="undefined";}
    //��չ�ϣ�����ݵķ���
    this.clear = function(){for(var k in this._hash){delete this._hash[k];}}

}
function chageDiv()//����ҳ������
{
	
if(confirm("���浱ǰҳ������"))
	{
		var i=0;
		var j=0;
		var myid_id;
		var element_id;
		var element_name;
		var element_content;
		var element_color;
		var fly;
		
		for(;j<4;j++)
		{	
			fly=document.all("myID"+(j+1)).getElementsByTagName("table");//�õ�myID1�е�����table����
			for(;i<fly.length;i++)
			{
				myid_id="myID"+(j+1).toString();//myid���
				//form2.element_id.value=fly[i].getAttribute("id");//Ԫ�ر��
				element_id=fly[i].getAttribute("id");//Ԫ�ر��
				//form2.element_name.value=fly[i].childNodes[0].childNodes[0].innerText;//Ԫ������
				element_name=fly[i].childNodes[0].childNodes[0].innerText;//Ԫ������
				//form2.element_content.value=fly[i].childNodes[0].childNodes[1].innerHTML;//Ԫ������
				element_content=fly[i].childNodes[0].childNodes[1].innerHTML;//Ԫ������
				//form2.element_color.value=fly[i].childNodes[0].childNodes[0].childNodes[0].getAttribute("bgColor");//Ԫ�ر���ɫ
				element_color=fly[i].childNodes[0].childNodes[0].childNodes[0].getAttribute("bgColor");//Ԫ�ر���ɫ
				form1("div"+(j+1)).value+=myid_id+"@"+element_id+"^";
			}
			i=0;
			location.href=location.href;
		}
		form1.submit();
	}
}
function openpan(a,b,c)//����ģʽ���ڣ�aΪhash���飬���ڸĽ���bΪҳ���Ѵ��ڵ�flyid��
{	
	//alert(a['fly10']);//Ӧ�Ľ�Ϊ���鴫�ݣ�����ʵ��  
    var url="_pan.jsp?fly_id="+b+"&user_id="+c;
    //��ģʽ���ڣ�ע��ģʽ���ڵ���
    var mydata=showModalDialog(url,null,"dialogWidth:400px;dialogHeight:190px;center:yes;help:No;status:no;resizable:No;edge:no");
	if(mydata)
	{
		var flyl=mydata.value.split("^");
		//alert(flyl[0]);
		//alert(flyl[1]);
		var flyid=flyl[0].split("@");//�򹴵�flyid��
		var flyid2=flyl[1].split("@");//���򹴵�flyid��
		for(m=0;m<flyid2.length-1;m++)//�Ƴ����򹴵ĵ�Ԫ
		{
			//alert(flyid2[m]);
			if(document.getElementById(flyid2[m])!=null)//����õ�Ԫ��ҳ�����Ѵ��ڣ����Ƴ����������κβ���
			{
			remove_element(flyid2[m]);
			}
			else
			{
			}
		}
		for(i=0;i<flyid.length-1;i++)//��Ӵ򹴵ĵ�Ԫ
		{	
			//alert(flyid[i]);
			//var fly_object=document.getElementById(flyid[i]);
			if(document.getElementById(flyid[i])!=null)//����õ�Ԫ��ҳ�����Ѵ����򣬲����κβ�����������Ӹõ�Ԫ
			{
			//var fly_object=document.getElementById(flyid[i]);
			//var fly_parent=fly_object.parentNode.id;
			//document.getElementById(fly_parent).removeChild(fly_object);//��ʱ�Ǵ򹴵��Ƴ�������Ҫ����
			}
			else
			{
			/*if ( flyid[i] in hash)//Ӧ�Ľ�Ϊ���鴫�ݣ�����ʵ��
				{   
					alert('key is: ' + flyid[i] + ', value is: ' + hash[i]);   
				}*/
				append_element(flyid[i]);
			}
		}
	chageDiv();
	}
	
}
function locate()//ҳ���Ű����
{
	var m;
	var x;
	var y;
	var i;
	var j;
	var m1=document.getElementById("myID1").childNodes.length;
	var m2=document.getElementById("myID2").childNodes.length;
	var m3=document.getElementById("myID3").childNodes.length;
	var m4=document.getElementById("myID4").childNodes.length;
	if(m1<=m2)
	{
	x=m1;
	i="myID1";
	}
	else
	{
	x=m2;
	i="myID2";
	}
	if(m3<=m4)
	{
	y=m3;
	j="myID3";
	}
	else
	{
	y=m4;
	j="myID4";
	}
	if(x<=y)
	{
	m=i;
	}
	else
	{
	m=j;	
	}
	return(m);
}
function append_element(flyid)
{
		var lo=locate();//�ҵ�����ʵ�λ�÷ŵ�Ԫ
		//alert(lo);
		if(flyid=="fly1")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly1\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#A7C7E4\" >��������̬</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#EEFAFF\"><img src=\"image/pic1.jpg\" width=\"203\" height=\"119\" /><br/><br/><iframe src=\"1.htm\" frameborder=\"0\" width=\"100%\" height=\"80\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly2")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly2\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#A7C7E4\" >����������</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#EEFAFF\"><iframe src=\"2.htm\" frameborder=\"0\" width=\"100%\" height=\"214\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly3")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly3\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#A7C7E4\" >����ȫͨ��</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#EEFAFF\"><iframe src=\"3.htm\" frameborder=\"0\" width=\"100%\" height=\"214\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly4")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly4\"><tr class=\"dragTR\"><td height=\"22\" align=\"left\" bgcolor=\"#C7C0EB\" >����λԤ��</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#eeecfb\"><iframe src=\"4.htm\" frameborder=\"0\" width=\"100%\" height=\"213\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly5")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly5\"><tr class=\"dragTR\"><td height=\"22\" align=\"left\" bgcolor=\"#C7C0EB\" >��ʵʱ��λ</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#eeecfb\"><iframe src=\"5.htm\" frameborder=\"0\" width=\"100%\" height=\"214\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly6")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly6\"><tr class=\"dragTR\"><td height=\"22\" align=\"left\" bgcolor=\"#C7C0EB\" >���ںӳ�λ</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#eeecfb\"><iframe src=\"6.htm\" frameborder=\"0\" width=\"100%\" height=\"214\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly7")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly7\"><tr class=\"dragTR\"><td height=\"22\" align=\"left\" bgcolor=\"#eadfd6\" >����ѴԤ��</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"7.htm\" frameborder=\"0\" width=\"100%\" height=\"213\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly8")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly8\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#EADFD6\" >�����ֽ���λԤ��</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"8.htm\" frameborder=\"0\" width=\"100%\" height=\"214\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly9")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly9\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#EADFD6\" >������챨</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#fbf7f3\"><iframe src=\"9.htm\" frameborder=\"0\" width=\"100%\" height=\"214\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly10")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\"  id=\"fly10\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#E7E7C3\" >������Ԥ��</td></tr><tr><td height=\"215\" valign=\"top\" bgcolor=\"#F1F1E2\"><iframe src=\"10.htm\" frameborder=\"0\" width=\"100%\" height=\"213\"  scrolling=\"no\"></iframe></td></tr></table>';
				else if(flyid=="fly11")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly11\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#E7E7C3\" >��̨��·��</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#F1F1E2\"><img src=\"image/pic01.gif\" width=\"115\" height=\"93\"></td></tr><tr><td height=\"22\" align=\"left\" bgcolor=\"#E7E7C3\" >��������ͼ</td></tr><tr><td align=\"center\" valign=\"top\" bgcolor=\"#F1F1E2\"><img src=\"image/pic02.gif\" width=\"110\" height=\"97\"></td></tr></table>';
				else if(flyid=="fly12")
				document.getElementById(lo).innerHTML+='<table width=\"99%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#FFFFFF\" bordercolorlight=\"#468AC8\" class=\"dragTable\" id=\"fly12\"><tr><td height=\"22\" align=\"left\" bgcolor=\"#E7E7C3\" >�����ֵ�ͼ</td></tr><tr><td height=\"215\" align=\"center\" valign=\"top\" bgcolor=\"#F1F1E2\"><br><img src=\"image/pic03.gif\" width=\"205\" height=\"147\"></td></tr></table>';		
}

function remove_element(flyid)
{
	var fly_object=document.getElementById(flyid);
			
			//alert(fly_object.innerHTML);
	var fly_parent=fly_object.parentNode.id;
			//alert(fly_parent.innerHTML);
	document.getElementById(fly_parent).removeChild(fly_object);
}
