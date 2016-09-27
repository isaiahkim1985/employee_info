package com.firstTest.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.firstTest.vo.Career_VO;
import com.firstTest.dao.Career_DAO;


@Service
@Transactional
public class Career_ServiceImpl implements Career_Service {

	
	@Autowired
	private Career_DAO career_DAO;
	
	@Override
	public List<Career_VO> c_List(Career_VO cvo) {
		List<Career_VO> myList = null;
		myList = career_DAO.c_List(cvo);
		return myList;
	}

	@Override
	public int c_Insert(Career_VO cvo) {
		int resurt=0;
		resurt = career_DAO.c_Insert(cvo);
		return resurt;
	}

	@Override
	public int c_Update(Career_VO cvo) {
		int result = 0;
		result = career_DAO.c_Update(cvo);
		return result;
	}

	@Override
	public int c_Delete(Career_VO cvo) {
		int result = 0;
		result = career_DAO.c_Delete(cvo);
		return result;
	}

}
