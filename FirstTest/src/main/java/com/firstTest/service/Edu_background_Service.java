package com.firstTest.service;

import java.util.List;
import com.firstTest.vo.Edu_background_VO;

public interface Edu_background_Service {
	
	public List<Edu_background_VO> edu_List(Edu_background_VO evo);
	public int edu_Insert(Edu_background_VO evo);
	public Edu_background_VO edu_Detail(Edu_background_VO evo);
	public int edu_Update(Edu_background_VO evo);
	public int edu_Delete(Edu_background_VO evo);

}
