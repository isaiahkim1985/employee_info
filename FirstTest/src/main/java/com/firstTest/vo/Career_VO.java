package com.firstTest.vo;

public class Career_VO {
	
	
	private int p_num = 0;		//사원번호
	private int c_num = 0;		//경력번호
	private String c_name = "";		//회사명
	private String c_start = "";	//입사일
	private String c_end = "";		//퇴사일
	private String c_position = "";	//직위
	private String c_dept = "";		//부서
	
	
	
	public Career_VO() {
		
	}



	public Career_VO(int p_num, int c_num, String c_name, String c_start, String c_end, String c_position,
			String c_dept) {
		
		this.p_num = p_num;
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_start = c_start;
		this.c_end = c_end;
		this.c_position = c_position;
		this.c_dept = c_dept;
	}



	public int getP_num() {
		return p_num;
	}



	public void setP_num(int p_num) {
		this.p_num = p_num;
	}



	public int getC_num() {
		return c_num;
	}



	public void setC_num(int c_num) {
		this.c_num = c_num;
	}



	public String getC_name() {
		return c_name;
	}



	public void setC_name(String c_name) {
		this.c_name = c_name;
	}



	public String getC_start() {
		return c_start;
	}



	public void setC_start(String c_start) {
		this.c_start = c_start;
	}



	public String getC_end() {
		return c_end;
	}



	public void setC_end(String c_end) {
		this.c_end = c_end;
	}



	public String getC_position() {
		return c_position;
	}



	public void setC_position(String c_position) {
		this.c_position = c_position;
	}



	public String getC_dept() {
		return c_dept;
	}



	public void setC_dept(String c_dept) {
		this.c_dept = c_dept;
	}
	
	
	
	
	
	
	
	

}
