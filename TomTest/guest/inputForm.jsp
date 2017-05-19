<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 쓰기</title>
	<style type="text/css">
		.td{ <%-- .찍으면 클래스 찾음--%>
			background-color: aqua;
		}
<%-- 		#td{ id찾음
			background-color: red;
		} --%>
	</style>
</head>
<%-- inputForm.jsp --%>
<body>
<center>
	<h3>입력폼</h3>
	<hr>
	[<a href="guest?acition=list">게시물 목록으로</a>]
	<br><br>
	<form method="post" action="guest?action=insert">
		<table border=1 cellspacing=1 cellpadding=5>
			<tr>
				<td class="td" bgcolor="#6799FF">작성자</td>
				<td><input type="text" name="name" maxlength="25"></td>
			</tr>
			<tr>
				<td class="td">email</td>
				<td><input type="text" name="email" maxlength="30"></td>
			</tr>
			<tr>
				<td class="td">전화번호</td>
				<td><input type="text" name="tel" maxlength="15"></td>
			</tr>
			<tr>
				<td class="td">비밀번호</td>
				<td><input type="password" name="pass" maxlength="25"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="30" rows="5" name="contents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="입력"> <input type="reset" value="취소"></td>
			</tr>
		
		</table>
	</form>
	
	

</center>
</body>
</html>