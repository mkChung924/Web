<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- print.jsp --%>
<body>
<h3>전달 파라미터 출력</h3>
<hr>
<% request.setCharacterEncoding("UTF-8");
	// POST로 전달된 데이터에만 적용!
	// 반드시 getParameter전에 적용해야함!
%>
이름: <%= request.getParameter("username") %><br>
나이: <%= request.getParameter("age") %>

</body>
</html>