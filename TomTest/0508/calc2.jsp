<%@page import="com.kosta.t0501.Calculator"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<h3>계산기폼</h3>
	<hr>
	<form name='calcForm' method="post">
	<input type='text' size=5 name='su1'>
	<select name="oper">
		<option>+</option>
		<option>-</option>
		<option>x</option>
		<option>/</option>
	</select>
	<input type='text' size=5 name='su2'>
	<button type='submit'>계산</button>
	</form>
	
	<%! 
	int sum;
	double sum2;
	int su_1, su_2;
	String method;
	%>

	<%
	
	method = request.getMethod();
	if(method.equals("POST")){

		String su1 = request.getParameter("su1"); 
		String su2 = request.getParameter("su2");
		String oper = request.getParameter("oper");
		

		if(!su1.trim().isEmpty() && !su2.trim().isEmpty()){
			if(su1.matches("[0-9]+") || su1.matches("[0-9]+")){
				
				if(su2.equals("0") && oper.equals("/")){
					out.print("<br> 0으로 나눌 수 없습니다.");
				} else {
					
					Calculator calc = new Calculator(Integer.parseInt(su1), Integer.parseInt(su2), oper);
					out.print("<br>"+calc.getResult());
					
					su_1 = Integer.parseInt(su1);
					su_2 = Integer.parseInt(su2);
					
					switch(oper){
					
					case "+":
						sum = su_1 + su_2;
						break;
					case "-":
						sum = su_1 - su_2;
						break;
					case "x":
						sum = su_1 * su_2;
						break;
					case "/":
						
						DecimalFormat df = new DecimalFormat("#.##");
						sum2 = Double.valueOf(df.format((su_1/(double)su_2)));
						break;
						
						default:break;
					}
	
					if(oper.equals("/")){
						out.print("<br>결과값: "+ su_1 + "" +oper+ "" + su_2 + " = " + sum2);
						
					} else {
						out.print("<br>결과값: "+ su_1 + "" +oper+ "" + su_2 + " = " + sum);
						
					}
					
					%>
					<script type="text/javascript">
          			 document.calcForm.su1.value=<%= su_1 %>;
          			 document.calcForm.su2.value=<%= su_2 %>;
          			 document.calcForm.oper.value='<%= oper %>';
          			 </script>
					<%

				}
				
			} else {
				
				out.print("<br><font color='red'>숫자만 입력하세요.</font>");
			}
			
		} else {
			out.print("<br><font color='red'>숫자를 입력하세요.</font>");
		}
	}
	%>
	
	</center>
</body>
</html>