<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- useBean_action.jsp 
	<useBean>태그는 특정 클래스의 객체생성 역할
--%>

<body>
	<center>
	<h3>정보등록</h3>
	<hr>
		<form action='useBean_result.jsp' method="post">
		이름: <input type="text" name="name"><br>
		나이: <input type="text" name="age"><br>
		직업:<input type="text" name="job"><br>
		<input type="submit" value="등록">
		</form>

	</center>
</body>
</html>