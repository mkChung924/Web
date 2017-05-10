<%@page import="com.kosta.t0510.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- start.jsp --%>
<body>
	<h3>start.jsp</h3>
	<hr>

	<%
		String name = "Gildong";

		//save
		pageContext.setAttribute("k1", name);
		request.setAttribute("k2", "Lime");
		session.setAttribute("k3", "Juwon");
		application.setAttribute("k4", "MK");
		
		Person p = new Person("나길동","학생",13);
		session.setAttribute("p", p);
		
		//move page
		//request.getRequestDispatcher("/0510/end.jsp").forward(request, response);
		response.sendRedirect("end.jsp");
	%>
</body>
</html>