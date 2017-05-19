<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head><title>Session로그아웃 페이지</title>
   <style type="text/css">
		<!--
		.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  fosnt-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
   </style>
 </head>
 <%-- sessionT4.jsp --%>
 <body>
	<%
	
	if(session.getAttribute("login") != null){
		
		session.invalidate();
		
		%>
			<center>
			<p class=normalbold>세션이 종료되었습니다.</p>
	 		<p class=normal><a href="service.jsp">서비스 페이지로 이동 해 보죠.</a></p>
	 		</center>
		<%
		
	} else {
		out.print("<script>alert('로그인을 하셔야 접근가능합니다.'); location.href='userconfirm.jsp';</script>");
	}
	
	%>


</body>
</html>








