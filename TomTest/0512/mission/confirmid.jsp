<%@page import="com.kosta.t0512.mission.UserInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmid(userid){
		alert('사용가능한 아이디입니다.');
		if(confirm('사용하시겠습니까?')){
			opener.document.frm.id.value = userid;
			window.close();
		}
	}

</script>
</head>
<%-- confirmid.jsp --%>
<body>
  <center>
  		<h3>아이디 확인</h3>
  		<hr>
		<form method="post">
		ID: <input type="text" name = "user_id"> <input type = "submit" value = "중복확인">
		</form><br>
		<a href="javascript:self.close()">창닫기</a>
		
		<%
		
		if(session.getAttribute("signUp") != null && request.getMethod().equals("POST")){
		
			String id = request.getParameter("user_id");
			UserInfoDao dao = new UserInfoDao();
		
		if(dao.idCheck(id)){
			out.print("<script>alert('이미사용중입니다!')</script>");

			
		} else {
			out.print("<script>confirmid('"+id+"'); </script>");

		}
		
	} else if(session.getAttribute("signUp") == null){
		
		%>
			<script type="text/javascript">alert('잘못된 접근입니다.'); location.href='userconfirm.jsp';</script>
		<%
		
	}
%>
             
   </center>
</body>
</html>
