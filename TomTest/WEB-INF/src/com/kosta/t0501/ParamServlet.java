package com.kosta.t0501;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ParamServlet extends HttpServlet{
	
	//클라이언트가 전달한 파라미터값 얻기
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet()");
		doPost(req,resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost()");
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>전달파라미터테스트</title></head><body>");
		out.print("<h3>파라미터 테스트</h3><hr>" );
		out.print("아이디: " + id);
		out.print("</br>비번: " + pass +"</body></html>");
		
	}


}
