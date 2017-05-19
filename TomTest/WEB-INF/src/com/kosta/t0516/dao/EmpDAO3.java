package com.kosta.t0516.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.kosta.t0516.dto.Emp;

public class EmpDAO3 {//DB 전담 클래스(모델 클래스)
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//Properties pro; ----> DataSource
	DataSource ds;

	public EmpDAO3() {
	
			try {
				Context ctx = new InitialContext(); //Context: 객체 등록 bind rebind, 등록 lookup, 삭제 unbind
				Context tomCtx = (Context) ctx.lookup("java:comp/env");
				ds = (DataSource) tomCtx.lookup("jdbc/oracle"); //아파치 톰켓에 등록된 객체 조회
				
				//DB연결
				conn = ds.getConnection();
				System.out.println("연결성공");
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

	}
	
	public ArrayList<Emp> selectAll(){
		ArrayList<Emp> list = new ArrayList<>();
		
		try {
			
			//3.SQL실행 Statement stmt -- 속도, 보안(SQL) --> PreparedStatement pstmt
			String sql = "select empno, ename, hiredate from emp";
			pstmt = conn.prepareStatement(sql);
			
			//4.SQL 실생(조회)결과 얻어오기
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new Emp(rs.getInt(1), rs.getString(2), rs.getDate(3)));
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
}
