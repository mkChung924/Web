package com.kosta.t0501;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ParamServlet extends HttpServlet{
	
	//Ŭ���̾�Ʈ�� ������ �Ķ���Ͱ� ���
	
	
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
		out.print("<html><head><title>�����Ķ�����׽�Ʈ</title></head><body>");
		out.print("<h3>�Ķ���� �׽�Ʈ</h3><hr>" );
		out.print("���̵�: " + id);
		out.print("</br>���: " + pass +"</body></html>");
		
	}


}
