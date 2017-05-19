package com.kosta.t0516.dto;

import java.sql.Date;

public class Emp2 {
	
	private int empno;
	private String ename;
	private Date hiredate;
	
	public Emp2() {

	}

	public Emp2(int empno, String ename, Date hiredate) {
		this.empno = empno;
		this.ename = ename;
		this.hiredate = hiredate;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	
	

}
