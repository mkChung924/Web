<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- /0508/calc.jsp -->
<body>
	<center>
	<h3>계산기폼</h3>
	<hr>
	<form name='calc' method="post" action="result.jsp">
	<input type='text' size=5 name='su1'>
	<select name="oper">
		<option>+</option>
		<option>-</option>
		<option>x</option>
		<option>/</option>
	</select>
	<input type='text' size=5 name='su2'>
	<button type='submit'>계산</button>
	</form>
	</center>
</body>
</html>