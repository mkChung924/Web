<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- test.jsp(JSP 기본태그 테스트) --%>
<body>

	<%!
	int su1;
	int su2 = 20;
	
	public String getMsg(){
		return "안녕?";
	} //(O) 그러나 비권장
	%>
	
	<%
	//service() 메소드 내에 위치할 자바코드
	int su3;
	su3 = 30;
	su1 = 10;
	
	if(su1 < su3){ //조건문
		//메소드 호출
		out.print("su1 is less than su3.<br>"); //out: 브라우저 출력 객체
		System.out.println("su3이 su1보다 큽니다."); //System.out: 서버콘솔 출력 객체
	}
	%>
	
	<%=
	2+3
	%> <br>
	<%=	
	getMsg()
	%> <br>
	
	<!-- 나주석(브라우저에 전달될 주석 -->
	<%--나도주석(JVM에서 실행되는 주석, 브라우저에는 전달이 되지않음.) --%>
	
	<!-- <%= new Date() %> -->
	<%-- <%= new Date() %> --%>
	
</body>
</html>