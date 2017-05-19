<%@page import="com.kosta.t0512.mission.UserInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.kosta.t0512.mission.UserInfo" id="user"></jsp:useBean>
<jsp:setProperty  name="user" property="*"/>
<%-- UserInfo user = new UserInfo(); 
			user.setId(request.getParameter("id");
	--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입처리결과</title>
</head>
<body>
  <center>    
<%
	

	if(session.getAttribute("signUp") == null){
		
		out.print("<script>alert('잘못된 접근입니다.'); location.href = 'userconfirm.jsp';</script>");
		
	} else {
		UserInfoDao dao = new UserInfoDao();

		String jumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2");
		String birth = request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");
		String zip = request.getParameter("zip1")+"-"+request.getParameter("zip2");
		
		user.setJumin(jumin);
		user.setBirth(birth);
		user.setZip(zip);
		

		//boolean succ = dao.insert("wjdudrb", "1234", "정명규", "123456-1234567", "1991/09/24", "15624", "주소", "이메일", "직업");
		boolean succ = dao.insert(user);
		
		if(succ){
		
			%>
			<table width="330" border="0" cellpadding="5">
		         <tr bgcolor="#3399cc">
		           <td><b>[<%=user.getName() %>]님 가입을 축하합니다.</b></td>
		         </tr>
		         <tr>
		           <td>
		              입력하신 내용대로 가입이 완료되었습니다.<br>
		              <font color=blue>[<%= user.getName() %>]</font>님께서 요청하신 아이디와 패스워드입니다.
		              <p align="center">아이디: <%=user.getId() %><br>
		                                패스워드: <%=user.getPass() %><br><br>
		                 <a href="userconfirm.jsp">로그인 화면</a>                   
		              </p>
		           </td>
		         </tr>
		      </table>
			<%
			
		} else {
			
			%>
			<table width="330" border="0" cellpadding="5">
		        <tr bgcolor="#3399cc">
		          <td><b>가입이 되지않았습니다.<br>
		                    입력내용을 다시 한번 확인해 주세요.</b></td>
		        </tr>
		        <tr>
		          <td>            
		             <p align="center">입력이 정확한 경우에도 가입이 되지 않는 경우
		              관리자에게 문의하여 주십시요.  <br>  
		                <a href="javascript:history.back()">이전화면</a>               
		             </p>
		          </td>
		        </tr>
		     </table>     
			<%
		}
	}
	
%>

 
  </center>
</body>
</html>