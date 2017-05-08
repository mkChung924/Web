package com.kosta.t0501;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{
	
	//서블릿: 한개의 웹페이지 화면구성.
	
	/*
	 * (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 * 
	 * 서블릿 실행방법: http://아이피:포트번호//TomTest/servlet/com.kosta.t0501.myServlet
	 * ---> 보안상 문제 발생
	 * 
	 * web.xml에 작성된 서블릿 클래스를 등록.
	 * ----> 서블릿에 가상의 경로를 매핑시켜서 호출.
	 */
	

	@Override
	public void init() throws ServletException {
		//서블릿 초기화, 서블릿(MyServlet)의 메모리 적재후 가장먼저 1번 호출
		System.out.println("init()");
		
	}
	
	

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서블릿 서비스(웹브라이저 화면 구성)
		System.out.println("service()");
		
		//한글
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();

		out.print("<html><head><title>MyServlet</title></head><body>");
		out.print("<h3>ServletTest</h3><hr>");
		for(int i = 0; i < 10; i++){
			if(i%2 == 0){
				out.print("<b><font color='red'>안녕 서블릿~!!</font></b><br>");
			} else {
				out.print("<b><font color='blue'>안녕 서블릿~!!</font></b><br>");
			}
		}
		out.println("</body></html>");
		
		
	}

	@Override
	public void destroy() {
		//서블릿 메모리 소멸 전 호출(서블릿 종료전 실행 할 작업)
		System.out.println("desctroy()");
	}

}
