<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>forward_move.jsp</h3>
	<hr>
	<%
		//request.getRequestDispatcher("/이동할경로");
	RequestDispatcher dispatcher = request.getRequestDispatcher("/0510/result.jsp");
	dispatcher.forward(request, response);
	//현재 request객체를 result.jsp에 전달
	%>
</body>
</html>