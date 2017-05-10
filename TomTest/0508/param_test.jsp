<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- param_test.jsp -->
<body>
	<h3>전달된 파라미터</h3>
	<hr>
	<% 
	
	//전달된 문자 한글처리
	//주의할점: 1. 전달은 post 2. 요청페이지와 같은 인코딩 문자집합 설정!
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	아이디: <%= id %> <br>
	비밀번호: <%= pass %> <br>
	이름: <%= request.getParameter("name") %>
</body>
</html>