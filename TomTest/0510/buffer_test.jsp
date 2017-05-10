<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="1kb" autoFlush="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		for(int i = 0 ; i < 1000; i++){
			out.print("가나다라마바사아자차카타파하<br>");
		}
		out.print("현재 버퍼의 크기: " + out.getBufferSize()+"byte");
		out.print("<br>버퍼 남은 양: "+out.getRemaining()+"byte");
	%>

</body>
</html>