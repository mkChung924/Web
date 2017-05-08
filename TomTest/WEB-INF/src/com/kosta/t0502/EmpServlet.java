package com.kosta.t0502;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmpServlet extends HttpServlet{
	
	EmpDAO dao;
	ArrayList<EMP> emp;
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		emp = new ArrayList<>();
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>��� ����Ʈ</title></head><center><body>");
		out.print("<h3>��� ����Ʈ</h3><hr>");
		
		out.print("<table border=1 cellspacing=0 cellpadding=11>");
		out.print("<tr bgcolor=orange><th>�����ȣ</th><th>����̸�</th><th>�Ի���</th><th>����</th><th>�μ���</th></tr>");
		

		
		//ServletConfig(���� ���� �Ѱ�)		
		//ServletContext(���� ������ ����Ǵ� WebContext��ü --> TomTest)
		
		ServletContext application = getServletContext();
		//System.out.println("TomTest(���ؽ�Ʈ)�� �������: " + application.getRealPath("/"));
		dao = new EmpDAO(application.getRealPath("/"));
		emp = dao.select();
		
		for(int i = 0; i < emp.size(); i++){
			
			out.print("<tr>");
			out.print("<td><center>" + emp.get(i).getEmpno() +"</td>");
			out.print("<td><center>" + emp.get(i).getEname() +"</td>");
			out.print("<td><center>" + emp.get(i).getHiredate() +"</td>");
			out.print("<td><center>" + emp.get(i).getSalary() +"</td>");
			out.print("<td><center>" + emp.get(i).getDname() +"</td>");
			out.print("</tr>");
			
		}

		out.print("</table>");
		
		out.print("</center></body></html>");
		
	}

}
