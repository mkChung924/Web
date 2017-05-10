<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- /0508/gugudan.jsp -->
<body>
<center>
<h3>구구단 출력</h3>
<hr>

<table border=1 cellspacing=0 cellpadding=10>

	<%
	
	for(int i = 1; i < 10; i++){
		%><tr><%
		for(int j = 2; j < 10; j++){
			
			%><td><% out.print(j+"*"+i+" = " + (j*i)); %></td>
			
		<%}%></tr>
	<%}
	
	%>

</table>

<h3>구구단 2</h3>
<hr>

</center>
</body>
</html>