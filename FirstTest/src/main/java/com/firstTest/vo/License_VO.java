package com.firstTest.vo;

public class License_VO {
	
	private int p_num = 0;	//사원번호
	private int l_num = 0;	//자격증번호
	private String l_name = "";	//자격증명
	private String l_date = "";	//취득일
	
	
	public License_VO() {
		
	}


	public License_VO(int p_num, int l_num, String l_name, String l_date) {
		
		this.p_num = p_num;
		this.l_num = l_num;
		this.l_name = l_name;
		this.l_date = l_date;
	}


	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
	}


	public int getL_num() {
		return l_num;
	}


	public void setL_num(int l_num) {
		this.l_num = l_num;
	}


	public String getL_name() {
		return l_name;
	}


	public void setL_name(String l_name) {
		this.l_name = l_name;
	}


	public String getL_date() {
		return l_date;
	}


	public void setL_date(String l_date) {
		this.l_date = l_date;
	}
	
	
	
	
	
}
