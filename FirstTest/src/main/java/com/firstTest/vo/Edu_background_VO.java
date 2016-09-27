package com.firstTest.vo;

public class Edu_background_VO {
	
	private int p_num = 0;	//사원번호
	private int edu_num = 0;	//학력번호
	private String edu_name = "";	//학교명
	private String edu_date = "";	//입.졸업일
	private String edu_inout = "";	//입학졸업
	
	public Edu_background_VO() {
		
	}

	public Edu_background_VO(int p_num, int edu_num, String edu_name, String edu_date, String edu_inout) {
		
		this.p_num = p_num;
		this.edu_num = edu_num;
		this.edu_name = edu_name;
		this.edu_date = edu_date;
		this.edu_inout = edu_inout;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getEdu_num() {
		return edu_num;
	}

	public void setEdu_num(int edu_num) {
		this.edu_num = edu_num;
	}

	public String getEdu_name() {
		return edu_name;
	}

	public void setEdu_name(String edu_name) {
		this.edu_name = edu_name;
	}

	public String getEdu_date() {
		return edu_date;
	}

	public void setEdu_date(String edu_date) {
		this.edu_date = edu_date;
	}

	public String getEdu_inout() {
		return edu_inout;
	}

	public void setEdu_inout(String edu_inout) {
		this.edu_inout = edu_inout;
	}
	
	
	


	

}
