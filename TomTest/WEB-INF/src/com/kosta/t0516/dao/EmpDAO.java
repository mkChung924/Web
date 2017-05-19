package com.kosta.t0516.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kosta.t0516.dto.Emp;

public class EmpDAO {//DB 전담 클래스(모델 클래스)
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public EmpDAO() {
		
		try {
			//1.드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.DB연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost/orcl", "scott2", "tiger");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
