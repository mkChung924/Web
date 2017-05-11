<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품추가</title>
</head>
<%-- add.jsp --%>
<body>
	<h3>상품추가</h3>
	<hr>
	<%! ArrayList<String> f; %>
	<%

		if(session.getAttribute("selected") == null){
			f = new ArrayList<>();
		}
	
		request.setCharacterEncoding("UTF-8");
		String product = request.getParameter("product");
		f.add(product);
		session.setAttribute("selected", f);
		out.print("<script>alert('"+product+"가 추가되었습니다.'); history.back();</script>");
		
		%>
</body>
</html>