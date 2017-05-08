package com.kosta.t0502;

public class EMP {
	
	private String ename, hiredate, dname, url;
	private int empno, salary;
	
	public EMP() {
		// TODO Auto-generated constructor stub
	}
	
	public EMP(String url){
		this.url = url;
	}

	public EMP(int empno, String ename, String hiredate, int salary, String dname) {
		this.empno = empno;
		this.ename = ename;
		this.hiredate = hiredate;
		this.dname = dname;
		this.salary = salary;
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

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	
	

}
