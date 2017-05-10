package com.kosta.t0509;

public class EMP {
	
	private int empno, grade;
	private String ename, dname;
	
	public EMP(int empno, String ename, String dname, int grade) {

		this.empno = empno;
		this.grade = grade;
		this.ename = ename;
		this.dname = dname;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
	
	
	
	

}
