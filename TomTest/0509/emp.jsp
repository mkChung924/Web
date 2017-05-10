<%@page import="java.util.List"%>
<%@page import="com.kosta.t0502.EmpDAO"%>
<%@page import="com.kosta.t0502.EMP"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>EMP 사원정보</h3>
		<hr>

		<%!Connection conn;
	Properties pro;
	PreparedStatement stmt;
	ResultSet rs;
	EmpDAO dao;%>
		<%
			try {
				pro = new Properties();
				pro.load(new FileReader("/Users/myungkyuchung/web/TomTest/conn/conn.properties"));
				Class.forName(pro.getProperty("driver"));
				conn = DriverManager.getConnection(pro.getProperty("url"), pro);
				out.print("<1번 문제><br><br>");
				out.print("DB연결 성공!<hr>");

			} catch (Exception e) {
				e.printStackTrace();
			}

			dao = new EmpDAO(application.getRealPath("/"));
			List<EMP> emp = new ArrayList<>();
			emp = dao.select();

			out.print("<2번 문제><br><br>");
		%>
		<table border=1 cellspacing=1 cellpadding=7>
			<tr bgcolor=orange>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>입사일</th>
				<th>월급</th>
				<th>부서명</th>
			</tr>
			<%
				for (int i = 0; i < emp.size(); i++) {
			%>
			<tr <%if (i % 2 == 0)
					out.print("bgcolor=#eeeeee");%>>
				<%
					out.print("<td><center>" + emp.get(i).getEmpno() + "</td>");
						out.print("<td><center>" + emp.get(i).getEname() + "</td>");
						out.print("<td><center>" + emp.get(i).getHiredate() + "</td>");
						out.print("<td><center>" + emp.get(i).getSalary() + "</td>");
						out.print("<td><center>" + emp.get(i).getDname() + "</td>");
						out.print("</tr>");

					}
				%>
			
		</table>
		<%
	
	%>
	</center>
</body>
</html>