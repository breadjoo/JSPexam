<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 중복 체크</title>
<style type='text/css'>
a:link	{font-family:"";color:black;text-decoration:none;}
a:visited {font-family:"";color:black;text-decoration:none;}
a:hover	{font-family:"";color:black;text-decoration:underline;}
</style>
</head>
<body>
<form>
<table border='1' width=250>
<%
	String id = request.getParameter("id");

	if(id=="") {
	

%>
	<tr>
		<td bgcolor='cccccc' align='center'>
			멀랑
		</td>
		<td align='center'>
			<a href=javascript:close()>[닫 기]</a>
		</td>
	</tr>
<%
	}else {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	
	Class.forName(driver);
	Connection connection = DriverManager.getConnection(url,"root","1234");
	Statement stmt = connection.createStatement();
	
	String sql = "select id from tblmember where id = '"+ id + "'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(!rs.next()){
%>
	<tr>
		<td bgcolor='cccccc' align='center'>
			<font size='2'>ID:<%=id%> <br> 사용할 수 있는 아이디입니다.</font>
		</td>
		<td align='center'>
			<a href=javascript:close()>[닫 기]</a>
		</td>
	</tr>

<%
} else {
%>
	<tr>
		<td bgcolor='cccccc' align='center'>
			<font size='2'>ID:<%=id%> <br> 사용할 수 없는 아이디입니다.</font>
		</td>
		<td align='center'>
			<a href=javascript:close()>[닫 기]</a>
		</td>
	</tr>
<% 
	}
	rs.close();
	stmt.close();
	connection.close();
}
%>
</table>

</form>

</body>
</html>