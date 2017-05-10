package com.kosta.t0509;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmpDAO {
	
	Context ctx;
	Context tomCtx;
	DataSource ds;
	Connection conn;
	
	public EmpDAO() {
		
		try {
			ctx = new InitialContext();
			tomCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) tomCtx.lookup("jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		} 

	
	}
	
	public void connect(){
		try {
			conn = ds.getConnection();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
		try {
			if(conn!=null)conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EMP> selectGradeInfo(){
		connect();
		ArrayList<EMP> list = new ArrayList<>();
		
		try {
			String sql = "select empno, ename, dname, grade from emp natural join dept inner join salgrade on sal between losal and hisal";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){
				list.add(new EMP(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			disconnect();
		}
		
		return list;
	}

}
