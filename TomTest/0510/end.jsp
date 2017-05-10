<%@page import="com.kosta.t0510.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--end.jsp(데이터조회) --%>
<body>
	<h3>end.jsp(영역데이터 출력)</h3>
	<hr>
	
	k1(pageContext): <%= pageContext.getAttribute("k1") %><br>
	k2(request): <%= request.getAttribute("k2") %><br>
	k3(session): <%= session.getAttribute("k3") %><br>
	k4(application): <%= application.getAttribute("k4") %><br>
	<hr>
	p(session)<br>
	<% Person p = (Person) session.getAttribute("p"); 
	String name = p.getName();
	String job = p.getJob();
	int age = p.getAge();
	%>
	이름: <%= name %><br>
	직업: <%= job %><br>
	나이: <%= age %><br>


</body>
</html>