<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션테스트</title>
</head>
<%-- session_test.jsp --%>
<body>
	<h3>Session Test</h3>
	<hr>
	<%--
	<%  %> scriptlet
	<%= %> expression
	
	class 서블릿클래스{
		public void service(request, response){
			지역변수
			pageContext, request, session, application, out, page, (exception) when isErrorPage = 'true'
		}
	}
	
 --%>
 
	 <%
	 //session.setMaxInactiveInterval(5); //세션 유지시간을 5초로 하겠다.
	 	if(session.isNew()){ //브라우저를 통해 서버에 최초 URL요청을 했다면
			 out.print("<script>alert('세션이 해제되어 다시 설정합니다.')</script>"); 
	 	}
	 %>
	 
	1. Session ID(서버가 브라우저에게 부여하는 식별번호): <%=session.getId()%><br> 
	2. 세션 유지시간: <%=session.getMaxInactiveInterval()%>초

</body>
</html>