package com.kosta.t0501;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CountServlet extends HttpServlet{
	int cnt;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		HttpSession session = req.getSession();
		String addr = req.getRemoteAddr();//접속 클라이언트의 ip정보
		System.out.println("접속 클라이언트["+addr+"]");
		
		if(session.isNew()) cnt++;
		
		resp.setContentType("text/html;charset=UTF-8");//한글처리
		//브라우저 출력객체
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>ServletCounter</title></head>");
		out.print("<body><h3>ServlentCounter</h3><hr>");
		out.print("조회수: " + cnt + "회</body></html>");
	}

}
