<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- include_action.jsp --%>
<body>
	<h3>include_action.jsp</h3>
	<% int su = 4; %>
	<hr>
	<jsp:include page="sessionT1.jsp"></jsp:include>
</body>
</html>