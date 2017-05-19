<%@page import="iba.conf.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ibatis 테스트</title>
</head>
<%--ibatis_test.jsp (7788 사번의 사원명 출력)--%>
<body>
	<h3>iBatis Framework(SqlMapper프레임워크)테스트</h3>
	<hr>
	
	<%
		SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
		
		String ename = (String) smc.queryForObject("sel7788");
		
		out.print(ename);
	
	%>

</body>
</html>