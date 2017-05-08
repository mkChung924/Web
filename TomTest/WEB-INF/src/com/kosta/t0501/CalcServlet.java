package com.kosta.t0501;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcServlet extends HttpServlet{
	
	int count;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String method = req.getMethod(); //클라이언트 요청방식 : "GET", "POST"
		System.out.println("method: " + method);
		
		

		//계산기폼 출력
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>서블릿 계산기</title></head><body>");
		
		out.print("<center><h3><font face = Arial>서블릿 계산기</font></h3><hr>"
				+ "<form method='post'>"
				+ "<input type='text' size=5 name='su1' maxlength='5' >"
				+" <select name='oper' >"
				+"<option>+</option>"
				+"<option>-</option>"
				+"<option>*</option>"
				+"<option>/</option>"
				+"</select>"
				+ " <input type='text' size=5 name='su2' maxlength='5'>"
				+ " <input type='submit' value='계산'><br>");
		
		if(method.equals("POST")){
			System.out.println("POST 실행");
			String su1 = req.getParameter("su1");
			String su2 = req.getParameter("su2");
			String oper = req.getParameter("oper");
			
			Calculator calc = new Calculator(Integer.parseInt(su1),Integer.parseInt(su2),oper);
			
			String result = calc.getResult();
			
			out.print("<hr>" + result);
		}
		out.print("</form>"
				+ "</center></body></html>");
				

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>서블릿 계산기</title></head><body>");
		
		out.print("<center><h3><font face = Arial>서블릿 계산기</font></h3><hr>"
				+ "<form name ='calcForm' action='/calc.do' method='post'>"
				+ "<input type='text' size=5 name='su1' maxlength='5' value=''>"
				+"<select name='oper'>"
				+"<option>+</option>"
				+"<option>-</option>"
				+"<option>*</option>"
				+"<option>/</option>"
			+"</select>"
				+ "<input type='text' size=5 name='su2' maxlength='5'>"
				+ "<input type='submit' value='계산'><br>"
				+ "<br><font face = Arial>result :</font> <input type='text' size = 10 name='result' readonly>"
				+ "</form>"
				+ "</center></body></html>");

		String su1 = req.getParameter("su1");
		String su2 = req.getParameter("su2");
		String oper = req.getParameter("oper");
		
		System.out.println(su1 + oper + su2);
		
	}
}
