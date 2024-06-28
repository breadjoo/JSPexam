<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<style type='text/css'>
a:link	{font-family:"";color:black;text-decoration:none;}
a:visited {font-family:"";color:black;text-decoration:none;}
a:hover	{font-family:"";color:black;text-decoration:underline;}
</style>
</head>
<body>

<center><font size='3'><b>회원 인증</b></font></center>
<table border='0' width='600' cellpadding='0' cellspaciong='0'>
	<tr>
		<td>
			<hr size='1' noshade>
		</td>
	</tr>
</table>
<table border='0' cellpadding='0' cellspaciong='0' align=center>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String sessionID = "yes";
	
	try{
		if(id==""||pass=="") {
%>
	<tr>
		<td align='center'>
			<font size=2>ID와 비밀번호를 입력하세요.</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<a href='member.jsp'>[로그인]</a>
		</td>
	</tr>
<%
	} else {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	
	Class.forName(driver);
	Connection connection = DriverManager.getConnection(url,"root","1234");
	
	Statement stmt = connection.createStatement();
	
	String sql = " select*from tblmember where id = '"+ id + "'"; 
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	String logid = rs.getString("id");
	String logpass = rs.getString("pass");
	
	if(!id.equals(logid)){
%>
	<tr>
		<td align='center'>
			<font size='2'>회원 id가 아닙니다.</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<a href='member.jsp'>[로그인]</a>
		</td>
	</tr>

<% 	
	} else {
		if (!pass.equals(logpass)){
%>
	<tr>
		<td align='center'>
			<font size='2'>비밀번호가 일치하지 않습니다.</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<a href='member.jsp'>[로그인]</a>
		</td>
	</tr>		
<%
	} else{
		session.setAttribute("user", sessionID);
		response.sendRedirect("member_page.jsp");
	}
	}
	}
	}catch(Exception e) {
%>
	<tr>
		<td align='center'>
			<font size='2'>회원 id가 아닙니다.</font>
		</td>
	</tr>
	<tr>
		<td align='center'>
			<a href="member.jsp">[로그인]</a>
		</td>
	</tr>
<%
	}
%>
</table>

</body>
</html>