<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 수정하기</title>
<script type="text/javascript">


	function submitAction(i){
				
		if(i == 1){
			window.open('0517/passCheck.jsp', 'check', 'toolbar = yes, location = no, status = no, menubar = no,' +
			'scrollbars = no, resizable = no, width = 300, height = 100, top = 300, left=700'); 
			
			/* document.frm.action="guest?action=update&id=${guest.id}";
			document.frm.submit(); */
		} else if(i == 2){
			
			document.frm.action="guest?action=delete&id=${guest.id}";
			document.frm.submit();
 					
		}

	}

	function exeDel(){

		document.frm.action="guest?action=delete&id=${guest.id}";
		document.frm.submit();
			
		
	}

</script>
</head>
<%-- inputForm.jsp --%>
<body>
<center>
	<h3>수정폼</h3>
	<hr>
	[<a href="guest?action=list">게시물 목록으로</a>]
	<br><br>
	<form name="frm" method="post">
	
		<table border=1 cellspacing=1 cellpadding=5>
			<tr>
				<td bgcolor="#6799FF">작성자</td>
				<td><input type="text" name="name" value="${guest.name }" maxlength="25"></td>
			</tr>
			<tr>
				<td bgcolor="#6799FF">email</td>
				<td><input type="text" name="email" value="${guest.email }" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#6799FF">전화번호</td>
				<td><input type="text" name="tel" value="${guest.tel }" maxlength="15"></td>
			</tr>
			<tr>
				<td bgcolor="#6799FF">비밀번호</td>
				<td><input type="password" name="pass" maxlength="25"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="30" rows="5" name="contents" >${guest.contents }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="입력" onclick="submitAction(1)"> <input type="reset" value="취소">
												<input type="button" value="삭제" onclick="submitAction(2)"></td>
			</tr>
		
		</table>
	</form>
	
	

</center>
</body>
</html>