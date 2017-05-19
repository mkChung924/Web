package com.kosta.guest.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.guest.dao.GuestDAO;
import com.kosta.guest.dto.Guest;


public class GuestController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		GuestDAO dao = new GuestDAO();
		
		if(action != null){
			
			switch(action){
			
//			case "list":
//				System.out.println(action);
//
//				ArrayList<Guest> list = dao.select();
//				
//				req.setAttribute("list", list);
//				
//				System.out.println("hahaha");
//				req.getRequestDispatcher("/guest/list.jsp").forward(req, res);
//				
//				break;
				
			case "list":
				System.out.println(action);
				
				String pageStr = req.getParameter("page");
				int page;
				
				if(pageStr==null){
					page = 1;
				} else {
					page = Integer.parseInt(pageStr);
				}
				
				/*
				 * 한 페이지(한 화면)에 보여질 레코드 수: recordCount
				 * 전체 레코드 수: totalRecord
				 * 전체 페이지 수: totalPage
				 */
				int recordCount=5;
				int totalRecord = dao.count();
				int totalPage = totalRecord/recordCount;
				if(totalRecord%recordCount > 0){
					totalPage++;
				}

				ArrayList<Guest> list = dao.selectPage(page, recordCount);
				
				req.setAttribute("list", list);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("page", page);
				
				System.out.println("hahaha");
				req.getRequestDispatcher("/guest/list2.jsp").forward(req, res);
				
				break;
				
				
			case "insert":
				System.out.println(action);
				
//				System.out.println(req.getParameter("name"));
//				System.out.println(req.getParameter("pass"));
//				System.out.println(req.getParameter("email"));
//				System.out.println(req.getParameter("tel"));
//				System.out.println(req.getParameter("contents"));

				Guest guest = new Guest(req.getParameter("name"), req.getParameter("pass"), req.getParameter("email"), req.getParameter("tel"), req.getParameter("contents"));
				
				boolean t = dao.insert(guest);
				System.out.println("boolean:" +t);
				if(t){
					out.print("<script type='text/javascript' charset='UTF-8'>alert('complete!'); location.replace('guest');</script>");
					//res.sendRedirect("guest");
				} else {
					out.print("<script>alert('failed!');</script>");
				}
						
				break;
				
			case "edit":
				System.out.println(action);	
				//System.out.println(req.getParameter("id"));
				
				String id = req.getParameter("id");
				
				Guest tguest = dao.selectOne(id);
				
				req.getSession().setAttribute("guest", tguest);
				req.setAttribute("guest", tguest);
				req.getRequestDispatcher("/guest/editForm.jsp").forward(req, res);
				break;
				
			case "update":
				System.out.println(action);
				
				//boolean t1 = dao.insert(uguest);
				boolean t2 = dao.passCheck(req.getParameter("pass"), req.getParameter("id"));
				System.out.println(t2);
				
				if(t2){
					Guest uguest = new Guest(Integer.parseInt(req.getParameter("id")), req.getParameter("name"), req.getParameter("pass"), req.getParameter("email"), req.getParameter("tel"), req.getParameter("contents"));
					boolean t3 = dao.update(uguest);
					
					if(t3){
						out.print("<script>alert('complete'); location.replace('guest');</script>");
					} else {
						out.print("<script>alert('failed'); history.back();</script>");
					}
				} else {
					out.print("<script>alert('wrong password'); history.back();</script>");
				}
//				
//				if(t1){
//					out.print("<script>alert('complete'); location.href='guest'</script>");
//				} else {
//					out.print("<script>alert('failed');</script>");
//				}
				break;
				
			case "delete":
				System.out.println(action);
				String id2 = req.getParameter("id");
				boolean t4 = dao.passCheck(req.getParameter("pass"), id2);
				
				if(t4){
					boolean t5 = dao.delete(id2);
					
					if(t5){
						out.print("<script>alert('deleted'); location.replace('guest');</script>");
					} else {
						out.print("<script>alert('failed'); history.back();</script>");
					}
					
				} else {
					out.print("<script>alert('wrong password'); history.back();</script>");
				}
				
				break;
				
			case "form":
				System.out.println(action);
				req.getRequestDispatcher("/guest/inputForm.jsp").forward(req, res);
				break;
				
			}
			

		} else {
		
		System.out.println("list");
		
		String pageStr = req.getParameter("page");
		int page;
		if(pageStr==null){
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		
		/*
		 * 한 페이지(한 화면)에 보여질 레코드 수: recordCount
		 * 전체 레코드 수: totalRecord
		 * 전체 페이지 수: totalPage
		 */
		int recordCount=5;
		int totalRecord = dao.count();
		int totalPage = totalRecord/recordCount;
		if(totalRecord%recordCount > 0){
			totalPage++;
		}

		ArrayList<Guest> list = dao.selectPage(page, recordCount);
		
		req.setAttribute("list", list);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);
		
		req.getRequestDispatcher("/guest/list2.jsp").forward(req, res);
		
		}
	}

}
