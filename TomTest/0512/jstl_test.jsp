<%@page import="com.kosta.t0510.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL 테스트</title>
</head>
<%-- jstl_test.jsp --%>
<body>
	<h3>JSPL(JSP Standard Tag Library) 테스트</h3>
	<hr>
	<%-- <if(){} %> --%>
	<c:if test="true">
		HTML 마크업, text<br>
		조건식 참일때 실행<br>
	</c:if>
	<c:if test="some text">
		some text<br>
	</c:if>
	<c:if test="${2<3 }">
		2<3<br>
	</c:if>
	
	<c:if test="${param.age < 20 }">
		<font color='blue'>나이가 20세 미만입니다.</font><br>
	</c:if>
	
	<c:if test="${param.age >= 20 }">
		<font color='blue'>나이가 20세 이상입니다.</font><br>
	</c:if>
	
	<c:if test="${param.age >= 20 && param.age < 30}"><br>
		<font color='red'>나이가 20대 입니다.</font>
	</c:if>
	
	<hr>
	<%--20대 ~ 30대 체크 --%>
	<c:choose>
		<c:when test="${param.age > 19 && param.age < 30 }">
			20대 입니다.<br>
		</c:when>
		<c:when test="${param.age > 29 && param.age < 40 }">
			30대 입니다.<br>
		</c:when>

		<c:otherwise>
			20대 또는 30대가 아닙니다.<br>
		</c:otherwise>
	</c:choose>
	
	<hr>
	<h4>forEach 테스</h4>
	<%-- for each 테스트 --%>
	<c:forEach var="i" begin="3" end="10" varStatus="stat" step="2">
		Index: ${stat.index } Count: ${stat.count }
		<c:if test="${stat.count%2==1 }">
		<font color='red'>안녕 ${i } </font><br>
		</c:if>
		<c:if test="${stat.count%2==0 }">
		<font color='blue'>안녕 ${i }</font><br>
		</c:if>
	</c:forEach>
	<hr>
	<%
		//Controller에서 ArrayList저장된 데이터가 있다는 가정.
		
		ArrayList<String> list = new ArrayList<>();
		list.add("나길동");
		list.add("차라임");
		list.add("정주원");
		list.add("김유신");
		list.add("정명규");
		
		request.setAttribute("nameList", list);
		
		ArrayList<Person> list2 = new ArrayList<>();
		list2.add(new Person("나길동", "학생", 13));
		list2.add(new Person("차라임", "학생", 15));
		list2.add(new Person("정주원", "학생", 17));
		list2.add(new Person("김유신", "학생", 19));
		list2.add(new Person("정명규", "학생", 27));
		
		request.setAttribute("personList", list2);
		
	%>
	
	<h3>이름목록</h3>
	<hr>
	
	<ul>
		<c:forEach items="${nameList }" var="name">
			<li>${name }</li>		
		</c:forEach>
	</ul>
	<hr>
	<h3>사람목록</h3>
	<%
	ArrayList<Person> al = (ArrayList<Person>) request.getAttribute("personList"); 
	%>
	<table border=1 cellspacing=0 cellpadding=5>
	<tr bgcolor='orange'><th>이름</th><th>나이</th><th>직업</th></tr>
		<%for(int i = 0; i < al.size(); i++){
			Person p = al.get(i);
			%>
			<tr><td><%=p.getName() %></td><td><%=p.getAge() %></td><td><%=p.getJob() %></td></tr>
			<%
		}
		%>
		
	</table>
	<hr>
	<h3>사람목록2</h3>
	<table border=1 cellspacing=0 cellpadding=5>
		<tr bgcolor='orange'><th>이름</th><th>나이</th><th>직업</th></tr>
		<c:forEach items="${personList }" var="pp">
			<tr><td>${pp.name }</td><td>${pp.age }</td><td>${pp.job }</td></tr>
		</c:forEach>
		
	</table>

	
</body>
</html>