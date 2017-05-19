package com.kosta.t0516.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kosta.t0516.dto.Emp;

public class EmpDAO2 {//DB 전담 클래스(모델 클래스)
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Properties pro;

	public EmpDAO2(String rootPath) {
		
		try {
			pro = new Properties();
			pro.load(new FileReader(rootPath + "conn/conn.properties"));
			//1.드라이버 로딩
			Class.forName(pro.getProperty("driver"));
			//2.DB연결
			conn = DriverManager.getConnection(pro.getProperty("url"), pro);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
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
