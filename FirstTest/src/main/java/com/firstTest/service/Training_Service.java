package com.firstTest.service;

import java.util.List;

import com.firstTest.vo.Training_VO;

public interface Training_Service {
	
	public List<Training_VO> t_List(Training_VO tvo);
	public int t_Insert(Training_VO tvo);
	public int t_Update(Training_VO tvo);
	public int t_Delete(Training_VO tvo);

}
