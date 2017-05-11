<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- checkOut.jsp --%>
<body>
	<center>
		<h3>선택된 상품목록</h3>
		<hr>
		
		<% 
		int sum = 0;
		int MANGO = 100;
		int GRAPE = 200;
		int STRAW = 120;
		int PEACH = 200;
		int BANANA = 250;
		
		if(session.getAttribute("selected") != null){
			ArrayList<String> f = (ArrayList<String>) session.getAttribute("selected");
			
			Set<String> uniqueF = new HashSet<String>(f);
			String arr[][] = new String[uniqueF.size()][uniqueF.size()];
			
			out.print("과일 총 개수: "+f.size()+"개<br><br>");
			
			%> <table border=1 cellspacing=0 cellpadding=7><%
			
			for(int i = 0; i < f.size(); i++){
				String product = f.get(i);
				
				switch(product){
				
				case "망고":
					sum += MANGO;
					
					out.print("<tr><td>"+product + "</td><td>" + MANGO +"원</td><tr>");
					break;
					
				case "포도":
					sum += GRAPE;
					out.print("<tr><td>"+product + "</td><td>" + GRAPE +"원</td><tr>");
					break;
					
				case "딸기":
					sum+=STRAW;
					out.print("<tr><td>"+product + "</td><td>" + STRAW +"원</td><tr>");
					break;
					
				case "복숭아":
					sum+=PEACH;
					out.print("<tr><td>"+product + "</td><td>" + PEACH +"원</td><tr>");
					break;
					
				case "바나나":
					sum+=BANANA;
					out.print("<tr><td>"+product + "</td><td>" + BANANA +"원</td><tr>");
					break;
					
					default: break;
				}
				
			}
			
			%></table> <%
		} else {
			out.print("<script>alert('저장된 목록이 없습니다.'); history.back();</script>");
		}
		%>
		
		<hr>
		총 합계: <% out.print(sum+"원"); %>
		<hr>
		<input type="hidden" name="cancel" value="del">
		<input type="button" value="장바구니 취소" onclick="location.href='selProduct.jsp?action=remove'">
		
	</center>
</body>
</html>