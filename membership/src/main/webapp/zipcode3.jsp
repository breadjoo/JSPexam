<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편 번호 검색</title>
<style type='text/css'>
a:link	{font-family:"";color:black;text-decoration:none;}
a:visited {font-family:"";color:black;text-decoration:none;}
a:hover	{font-family:"";color:black;text-decoration:underline;}
</style>
<script type="text/javascript">
	function strData(fzip, fadd){
		opener.document.Member_Input.zip.value = fzip;
		opener.document.Member_Input.address1.value = fadd;
		opener.document.Member_Input.address2.focus();
		window.close();
	}
</script>
</head>
<body>
<form>

<table border='1'>

<%
	String fdong = request.getParameter("fdong");
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	
	Class.forName(driver);
	try{
		Connection connection = DriverManager.getConnection(url,"root","1234");
		Statement stmt = connection.createStatement();
		
		String sql = "select * from tblzipcode where 읍면동 like '%" +fdong +"%'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(! rs.next()){
%>
	<tr>
		<td align=center>
			<font size='2'>찾는 주소가 없습니다.</font>
		</td>
	</tr>
<%
	} else {
%>
	<tr>
		<td align='center' colspan='3'>
			<font size='2'>우편번호 검색 완료</font>
		</td>
	</tr>
	<tr>
		<td align='center'>우편번호</td>
		<td align='center'>주   소</td>
		<td align='center'>선   택</td>
	</tr>

<%		
	}
		while(rs.next()){
			String code = rs.getString("우편번호");
			String sido = rs.getString("시도");
			String gungu = rs.getString("시군구");
			String dong = rs.getString("읍면동");
			String bungi = rs.getString("번지");
			
			String address = sido+" " +gungu +" "+dong+" "+bungi;
			address = address.replaceAll("null", "");
%>
	<tr>
		<td align="center">
			<font size='2'><%=code %></font>
		</td>
		<td>
			<font size='2'>&nbsp;<%=address %></font>
		</td>
		<td align='center'>
			<input type='button' value="선택" onclick="strData('<%=code %>', '<%=sido%>&nbsp;<%=gungu%>&nbsp;<%=dong%>')">
		</td>
	</tr>

<%
		}
		rs.close();
		stmt.close();
		connection.close();
	} catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
</form><p>
<table>
	<tr>
		<td><a href="zipcod2.jsp">[다기 검색하기]</a></td>
		<td><a href="zipcod2.jsp">[다기 검색하기]</a></td>
	</tr>

</table>

</body>
</html>