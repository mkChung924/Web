<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- print2.jsp --%>
<body>
	<h3>출력 파라미터 테스트2</h3>
	<hr>
	<%
		request.setCharacterEncoding("UTF-8");
		// POST로 전달된 데이터에만 적용!
		// 반드시 getParameter전에 적용해야함!
	%>
	<table border=1 cellspacing=0 cellpadding=5>
	<tr><td>이름: <%=request.getParameter("name")%></td></tr>
	<tr><td>비밀번호: <%=request.getParameter("pass")%></td></tr>
	<tr><td>히든: <%=request.getParameter("hdata")%></td></tr>
	<tr><td>좋아하는 과일:
	<%
		
		String fruits[] = request.getParameterValues("fruit");
		if(fruits!=null){
			for (int i = 0; i < fruits.length; i++) {
				out.print(fruits[i]+" ");
			}
		}
	%>
	<tr><td>강의실:
	<%=request.getParameter("room")%></td></tr>
	<tr><td>저녁식사:
	<%=request.getParameter("dinner")%></td></tr>
	<tr><td>코멘트:
	<%=request.getParameter("comment")%></td></tr>

</table>
	<hr>
	<% 
	//파라미터 데이터 얻기
	Enumeration<String> names = request.getParameterNames();
	//names = [name,pass,hdata,fruit,room,dinner,comment];
	while(names.hasMoreElements()){
		String name = names.nextElement();
		out.print(name+ ": "+request.getParameter(name)+"<br>");
	}
	
	%>
	<hr>
	<%
		Map<String, String[]> map = request.getParameterMap();
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		Object key[] = set.toArray();
		for(int i = 0; i < key.length; i++){
			out.print(key[i]+"<br>");
		}
		
	%>
</body>
</html>