package com.kosta.t0512;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosta.t0510.Person;

public class ServletController extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//모델객체를 호출한 결과를 영역(request ---> session ---> application)에 저장 pageContext 의미 없음(페이지 이동이 안됨)
		HttpSession session = request.getSession();
		//ServletContext application = session.getServletContext();
		ServletContext application = getServletContext();
		
		request.setAttribute("k1", "홍길동");
		session.setAttribute("k2", "길라임");
		application.setAttribute("k3", "김주원");
		
		Person p1 = new Person("김유신1", "화랑", 15);
		Person p2 = new Person("김유신2", "화랑", 16);
		Person p3 = new Person("김유신3", "화랑", 17);
		
		request.setAttribute("k4", p1);
		session.setAttribute("k4", p2);
		application.setAttribute("k4", p3);
		
		
		
		//페이지 이동(forward, redirect)
		String action = request.getParameter("action");
		RequestDispatcher dispatcher =  null;
		
		if(action == null || action.equals("test")){
			
			dispatcher = request.getRequestDispatcher("/0512/el_test.jsp");
			
		} else if(action.equals("login")){
			dispatcher = request.getRequestDispatcher("/0511/sessionT1.jsp");
		}
		dispatcher.forward(request, response);
		
	}

}
