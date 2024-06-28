<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용</title>
<style type='text/css'>
a:link	{font-family:"";color:black;text-decoration:none;}
a:visited {font-family:"";color:black;text-decoration:none;}
a:hover	{font-family:"";color:black;text-decoration:underline;}
</style>
</head>
<body>
<center><font size='3'><b>회원 전용 페이지</b></font></center>
<table border='0' width='600' cellpading='0' cellspacing='0'>
	<tr>
		<td>
			<hr size='1' noshade>
		</td>
	</tr>
</table>
<table cellpading='30' cellspacing='0' align='center' border='0'>
<%
	try{
		String strUser = "yes";
		String strSession = session.getAttribute("user").toString();
		
		if(!strUser.equals(strSession)){
%>
	<tr>
		<td align='center'>
			<font size='2'>로그인 하세유-ㅅ-</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<a href="member,jsp">[로그인]</a>
		</td>
	</tr>

<%
		} else{
%>
	<tr>
		<td align='center'>
			<font size='2'>회원 전용 페이지</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<font size='2'>이 페이지는 회원에게만 제공되는 페이지입니다.</font>
		</td>
	</tr>

<%
		}
		
		
	} catch(NullPointerException e){
		
	}


%>
	<tr>
		<td>
			
		</td>
	</tr>
</table>

</body>
</html>

