<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
</head>
<%-- selProduct.jsp --%>
<body>
	<center>
		<h3>상품 선택</h3>
		<hr>
		<% 
		
		request.setCharacterEncoding("UTF-8"); 
		String username = request.getParameter("username");
		
		if(session.getAttribute("loginName") == null){
			//세션에 loginName키로 저장된 데이터가 null이면 저장
			//세션영역에 로그인한 이름을 저장
			session.setAttribute("loginName", username);
		}
		
		String action = request.getParameter("action");
		
		if(action != null && action.equals("remove")){
			//out.print("<script>alert('장바구니가 삭제되었습니다.')</script>");
			session.removeAttribute("selected");
		}
		
		%>
		[<%= session.getAttribute("loginName") %>]님이 로그인한 상태입니다.<br><br>
		<form action="add.jsp" method="post">
			<select name="product">
				<option>망고</option>
				<option>포도</option>
				<option>딸기</option>
				<option>복숭아</option>
				<option>바나나</option>
			</select>

			<button>추가</button>
		</form>
		<br>
		
<%-- 		<%
		if(session.getAttribute("selected") != null){
			ArrayList<String> f = (ArrayList<String>) session.getAttribute("selected");
			out.print(f.size());
		}
		%> --%>
		<a href="checkOut.jsp">계산</a>
	</center>

</body>
</html>