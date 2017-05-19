<%@page import="com.kosta.t0516.dao.EmpDAO3"%>
<%@page import="com.kosta.t0516.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- emp.jsp(HTML바탕 + Java코드 추가)  --- model2 개발 방식 ---> jsp View의 역할

	문제) 사원들의 사원번호, 사원명, 입사일을 HTML <table>에 출력하시오.
	--%>
<body>
<%
	//DAO에서 Connection Pool 사용! DBCP 사용!
	EmpDAO3 dao = new EmpDAO3();
	ArrayList<Emp> list = dao.selectAll();
	
%>
	<center>
	<h3>사원정보출력3</h3>
	<hr>
		<table border=1 cellspacing=0 cellpadding=5>
			<tr bgcolor="pink"><th>사원번호</th><th>사원명</th><th>입사일</th></tr>
			<%for(int i = 0; i < list.size(); i++){
				
				%>
				<tr>
					<td><%= list.get(i).getEmpno() %></td>
					<td><%= list.get(i).getEname() %></td>
					<td><%= list.get(i).getHiredate() %></td>
				</tr>
				
				<%
	
			} %>
		</table>
	</center>

</body>
</html>