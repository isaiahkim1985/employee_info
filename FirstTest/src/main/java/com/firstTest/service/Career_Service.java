package com.firstTest.service;

import java.util.List;

import com.firstTest.vo.Career_VO;

public interface Career_Service {
	
	public List<Career_VO> c_List(Career_VO cvo);
	public int c_Insert(Career_VO cvo);
	public int c_Update(Career_VO cvo);
	public int c_Delete(Career_VO cvo);

}
