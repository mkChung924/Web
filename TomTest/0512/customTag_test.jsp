<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/myTag.tld" prefix="my" %>

<!-- JSP2.0방식 -->
<%@taglib tagdir="/WEB-INF/tags" prefix="you" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커스텀태그테스트</title>
</head>
<%-- customTag_test.jsp --%>
<body>
<h3>커스텀태그 테스트</h3>
<hr>
<my:gildong></my:gildong>
<hr>
<you:juwon border="5" color="yellow">상품목록</you:juwon>

</body>
</html>