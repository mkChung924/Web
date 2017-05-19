<%@page import="com.kosta.t0510.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL테스트</title>
</head>
<%-- el_test.jsp --%>
<body>
	<center>
		<h3>Expression language(EL) 테스트</h3>
		<hr>
		안녕 EL?<br><br>
		<% int su = 30; %>
		k1: <%= (String)request.getAttribute("k1") %><br>
		k2: <%= session.getAttribute("k2") %><br>
		k3: <%= application.getAttribute("k3") %><br>
		su: <%=su %><br>
		k4(request): <%= request.getAttribute("k4") %><br>
			<% Person p = (Person)request.getAttribute("k4"); %>
			이름: <%= p.getName() %><br>
			나이: <%= p.getAge() %><br>
			직업: <%= p.getJob() %><br>
		k4(session): <%= session.getAttribute("k4") %><br>
		k4(application): <%= application.getAttribute("k4") %><br>
		<hr>
		<h4>EL을 통한 데이터출력</h4>
		k1: ${k1 }<br>
		k2: ${k2 }<br>
		k3: ${k3 }<br>
		2+3= ${2+3 }<br>
		su= ${su }<br>
		k4: ${k4 }<br>
			<font color='blue'>이름:</font> ${k4.name }<br>
			<font color='red'>나이:</font> ${k4.age }<br>
			<font color='green'>직업:</font> ${k4.job }<br>
		k4(request): ${requestScope.k4 }<br>
			<font color='blue'>이름:</font> ${requestScope.k4.name }<br>
			<font color='red'>나이:</font> ${requestScope.k4.age }<br>
			<font color='green'>직업:</font> ${requestScope.k4.job }<br>
		k4(session): ${sessionScope.k4 }<br>
			<font color='blue'>이름:</font> ${sessionScope.k4.name }<br>
			<font color='red'>나이:</font> ${sessionScope.k4.age }<br>
			<font color='green'>직업:</font> ${sessionScope.k4.job }<br>
		k4(application): ${applicationScope.k4 }<br>
			<font color='blue'>이름:</font> ${applicationScope.k4.name }<br>
			<font color='red'>나이:</font> ${applicationScope.k4.age }<br>
			<font color='green'>직업:</font> ${applicationScope.k4.job }<br>
			
		<hr>
		<h3>입력폼</h3>
		<form action="0512/print.jsp" method="post">
			이름: <input type="text" name="name"><br>
			나이: <input type="text" name="age"><br>
			<input type="submit" value="전송">
		</form>
	</center>
</body>
</html>