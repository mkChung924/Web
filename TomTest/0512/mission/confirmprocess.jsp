<%@page import="java.util.HashMap"%>
<%@page import="com.kosta.t0512.mission.UserInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>   
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
%> 
<script type="text/javascript">
	//(수정 또는 삭제) 페이지 이동
	function movePage(upDel){
		
		if(upDel === 'up'){
			
		location.href="modifyuser.jsp?id=<%=id%>"; //수정폼으로 이동
			
		} else if(upDel === 'del'){
			
			if(confirm('정말 탈퇴하시겠습니까?')){
				
			location.href="deleteid.jsp?id=<%=id%>"; //삭제폼으로 이동
			
			}
			
			
		}
		
	}
	
	function deletePage(){
		
		location.href="deleteid.jsp";
	}
	

</script>
</head>
<body>
<center>
<% 

UserInfoDao dao = new UserInfoDao();
HashMap<String,Boolean> map = new HashMap<>();



if(id != null && pass != null){
	
	if(!id.trim().isEmpty() || !pass.trim().isEmpty()){
		
		map = dao.select_login(id, pass);
		
		boolean id_ok = map.get("id");
		boolean pass_ok = map.get("pass");
		System.out.println(id_ok);
		System.out.println(pass_ok);
		
		if(id_ok && pass_ok){
			
			session.setAttribute("login", true);
		
			%>
			
			<table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>로그인 성공</b></td>
              </tr>
              <tr>
                <td>
                   입력하신 아이디와 패스워드를<br> 확인했습니다.
                   <br><br>
                                    
                    <input type="submit" value="회원정보수정" onclick="movePage('up')">
                  
                    <input type="submit" value="회원탈퇴" onclick="movePage('del')">
                   
                   <br><br>
                   <a href="service.jsp">서비스화면</a>
                </td>
              </tr>
           </table>       	  
			
			<%
		} else if(!id_ok && !pass_ok){
			%>
			
			<table width="280" border="0" cellpadding="5">
			  <tr bgcolor="#3399cc">
				<td><b>로그인 실패</b></td>
			  </tr>
			  <tr>
				<td>
				   다시 아이디를 확인하세요.<br>
				   만약 가입하지 않으신 경우 신규가입을 하시기 바랍니다.<br><br>
				   <a href="userinput.jsp">신규가입</a>
				</td>
			  </tr>
          </table> 
			
			<%
		} else if(id_ok && !pass_ok){
			
			%>
			
		<table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>로그인 실패</b></td>
              </tr>
              <tr>
                <td>
                   패스워드가 틀립니다.<br>
                   패스워드를 다시한번 확인해 주시기 바랍니다.<br><br>
                   <a href="userconfirm.jsp">로그인화면</a>
                </td>
              </tr>
           </table>  
			
			<%
		}
		
	} else { //id 또는 비번이 빈칸일 때
		out.print("<script>alert('id 또는 비밀번호를 입력하세요.'); location.href = 'userconfirm.jsp'</script>");
	}
}

%>

   	 
</center>
</body>
</html>








