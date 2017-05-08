package com.kosta.t0501;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{
	
	//����: �Ѱ��� �������� ȭ�鱸��.
	
	/*
	 * (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 * 
	 * ���� ������: http://������:��Ʈ��ȣ//TomTest/servlet/com.kosta.t0501.myServlet
	 * ---> ���Ȼ� ���� �߻�
	 * 
	 * web.xml�� �ۼ��� ���� Ŭ������ ���.
	 * ----> ������ ������ ��θ� ���ν��Ѽ� ȣ��.
	 */
	

	@Override
	public void init() throws ServletException {
		//���� �ʱ�ȭ, ����(MyServlet)�� �޸� ������ ������� 1�� ȣ��
		System.out.println("init()");
		
	}
	
	

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���� ����(��������� ȭ�� ����)
		System.out.println("service()");
		
		//�ѱ�
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();

		out.print("<html><head><title>MyServlet</title></head><body>");
		out.print("<h3>ServletTest</h3><hr>");
		for(int i = 0; i < 10; i++){
			if(i%2 == 0){
				out.print("<b><font color='red'>�ȳ� ����~!!</font></b><br>");
			} else {
				out.print("<b><font color='blue'>�ȳ� ����~!!</font></b><br>");
			}
		}
		out.println("</body></html>");
		
		
	}

	@Override
	public void destroy() {
		//���� �޸� �Ҹ� �� ȣ��(���� ������ ���� �� �۾�)
		System.out.println("desctroy()");
	}

}
