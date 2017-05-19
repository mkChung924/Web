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

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.t0516.dto.Emp;
import com.kosta.t0516.dto.Emp2;

import iba.conf.MySqlMapClient;

public class EmpDAO4 {//DB 전담 클래스(모델 클래스)

	SqlMapClient sqlMap;

	public EmpDAO4() {
		
		sqlMap = MySqlMapClient.getSqlMapInstance();
		

	}
	
	public ArrayList<Emp2> selectAll(){
		ArrayList<Emp2> list = null;
		
		try {
			
			list = (ArrayList<Emp2>) sqlMap.queryForList("selectAll");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
}
