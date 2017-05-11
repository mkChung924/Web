<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="p" class="com.kosta.t0510.Person"></jsp:useBean>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:setProperty property="*" name="p"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- useBean_result.jsp --%>
<body>
<h3>정보입력결과</h3>
<hr>
<%= p %>

</body>
</html>