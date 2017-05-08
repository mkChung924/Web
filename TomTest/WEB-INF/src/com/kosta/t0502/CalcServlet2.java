package com.kosta.t0502;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.t0501.Calculator;

public class CalcServlet2 extends HttpServlet{
	
	//Servlet(인터페이스) --- 구현 ---> GenericServlet --- 확장 ---> HttpServlet
	
	//서버 상태: 404(페이지 없음), 500(서버에러), 405(준비되지않은 메소드)
	
	/*
	 * <컨트롤러의 역할>	M---C---V
	 * 1. 사용자 요청 분석! (URL 분석)
	 * 2. 사용자 입력 데이터 얻어오기 getParameter(name);
	 * 3. 모델객체생성 - 메소드호출 - 호출결과 변수에 저장
	 * 4. 페이지이동 (forward, redirect)
	 * 
	 * (옵션) 5. 유효성검사
	 */
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//2.
		String su1 = req.getParameter("su1");
		String su2 = req.getParameter("su2");
		String oper = req.getParameter("oper");
		resp.setContentType("text/html;charset=UTF-8");//MIME형식 지정
		
		//5.
		
		if(su1.trim().isEmpty() || su2.trim().isEmpty()){
			
			PrintWriter out = resp.getWriter(); //PrintWriter
			out.print("<html><head></head><body><center>");
			out.println("<h3>에러페이지<h3><hr>");
			out.print("<font color='red'>값을 입력하세요.</font>");
			out.println("</center></body></html>");
			
		} else if(su1.trim().matches("[^0-9]+") || su2.trim().matches("[^0-9]+")){

				PrintWriter out = resp.getWriter(); //PrintWriter
				out.print("<html><head></head><body><center>");
				out.println("<h3>에러페이지<h3><hr>");
				out.print("<font color='red'>잘못된 접근입니다.</font>");
				out.println("</center></body></html>");
			
		} else {
			
			if(oper.equals("/") && su2.trim().equals("0")){
				
				PrintWriter out = resp.getWriter(); //PrintWriter
				out.print("<html><head></head><body><center>");
				out.println("<h3>에러페이지<h3><hr>");
				out.print("<font color='red'>0으로 나눌 수 없습니다.</font>");
				out.println("</center></body></html>");
				
			} else {
		
			//3.
			Calculator calc = new Calculator(Integer.parseInt(su1), Integer.parseInt(su2), oper);
			
			String result = calc.getResult();
			
			//4. 페이지이동(결과물 HTML 출력으로 대체)
			PrintWriter out = resp.getWriter(); //PrintWriter
			out.print("<html><head></head><body><center>");
			out.println("<h3>결과페이지<h3><hr>");
			out.print(result);
			out.println("</center></body></html>");
			}
		}
	}

}
