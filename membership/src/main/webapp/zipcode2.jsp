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
<script language="javascript">
function zipsubmit() {
	if(document.zipform.fdog.value=="") {
		alert("'동' 이름이 비었습니다.");
		document.zipform.fdog.focus();
		return;
	}
	document.zipform.submit();
}
</script>
</head>
<body>
<form name='zipform' method='post' action='zipcode3.jsp'>
<br><br>
<table border='1' align='center'>
	<tr>
		<td width='430' height='20' align='center'>
			<font size=2>찾는 주소의 <b>'동'</b> 이름을 입력하세요</font>
		</td>
	</tr>
	<tr>
		<td width='430' height='50' align='center'>
			<font size='2'>주소 ('동' 이름) : </font>
			<input type='text' name='fdong' value='' size='12'>
			<input type='button' value='검색' onclick='zipsubmit()'>
			<br></font>
		</td>
	</tr>
</table>
</form>
<table border='0' cellspacing='0' cellpading='0'width='430' align='center'>
	<tr>
		<td align='center' width='430'>
			<a href=javascript:close()>[닫 기]</a>
		</td>
	</tr>
 </table>

</body>
</html>