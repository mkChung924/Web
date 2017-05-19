package com.kosta.guest.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.guest.dto.Guest;

import iba.conf.MySqlMapClient;

public class GuestDAO {
	
	SqlMapClient sqlMap;

	
	public GuestDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();

	}
	
	public ArrayList<Guest> select(){
		ArrayList<Guest> list = null;
		
		try {
			list = (ArrayList<Guest>) sqlMap.queryForList("guest.select");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public ArrayList<Guest> selectPage(int page, int recordCount){
		int max = page*recordCount;
		int min = max-(recordCount-1);
		ArrayList<Guest> list = null;
		
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("min", min);
			map.put("max", max);
			
			list = (ArrayList<Guest>) sqlMap.queryForList("guest.selectPage", map);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public boolean insert(Guest guest){
		
		try {
			String t = (String) sqlMap.insert("guest.insert", guest);
			//System.out.println("insert: "+t);
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean update(Guest guest){
		
		try {
			int t = sqlMap.update("guest.update",guest);
			System.out.println("t: " + t);
			if(t==1) return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean delete(String id){
		
		try {
			int t = sqlMap.delete("guest.delete",id);
			if(t==1) return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public Guest selectOne(String id){
		Guest guest = null;
		
		try {
			guest = (Guest) sqlMap.queryForObject("guest.selectOne", id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return guest;
		
	}
	
	public boolean passCheck(String pass, String id){
		
		try {
			String ppass = (String) sqlMap.queryForObject("guest.passCheck",id);
			System.out.println(ppass);
			if(ppass == null){
				return false;
			}
			if(ppass.equals(pass)){
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public int count(){
		int count = 0;
		
		try {
			count = (Integer) sqlMap.queryForObject("guest.count");
			
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	
}
