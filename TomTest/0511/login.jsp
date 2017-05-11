<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<%-- login.jsp --%>
<body>
	<center>
		<h3>로그인 화면</h3>
		<hr>
		<div id="d1">
			<form action="selProduct.jsp" method="post">
				<input type="text" name="username" size="10">
				<button>로그인</button>
			</form>
		</div>
		<div id='d2'>
			<b><font color=blue>로그인한 상태입니다.</font></b>
		</div>

		<script type="text/javascript">
			var d1 = document.getElementById("d1");
			var d2 = document.getElementById("d2");
		</script>
				
		<%
			if(session.getAttribute("loginName") != null){
				out.print("<script>d1.style.display='none';d2.style.display='';</script>");
			} else {
				out.print("<script>d1.style.display='';d2.style.display='none';</script>");
				
			}
		%>

	</center>
</body>
</html>