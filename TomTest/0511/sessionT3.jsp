<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head><title>Session인증자 페이지</title>
   <style type="text/css">
		<!--
		.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
   </style>
 </head>
 
 <%-- sessionT3.jsp --%>
 <body> 
<%
	//세션 로그인 체크: 만약 로그인 거치지 않았다면 sessionT1.jsp로 강제 이동
	
	boolean login = false;

	if(session.getAttribute("login") != null){
		
		login = (boolean) session.getAttribute("login");
		
		if(login == true){
			%>
				<center>
				     <p>                
					    <img src="../image/shinroot.jpg" width="400" height="300">
				     </p>
				     <p class="normalbold">이 페이지는 사용자 인증을 받아야 볼 수 있죠!</p>    
				     <p class="normal">감사합니다....</p>
				     <p class="normal"><a href="sessionT4.jsp">로그아웃</a></p>
			     </center>
			<%
			
		} else {
			out.print("<script>alert('로그인하세요.'); location.href='sessionT1.jsp';</script>");
		}
	} else {
		out.print("<script>alert('로그인하세요.'); location.href='sessionT1.jsp';</script>");
	}

%>
    

 </body>
</html>










