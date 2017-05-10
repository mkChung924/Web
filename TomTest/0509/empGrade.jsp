<%@page import="com.kosta.t0509.EMP"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosta.t0509.EmpDAO"%>
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
	<h3>사원 GRADE</h3>
	<hr>

	<%!
		EmpDAO dao;
		ArrayList<EMP> arr;
	%>
	
	<%
		dao = new EmpDAO();
		arr = new ArrayList<>();
		
		arr = dao.selectGradeInfo();
		
		%>
		<table border=1 cellspacing=0 cellpadding=7>
		<tr bgcolor='orange'>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서이름</th>
			<th>등급</th>
		</tr>
		<%
		for(int i = 0; i<arr.size(); i++){
			%>
			<tr <%if(i%2==0) out.print("bgcolor=#eeeeee"); %>>
			<%
			out.print("<td><center>"+arr.get(i).getEmpno()+"</center></td>");
			out.print("<td><center>"+arr.get(i).getEname()+"</center></td>");
			out.print("<td><center>"+arr.get(i).getDname()+"</center></td>");
			out.print("<td><center>"+arr.get(i).getGrade()+"</center></td></tr>");
			
		}
		
		
		%>
		</table>
		<%
	%>
</center>
</body>
</html>