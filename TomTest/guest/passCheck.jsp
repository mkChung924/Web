<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function checkpass(){
		var pass = document.passcheck.pass.value;
		var dbpass = '${guest.pass}';
		
		if(pass == dbpass){
			alert('비밀번호 확인');
			opener.exeDel();
			window.close();
			
		} else {
			alert('권한이 없습니다.')
		}
	}
</script>
</head>
<%--passCheck.jsp --%>
<body>
	<%-- 비밀번호 확인 --%>
	<br>
	<center>
		<form name="passcheck">
			<table>
				<tr>
					<td>비밀번호:</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="확인" onclick="checkpass()"></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>