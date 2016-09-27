package com.firstTest.dao;

import java.util.List;

import com.firstTest.vo.Personal_VO;

public interface Personal_DAO {
	
	public List<Personal_VO> main_List(Personal_VO pvo);
	public int main_ListCnt(Personal_VO pvo);
	public int p_Insert(Personal_VO pvo);
	public Personal_VO p_num_fk(Personal_VO pvo);
	public Personal_VO p_Detail(Personal_VO pvo);
	public int p_Update(Personal_VO pvo);
	public int p_Delete(Personal_VO pvo);
	public int juminOverlap(String p_number);
	public int mailOverlap(String p_email);

}
