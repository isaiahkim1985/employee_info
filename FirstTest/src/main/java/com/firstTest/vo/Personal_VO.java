package com.firstTest.vo;

import com.firstTest.common.vo.Main_CommonVO;

public class Personal_VO extends Main_CommonVO {
	
	private int p_num = 0;			//사원번호
	private String p_name = "";		//사원이름
	private String p_number = "";	//사원 주민번호
	private String p_sex = ""; 		//사원 성별
	private String p_phone = "";		//사원 유선전화번호
	private String p_cell = "";		//사원 무선전화번호
	private String p_company = "";	//소속회사
	private String p_join = "";		//입사일
	private String p_dept = "";		//부서
	private String p_position = "";	//직위
	private String pm_complete = "";	//병역(필미필)
	private String pm_start = "";	//입대일
	private String pm_end = "";		//제대일
	private String pm_branch = "";	//역종병과
	private String p_marriage = "";	//혼인여부
	private String p_email = "";		//이메일
	private String p_addr = "";		//주소
	
	
	public Personal_VO() {
		
	}


	public Personal_VO(int p_num, String p_name, String p_number, String p_sex, String p_phone, String p_cell,
			String p_company, String p_join, String p_dept, String p_position, String pm_complete, String pm_start,
			String pm_end, String pm_branch, String p_marriage, String p_email, String p_addr) {
		
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_number = p_number;
		this.p_sex = p_sex;
		this.p_phone = p_phone;
		this.p_cell = p_cell;
		this.p_company = p_company;
		this.p_join = p_join;
		this.p_dept = p_dept;
		this.p_position = p_position;
		this.pm_complete = pm_complete;
		this.pm_start = pm_start;
		this.pm_end = pm_end;
		this.pm_branch = pm_branch;
		this.p_marriage = p_marriage;
		this.p_email = p_email;
		this.p_addr = p_addr;
	}


	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_number() {
		return p_number;
	}


	public void setP_number(String p_number) {
		this.p_number = p_number;
	}


	public String getP_sex() {
		return p_sex;
	}


	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
	}


	public String getP_phone() {
		return p_phone;
	}


	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}


	public String getP_cell() {
		return p_cell;
	}


	public void setP_cell(String p_cell) {
		this.p_cell = p_cell;
	}


	public String getP_company() {
		return p_company;
	}


	public void setP_company(String p_company) {
		this.p_company = p_company;
	}


	public String getP_join() {
		return p_join;
	}


	public void setP_join(String p_join) {
		this.p_join = p_join;
	}


	public String getP_dept() {
		return p_dept;
	}


	public void setP_dept(String p_dept) {
		this.p_dept = p_dept;
	}


	public String getP_position() {
		return p_position;
	}


	public void setP_position(String p_position) {
		this.p_position = p_position;
	}


	public String getPm_complete() {
		return pm_complete;
	}


	public void setPm_complete(String pm_complete) {
		this.pm_complete = pm_complete;
	}


	public String getPm_start() {
		return pm_start;
	}


	public void setPm_start(String pm_start) {
		this.pm_start = pm_start;
	}


	public String getPm_end() {
		return pm_end;
	}


	public void setPm_end(String pm_end) {
		this.pm_end = pm_end;
	}


	public String getPm_branch() {
		return pm_branch;
	}


	public void setPm_branch(String pm_branch) {
		this.pm_branch = pm_branch;
	}


	public String getP_marriage() {
		return p_marriage;
	}


	public void setP_marriage(String p_marriage) {
		this.p_marriage = p_marriage;
	}


	public String getP_email() {
		return p_email;
	}


	public void setP_email(String p_email) {
		this.p_email = p_email;
	}


	public String getP_addr() {
		return p_addr;
	}


	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}
	
	
	
	
	
	
	

}
