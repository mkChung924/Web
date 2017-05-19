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
	// jsp페이지내에서 JDBC 직접사용
		//1.드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.DB연결
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost/orcl", "scott2", "tiger");
		//3.SQL실행 Statement stmt -- 속도, 보안(SQL) --> PreparedStatement pstmt
		String sql = "select empno, ename, hiredate from emp";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//4.SQL 실생(조회)결과 얻어오기
		ResultSet rs = pstmt.executeQuery();
		
	
%>
	<center>
		<table border=1 cellspacing=0 cellpadding=5>
			<tr bgcolor="#99ccff"><th>사원번호</th><th>사원명</th><th>입사일</th></tr>
			<%while(rs.next()){
				
				%>
				<tr>
					<td><%= rs.getInt("empno") %></td>
					<td><%= rs.getString("ename") %></td>
					<td><%= rs.getString("hiredate") %></td>
				</tr>
				
				<%
	
			} %>
		</table>
	</center>

</body>
</html>