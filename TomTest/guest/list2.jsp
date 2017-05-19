<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 리스트</title>
<link rel="stylesheet" type="text/css" href="/TomTest/css/guest.css">
</head>
<%--list.jsp --%>
<body>

	<center>
		<h3>방명록: 리스트</h3>
		<hr>
		<a href="guest?action=form" >방명록 쓰기</a> 
		<br><br>
		
		<table border=1 cellspacing=1 cellpadding=5>
		<tr class="td" ><th>번호</th><th>작성자</th><th>전화번호</th><th>작성일</th><th>내용</th></tr>
			<c:forEach items="${list }" var="guest">
			<tr>
				<td>${guest.id }</td>
				<td>${guest.name }</td>
				<td>${guest.tel }</td>
				<td>${guest.gdate }</td>
				<td><a href="guest?action=edit&id=${guest.id }" >${guest.contents }</a></td>
			</tr>
			</c:forEach>
		
		</table>
		<br>
		<c:forEach begin="1" end="${totalPage }" var="i">
			[<a href="guest?page=${i }">${i }</a>]
		</c:forEach>
		<br><br>
		<c:if test="${page == 1 }">
		이전
		</c:if>
		<c:if test="${page > 1 }">
		<a href="guest?page=${page-1 }">이전</a>
		</c:if>
		<c:if test="${page == totalPage}">
		다음
		</c:if>
		<c:if test="${page < totalPage}">
		<a href="guest?page=${page+1 }">다음</a>
		</c:if>

	</center>


</body>
</html>