<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사용자 인증</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.normal {
	font-family: "굴림", "돋움";
	font-size: x-small;
	font-style: normal;
	font-weight: normal;
	text-decoration: none
}

.normalbold {
	font-family: "굴림", "돋움";
	font-size: x-small;
	font-style: normal;
	font-weight: bold;
	text-decoration: none
}
</style>
</head>
<%-- sessionT2.jsp --%>

<body>

<%
	/* 	폼입력된 아이디와 비밀번호를 검사(인증)!
		----> DB 비교
		----> 일치(id존재, pass일치)경우: 밑의 HTML을 출력
		----> 불일치경우: 로그인페이지 이동
	*/
	//HashMap(DataBase)
	HashMap<String, String> map = new HashMap<String, String>();
	
	//map.put : 데이터 저장
	map.put("gildong", "1234");
	map.put("lime", "5678");
	map.put("juwon", "8989");
	
	//map.get(Object key) : 데이터 조회
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id != null && pass != null){
		if(!id.trim().isEmpty() || !pass.trim().isEmpty()){
			
			if(map.containsKey(id)){
				
				if(map.get(id).equals(pass)){
					
					session.setAttribute("login", true);
				%>
				<center>
					<p class="normalbold">사용자 인증 완료</p>
					<p class="normal">
						<a href="sessionT3.jsp">서비스페이지</a>
					</p>
				</center>
				<%
				
				} else {
					out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
					//response.sendRedirect("sessionT1.jsp");
				}
				
			} else {
				out.print("<script>alert('존재하지 않는 아이디 입니다.'); history.back();</script>");
				//response.sendRedirect("sessionT1.jsp");
			}
			
		} else {
			out.print("<script>alert('아이디 또는 비밀번호를 입력하세요.'); history.back();</script>");
			//response.sendRedirect("sessionT1.jsp");
		}
	} else {
		out.print("<script>alert('잘못된 접근입니다. sessionT1.jsp로 이동합니다.'); location.href = 'sessionT1.jsp';</script>");
		//response.sendRedirect("sessionT1.jsp");
	}

	
%>

</body>
</html>










