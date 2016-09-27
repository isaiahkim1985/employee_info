package com.firstTest.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.firstTest.dao.Skill_DAO;
import com.firstTest.vo.Skill_VO;


@Service
@Transactional
public class Skill_ServiceImpl implements Skill_Service {

	
	@Autowired
	private Skill_DAO skill_DAO;
	
	@Override
	public List<Skill_VO> s_List(Skill_VO svo) {
		List<Skill_VO> myList = null;
		myList = skill_DAO.s_List(svo);
		return myList;
	}
	@Override
	public int s_Insert(Skill_VO svo) {
		int result = 0;
		result = skill_DAO.s_Insert(svo);
		return result;
	}

	@Override
	public int s_Update(Skill_VO svo) {
		int result = 0;
		result = skill_DAO.s_Update(svo);
		return result;
	}

	@Override
	public int s_Delete(Skill_VO svo) {
		int result = 0;
		result = skill_DAO.s_Delete(svo);
		return result;
	}

}
