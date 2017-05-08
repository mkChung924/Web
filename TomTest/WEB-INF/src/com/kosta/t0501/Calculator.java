package com.kosta.t0501;

import java.text.DecimalFormat;

public class Calculator {//�ΰ��� ���� �Է¹޾� ���� ��� �����͸� ������ִ� Ŭ����
	private int x;
	private int y;
	private String operator;
	private int result;
	private double result2;
	private int mod;
	
	public Calculator(int x, int y, String operator) {
		this.x = x;
		this.y = y;
		this.operator = operator;
		
		choice();
	}//������
	
	private void choice(){//���õ� �����ڿ� ���� �˸��� �޼ҵ� ȣ��!
	
		switch(operator){
		
		case "+" :
			plus();
			break;
			
		case "-" :
			minus();
			break;
		
		case "x" :
			multiply();
			break;
		
		case "/" :
			divide();
			break;
			
		default : break;
			
		}
	}
	
	public String getResult(){
		if(operator.equals("/")){
		return "�����: " + x + operator + y + " = " + result2;
		} else {
			return "�����: " + x + operator + y + " = " + result;
		}
	}
	
	private void plus(){
		result = x + y;
	}
	
	private void minus(){
		result = x - y;
	}
	
	private void multiply(){
		result = x * y;
	}
	
	private void divide(){
		DecimalFormat df = new DecimalFormat("#.##");
		result2 = Double.valueOf(df.format((x/(double)y)));
	}
}
