package com.firstTest.vo;

public class Skill_VO {

	private int p_num = 0; // 사원번호
	private int s_num = 0; // 기술번호
	private String s_ability = ""; // 보유기술명
	private String s_level = ""; // 숙련도
	
	
	public Skill_VO() {
		
	}


	public Skill_VO(int p_num, int s_num, String s_ability, String s_level) {
		
		this.p_num = p_num;
		this.s_num = s_num;
		this.s_ability = s_ability;
		this.s_level = s_level;
	}


	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
	}


	public int getS_num() {
		return s_num;
	}


	public void setS_num(int s_num) {
		this.s_num = s_num;
	}


	public String getS_ability() {
		return s_ability;
	}


	public void setS_ability(String s_ability) {
		this.s_ability = s_ability;
	}


	public String getS_level() {
		return s_level;
	}


	public void setS_level(String s_level) {
		this.s_level = s_level;
	}
	
	
	
	
	
	

}
