<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- useBean_action.jsp 
	<useBean>태그는 특정 클래스의 객체생성 역할
--%>
<jsp:useBean class="com.kosta.t0510.Person" id="p"></jsp:useBean>
<%
	//Person p = new Person();
%>
<body>
	<center>
	<h3>useBean_action</h3>
	<hr>
	<%= p %>
	<br>
	<%
		p.setName("홍길동");
	%>
	<jsp:setProperty property="age" value="15" name="p"/>
	<jsp:setProperty property="job" value="학생" name="p"/>
	<%= p %>

</center>
</body>
</html>