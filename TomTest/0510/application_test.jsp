<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--application_test.jsp --%>
<body>
	<h3>application테스트</h3>
	<hr>
	1. 서블릿 컨테이너 이름:
	<%=application.getServerInfo()%><br> 
	2. 서블릿 API버전:
	<%=application.getMajorVersion()%>.<%=application.getMinorVersion()%><br>
	3. 현재 Context(TomTest)의 실제경로(서버디스크경로):
	<%=application.getRealPath("/")%><br> 
	
	<%
		String protocol = request.getProtocol();//HTTP 요청 버전: 1.0  1.1
		String method = request.getMethod();//HTTP요청 방식(GET, POST)
		String addr = request.getRemoteAddr();//접속 클라이언트의 ip정보
		
		//application객체를 통한 정보 기록
		String info = "[접속한 클라이언트 정보] protocol: " + protocol +", 요청방식: " + method + ", 접속IP: " + addr;
		
		application.log(info);
		out.print("기록 성공!");
	%>
</body>
</html>