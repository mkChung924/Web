<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러테스트</title>
</head>
<body>
	<h3>에러테스트</h3>
	<hr>
	좋은 하루~
	
	<%
	out.print("<br>3*5="+(3*5)); 
	out.print("<br>3/5="+(3/0)); 
	
	%>

</body>
</html>