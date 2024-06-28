<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 성공</title>
<style type='text/css'>
a:link	{font-family:"";color:black;text-decoration:none;}
a:visited {font-family:"";color:black;text-decoration:none;}
a:hover	{font-family:"";color:black;text-decoration:underline;}
</style>
</head>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String juminnum1 = request.getParameter("juminnum1");
	String juminnum2 = request.getParameter("juminnum2");
	String zip = request.getParameter("zip");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	String check_ok = "yes";
	
	if(id == "")
		check_ok = "no";
	if(pass == "")
		check_ok = "no";
	if(name == "")
		check_ok = "no";
	if(juminnum1 == "")
		check_ok = "no";
	if(juminnum2 == "")
		check_ok = "no";
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	
	Class.forName(driver);
	Connection connection = DriverManager.getConnection(url,"root","1234");
	Statement stmt = connection.createStatement();
	
	String sql = " select id from tblmember where id = '" +id + "'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(!rs.next())
		check_ok ="yes";
	 else 
		check_ok="no";
	if (check_ok != "yes"){
		sql = "insert into tblmember(id,pass,name,juminnum1,juminnum2,zip,address1,address2,phone,email) "
				+ " values ('" + id + "', '" + pass + "',' "+ name + "','" + juminnum1 + "','"  + juminnum2 + "','"  + zip + "','" + address1
				+"','" + address2 + "','" + phone + "','"  + email + "'";
		stmt.executeUpdate(sql);
%>



<body>
<center><font size='3'><b>회원 가입 성공</b></font></center>
<table border='0' width='600' cellpading='0' cellspacing='0'>
	<tr>
		<td>
			<hr size='1' noshade>
		</td>
	</tr>
</table>
<table cellspacing='0' cellpadding='10' align='center' border='0'>
	<tr>
		<td align='center'>
			<font size='2'> 회원 가입을 축하합니다.<br>로그인 하세요.</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<FONT size='2'><a href="member.jsp">[로그인]</a></FONT>
		</td>
	</tr>
</table>

<% 
	} else {
%>

</body>
</html>

<html>
<head>
<title>회원 가입 실패</title>
</head>
<body>
<center><font size='3'><b>회원 가입 실패</b></font></center>
<table border='0' width='600' cellpading='0' cellspacing='0'>
	<tr>
		<td>
			<hr size='1' noshade>
		</td>
	</tr>
</table>
<table cellspacing='0' cellpadding='10' align='center' border='0'>
	<tr>
		<td align='center'>
			<font size='2'> 회원 가입에 실패 했습니다.<br>다시 가입서를 작성해주세요.</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<FONT size='2'><a href="member_input.jsp">[다시 시도]</a></FONT>
		</td>
	</tr>
</table>
<%} %>
</body>
</html>