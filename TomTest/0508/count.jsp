<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- /0508/count.jsp -->
<body>
	<h3>조회수 출력</h3>
	<hr>
	<%! 
	int count; 
	%>
	
	<% 
	if(session.isNew()){ //클라이언트가 (TomTest서비스) 새 접속을 하였을 때
		count++;
	}
	%>
	조회수: <%= count %>회
</body>
</html>