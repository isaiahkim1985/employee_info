package com.firstTest.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.firstTest.dao.Edu_background_DAO;
import com.firstTest.vo.Edu_background_VO;


@Service
@Transactional
public class Edu_background_ServiceImpl implements Edu_background_Service {

	
	@Autowired
	private Edu_background_DAO edu_background_DAO;
	
	
	@Override
	public List<Edu_background_VO> edu_List(Edu_background_VO evo) {
		List<Edu_background_VO> myList = null;
		myList = edu_background_DAO.edu_List(evo);
		return myList;
	}
	
	@Override
	public int edu_Insert(Edu_background_VO evo) {
		int result = 0;
		result = edu_background_DAO.edu_Insert(evo);
		return result;
	}

	@Override
	public Edu_background_VO edu_Detail(Edu_background_VO evo) {
		Edu_background_VO detail = null;
		detail = edu_background_DAO.edu_Detail(evo);
		return detail;
	}

	@Override
	public int edu_Update(Edu_background_VO evo) {
		int result = 0;
		result = edu_background_DAO.edu_Update(evo);
		return result;
	}

	@Override
	public int edu_Delete(Edu_background_VO evo) {
		int result = 0;
		result = edu_background_DAO.edu_Delete(evo);
		return result;
	}

}
