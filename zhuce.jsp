<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ע��</title>
<meta http-equiv='content-type' content='text/html;charset=utf-8'/> 
        <script type='text/javascript' src='login-master/index/jquery-1.7.2.js'></script> 
        <script type='text/javascript'> 
        var code ; //��ȫ�ֶ�����֤��   
           
        function createCode(){ 
             code = "";    
             var codeLength = 4;//��֤��ĳ���   
             var checkCode = document.getElementById("code");    
             var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',   
             'S','T','U','V','W','X','Y','Z');//�����   
             for(var i = 0; i < codeLength; i++) {//ѭ������   
                var index = Math.floor(Math.random()*36);//ȡ���������������0~35��   
                code += random[index];//��������ȡ��������ӵ�code��   
            }   
            checkCode.value = code;//��codeֵ������֤��   
        } 
        //У����֤��   
        function validate(){
	
			
			var password=document.getElementById("password").value;
			var password1=document.getElementById("password1").value;
	
			if(password!=password1){
				alert("����ǰ��ͬ��");
				return false;
			}
			else if (password.length<8){
				alert("��������Ϊ8λ��");
				return false;
				}
            var inputCode = document.getElementById("input").value.toUpperCase(); //ȡ���������֤�벢ת��Ϊ��д 
			
            if(inputCode.length <= 0) { //���������֤�볤��Ϊ0   
                alert("��������֤�룡"); //�򵯳���������֤��   
            }else if(inputCode != code ) { //���������֤�����������֤�벻һ��ʱ   
                alert("��֤���������@_@"); //�򵯳���֤���������   
                createCode();//ˢ����֤��   
                document.getElementById("input").value = "";//����ı���   
            }else { //������ȷʱ   
                alert("�ϸ�^-^"); 
            } 
        } 
		function getuserid(){
			document.thisform.submit();
		}
		
        </script> 
        <style type='text/css'> 
        #code{ 
            font-family:Arial,����; 
            font-style:italic; 
            color:blue;
            size:12px;			
            border:0; 
            padding:2px 3px; 
            letter-spacing:8px; 
            font-weight:bolder; 
        } 
        </style> 
</head>

<body onload='createCode()'>
<table border=0><tr><th width=200 height=30></th><th ><img src="images/3.jpg"></th></tr></table>
<table border=0><tr><th width=700 height=400><img src="images/4.jpg"></th><th>
<form >
<table border=0 height=400 >
<tr><th height=65><font  size='4'>�� �� ��</th><th><input type="text" style="height:40px" placeholder="�������û���" size=40 name="userid"></th></tr>
<tr><th height=65><font  size='4'>��    ��</th><th><input type="password" style="height:40px" placeholder="���볤��Ϊ6~18�ַ�" size=40 id="password" name="password"></th></tr>
<tr><th height=65><font  size='4'>ȷ������</th><th><input type="password" style="height:40px" placeholder="��������������" size=40 id="password1" name="password1"></th></tr>
<tr><th height=65><font  size='4'>�� ˾</th><th><input type="text" style="height:40px" placeholder="�����빫˾" size=40 name="username"></th></tr>
<tr><th height=65><font  size='4'>�绰����</th><th><input type="text" style="height:40px" placeholder="+86" size=40 name="username"></th></tr>
<tr><th height=65><font  size='4'>�� �� �� ��</th><th><input type="text" style="height:40px" placeholder="�������������" size=40 name="username"></th></tr>
<tr><div><th><font  size='4'>�� ֤ ��</th><th>   
            <input type = "text" id = "input" style="height:40px;width:220px"/>   
            <input type="button" id="code" onclick="createCode()" style="height:40px;width:80px" title='���������֤��' /> 
            <!--<input type = "button"  style="height:40px"  value = "��֤" onclick = "validate()"/> -->
			</th>
        </div>  </tr>
		
		<tr><th colspan=2 height=65><input type="checkbox"><font size='2' color='red' required/>�����Ķ���ͬ���������</font></input></th></tr>
<tr><th colspan=2 height=65><input type='submit' style="background-color:red;height:55px;width:160px;font-size:25px;color:white;border:none" value='ע��'id='l' onclick = "validate()" ></th></tr>
</table>
</form></th></tr></table>
<table><tr><th bgcolor='f9f8ed' height=200 width=2000><p>??��ϵ���䣺2186527424@qq.com</p><p>��ϵ��ַ����ׯѧԺ</p><p>??��ϵ�绰��17863276451</p></th></tr></table></body>

<%

  Class.forName("com.mysql.jdbc.Driver");
	    String url="jdbc:mysql://127.0.0.1:3306/users?user=root";
	    Connection con = DriverManager.getConnection(url);
	    String sql = "select * from user";
	    PreparedStatement pstmt =con.prepareStatement(sql);	    
		
		String user = request.getParameter("userid");
    	String pwd = request.getParameter("password1");
			  
	PreparedStatement tmt = con.prepareStatement("Insert into user values('" + user + "','" + pwd + "','123','123','123')");  
	int rst = tmt.executeUpdate();  
					  
   	tmt.close();
	pstmt.close();	
	con.close();
	%>	

</body>
</html>
