package com.kosta.t0502;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.t0501.Calculator;

public class CalcServlet2 extends HttpServlet{
	
	//Servlet(�������̽�) --- ���� ---> GenericServlet --- Ȯ�� ---> HttpServlet
	
	//���� ����: 404(������ ����), 500(��������), 405(�غ�������� �޼ҵ�)
	
	/*
	 * <��Ʈ�ѷ��� ����>	M---C---V
	 * 1. ����� ��û �м�! (URL �м�)
	 * 2. ����� �Է� ������ ������ getParameter(name);
	 * 3. �𵨰�ü���� - �޼ҵ�ȣ�� - ȣ���� ������ ����
	 * 4. �������̵� (forward, redirect)
	 * 
	 * (�ɼ�) 5. ��ȿ���˻�
	 */
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//2.
		String su1 = req.getParameter("su1");
		String su2 = req.getParameter("su2");
		String oper = req.getParameter("oper");
		resp.setContentType("text/html;charset=UTF-8");//MIME���� ����
		
		//5.
		
		if(su1.trim().isEmpty() || su2.trim().isEmpty()){
			
			PrintWriter out = resp.getWriter(); //PrintWriter
			out.print("<html><head></head><body><center>");
			out.println("<h3>����������<h3><hr>");
			out.print("<font color='red'>���� �Է��ϼ���.</font>");
			out.println("</center></body></html>");
			
		} else if(su1.trim().matches("[^0-9]+") || su2.trim().matches("[^0-9]+")){

				PrintWriter out = resp.getWriter(); //PrintWriter
				out.print("<html><head></head><body><center>");
				out.println("<h3>����������<h3><hr>");
				out.print("<font color='red'>�߸��� �����Դϴ�.</font>");
				out.println("</center></body></html>");
			
		} else {
			
			if(oper.equals("/") && su2.trim().equals("0")){
				
				PrintWriter out = resp.getWriter(); //PrintWriter
				out.print("<html><head></head><body><center>");
				out.println("<h3>����������<h3><hr>");
				out.print("<font color='red'>0���� ���� �� �����ϴ�.</font>");
				out.println("</center></body></html>");
				
			} else {
		
			//3.
			Calculator calc = new Calculator(Integer.parseInt(su1), Integer.parseInt(su2), oper);
			
			String result = calc.getResult();
			
			//4. �������̵�(����� HTML ������� ��ü)
			PrintWriter out = resp.getWriter(); //PrintWriter
			out.print("<html><head></head><body><center>");
			out.println("<h3>���������<h3><hr>");
			out.print(result);
			out.println("</center></body></html>");
			}
		}
	}

}
