package com.kosta.t0512.mission;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserInfoDao {
	
	Context ctx;
	Context tomCtx;
	DataSource ds;
	Connection conn;
	
	public UserInfoDao() {
		
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
			
			if(conn!=null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public HashMap<String, Boolean> select_login(String id, String pass){
		connect();
		HashMap<String, Boolean> map = new HashMap<>();
			
		try {
			
			String sql = "select pass from userinfo where id =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				String spass = rs.getString(1);
				if(spass.equals(pass)){
					map.put("id", true);
					map.put("pass", true);
					
				} else {
					map.put("id", true);
					map.put("pass", false);
				}
				
				return map;
				
			} else {
				map.put("id", false);
				map.put("pass", false);
				return map;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return map;
		
	}
	
	public boolean insert(UserInfo user){
		connect();
		
		try {
			//String sql = "insert into userinfo values('"+user.getId()+"', '"+user.getPass()+"',  '"+name+"', '"+jumin+"', '"+birth+"', '"+zip+"', '"+addr+"', '"+email+"', '"+job+"')";
			String sql2 = "insert into userinfo values(?,?,?,?,?,?,?,?,?)";
			//PreparedStatement pstmt = conn.prepareStatement(sql);
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, user.getId());
			pstmt2.setString(2, user.getPass());
			pstmt2.setString(3, user.getName());
			pstmt2.setString(4, user.getJumin());
			pstmt2.setString(5, user.getBirth());
			pstmt2.setString(6, user.getZip());
			pstmt2.setString(7, user.getAddr());
			pstmt2.setString(8, user.getEmail());
			pstmt2.setString(9, user.getJob());
			
			int suc = pstmt2.executeUpdate();
			
			if(suc > 0){
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return false;
		
	}
	
	public UserInfo select(String id){
		UserInfo user = new UserInfo();
		connect();
		try {
			String sql="select pass, name, jumin, birth, zip, addr, email, job from userinfo where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				user.setId(id);
				user.setPass(rs.getString(1));
				user.setName(rs.getString(2));
				user.setJumin(rs.getString(3));
				user.setBirth(rs.getString(4));
				user.setZip(rs.getString(5));
				user.setAddr(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setJob(rs.getString(8));
								
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			disconnect();
		}
		
		return user;
	}
	
	public String update(UserInfo user){
		connect();
		
		try {
			String sql = "update userinfo set pass=?, zip=?, addr=?, email=?, job=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getPass());
			pstmt.setString(2, user.getZip());
			pstmt.setString(3, user.getAddr());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getJob());
			pstmt.setString(6, user.getId());
			int t = pstmt.executeUpdate();
			
			if(t==1) return "success";
			else return "fail";
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return "fail_db";
		
		
	}
	
	public boolean delete(String id){
		
		connect();
		
		try {
			String sql = "delete from userinfo where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int t = pstmt.executeUpdate();
			
			if(t==1) return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
		
		disconnect();
		}
		
		return false;
	}
	
	public boolean idCheck(String id){//아이디 중복검사
		//중복된 아이디: true
		connect();
		try {
			String sql = "select count(*) from userinfo where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			
			if(count==1) return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		
			disconnect();
		}
		return false;
		
	}

}
