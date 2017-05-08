package com.kosta.t0502;

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

public class EmpDAO {

	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	Properties prop;
	
	public EmpDAO(String rootPath) {
	
		try {
			prop = new Properties();
			prop.load(new FileReader(rootPath+"conn/conn.properties"));
			System.out.println(prop.getProperty("driver"));
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}  catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
	}
	
	public void connect(){
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","scott2","tiger");
			System.out.println("DB연결 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
		
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<EMP> select(){
		connect();
		ArrayList<EMP> emp = new ArrayList<>();
		
		try {
			
			String sql = "select empno, ename, to_char(hiredate,'yyyy/mm/dd') hiredate, sal, dname from emp natural join dept";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				emp.add(new EMP(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
			}
			
			return emp;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			disconnect();
		}
		return emp;
	}
	
//	public static void main(String[] args) {
//		new EmpDAO();
//	}

}
