package com.firstTest.vo;

public class Training_VO {
	
	private int p_num = 0;			//사원번호
	private int t_num = 0;			//교육번호
	private String t_name = "";			//교육명
	private String t_start = "";		//시작일
	private String t_end = "";			//종료일
	private String t_institution = "";	//교육기관
	
	
	public Training_VO() {
		
	}


	public Training_VO(int p_num, int t_num, String t_name, String t_start, String t_end, String t_institution) {
		super();
		this.p_num = p_num;
		this.t_num = t_num;
		this.t_name = t_name;
		this.t_start = t_start;
		this.t_end = t_end;
		this.t_institution = t_institution;
	}


	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
	}


	public int getT_num() {
		return t_num;
	}


	public void setT_num(int t_num) {
		this.t_num = t_num;
	}


	public String getT_name() {
		return t_name;
	}


	public void setT_name(String t_name) {
		this.t_name = t_name;
	}


	public String getT_start() {
		return t_start;
	}


	public void setT_start(String t_start) {
		this.t_start = t_start;
	}


	public String getT_end() {
		return t_end;
	}


	public void setT_end(String t_end) {
		this.t_end = t_end;
	}


	public String getT_institution() {
		return t_institution;
	}


	public void setT_institution(String t_institution) {
		this.t_institution = t_institution;
	}


	
	
	
	
	

}
