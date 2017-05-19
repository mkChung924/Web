<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프린트</title>
</head>
<%-- print.jsp --%>
<body>
<h3>파라미터 데이터 출력</h3>
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
이름: <%= request.getParameter("name") %><br>
나이: <%= request.getParameter("age") %><br>
아무거나: <%= request.getParameter("any") %><br>
<hr>
<h4>El통한 파라미터 출력</h4>
이름: ${param.name }<br>
나이: ${param.age }<br>
아무거나: ${param.any }<br>
</body>
</html>