package com.firstTest.service;

import java.util.List;

import com.firstTest.vo.Skill_VO;

public interface Skill_Service {
	
	public List<Skill_VO> s_List(Skill_VO svo);
	public int s_Insert(Skill_VO svo);
	public int s_Update(Skill_VO svo);
	public int s_Delete(Skill_VO svo);

}
