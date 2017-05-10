<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Include Test</title>
</head>
<%--include_test.jsp(레이아웃 설정페이지) --%>
<body>
	<center>
		<h3>include directive테스트</h3>
		<hr>
		<%@include file="menu.jsp" %>
		<table border='0' cellpadding='5'>
			<tr>
				<td align="Left">
					<font size='-1'><%@include file="shopping.jsp" %></font>
				</td>
				<td width='30'>&nbsp;</td>
				<td align="Left">
				<font size='-1'><%@include file="news.jsp" %></font>
				</td>
			</tr>

		</table>
	</center>

</body>
</html>