<%@page import="com.kosta.t0512.mission.UserInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.kosta.t0512.mission.UserInfo" id="user"></jsp:useBean>
<%--UserInfo user = new UserInfo(); --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty property="*" name="user"/>
<%-- user.setName(request.getParameter("name"); --%>
<%
	System.out.println("id="+request.getParameter("id"));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <center>
  
  <%
  		user.setZip(request.getParameter("zip1")+"-"+request.getParameter("zip2"));
  
  		UserInfoDao dao = new UserInfoDao();
  		
  		String result = dao.update(user);
  		
  		if(result.equals("success")){
  			
  			%>
  			
  		<table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>수정성공</b></td>
          </tr>
          <tr>
            <td>
               수정이 잘되었습니다<br><br>
               <a href="service.jsp">서비스페이지</a>
            </td>
          </tr>
       </table>   
       
  			<%	
  		} else if(result.equals("fail")){
  			%>
  			
  		<table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>수정실패</b></td>
          </tr>
          <tr>
            <td>
               정보수정이 되지않았습니다.<br>
               입력내용을 다시확인하시고 다시수정하시기 바랍니다.<br><br>
               <a href="javascript:history.go(-1)">이전화면</a>
            </td>
          </tr>
       </table>     
  			
  			<%
  			
  		} else {
  			%>
  	     <table width="280" border="0" cellpadding="5">
           <tr bgcolor="#3399cc">
             <td><b>수정실패</b></td>
           </tr>
           <tr>
             <td>
                정보수정이 되지않았습니다.<br>
                입력내용을 다시확인하시고 다시수정하시기 바랍니다.<br>
                입력이 정확한 경우에도 수정이 되지 않는 경우
                관리자에게 문의하여 주십시요.
                <br><br>
                <a href="javascript:history.back(0)">이전화면</a>
             </td>
           </tr>
        </table>  
  			
  			<%
  		}
  
  %>
  
       
  
    </center>
</body>
</html>







