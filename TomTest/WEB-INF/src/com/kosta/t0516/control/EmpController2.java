package com.kosta.t0516.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.t0516.dao.EmpDAO3;
import com.kosta.t0516.dto.Emp;

public class EmpController2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		EmpDAO3 dao = new EmpDAO3();
		ArrayList<Emp> list = dao.selectAll();
		
		//뷰와 데이터 공유 - request(forward), session(forward, redirect)
		req.setAttribute("list", list);
		
		//4.
		req.getRequestDispatcher("/0516/emp6.jsp").forward(req, res);
		
	}

}
