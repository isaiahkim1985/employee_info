package com.firstTest.dao;

import java.util.List;

import com.firstTest.vo.License_VO;

public interface License_DAO {
	
	public List<License_VO> l_List(License_VO lvo);
	public int l_Insert(License_VO lvo);
	public int l_Update(License_VO lvo);
	public int l_Delete(License_VO lvo);

}
