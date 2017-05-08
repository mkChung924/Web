<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% for(int i=0; i < 5; i++){ %>
	<font color='blue' size='10'>안녕, JSP!!</font></br>
	<% } %>
	
	<%
	int su1 = 3;
	int su2 = 10;
	System.out.println("su1+su2 = " + (su1+su2));
	 %>
</body>
</html>