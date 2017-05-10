<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--dbcp_test.jsp
	용어: DBCP (DataSource는 곧 커넥션풀을 의미), JNDI
	javax.naming.Context사용
	 --%>
<body>
	<h3>DBCP테스트</h3>
	<hr>
<%
	Context ctx = new InitialContext();
	//Context: bind() 객체등록, rebind() 객체 재등록, lookup() 객체 조회, unbind() 객체 해제
	Context tomCtx = (Context) ctx.lookup("java:comp/env");
	//tomCtx : ApacheTomcat 서버에 대한 Context 객체
	DataSource ds = (DataSource) tomCtx.lookup("jdbc/oracle");
	//ds란 Connection pool을 의미
	Connection conn = ds.getConnection();
	out.print("DB연결 성공!");
	
	//sql문 실행: 7788사번을 갖는 사원의 이름을 출력하시오.
	
	%>
	<hr>
	<form name="ename" method="post">
	사번: <input type="text" name="empno"> <input type="submit" value="검색">
	</form>
	<hr>
	<%
	
/* 	String empno = request.getParameter("empno");
	if(empno!=null){
		System.out.println(empno);
		//out.print(empno);
		
		String sql = "select ename from emp where empno = " + empno;
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		String ename = "";
		
		while(rs.next()){
			ename = rs.getString(1);
		}
		
		out.print("사원명: ["+ename+"]");
	} */
	
 	if(request.getMethod().equals("POST")){
		String empno = request.getParameter("empno");
		System.out.println(empno);
		
		String sql = "select ename from emp where empno =?";
		PreparedStatement stmt = conn.prepareStatement(sql);//DB에게 sql전달
		stmt.setInt(1, Integer.parseInt(empno));
		ResultSet rs = stmt.executeQuery();
		String ename = "";
		
		if(rs.next()){
			ename = rs.getString(1);
			out.print("사원명: ["+ename+"]");
			
		}else{
			out.print("사원명: [없음] <br><br><font color='red'>사원이 존재하지 않습니다.</font>");
		}
		
		if(conn!=null) conn.close();//커넥션풀에 Connection자원반환
		
	}

%>

</body>
</html>