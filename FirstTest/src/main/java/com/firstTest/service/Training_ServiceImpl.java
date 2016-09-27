package com.firstTest.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.firstTest.dao.Training_DAO;
import com.firstTest.vo.Training_VO;


@Service
@Transactional
public class Training_ServiceImpl implements Training_Service {

	@Autowired
	private Training_DAO training_DAO;
	
	@Override
	public List<Training_VO> t_List(Training_VO tvo) {
		List<Training_VO> myList = null;
		myList = training_DAO.t_List(tvo);
		return myList;
	}

	@Override
	public int t_Insert(Training_VO tvo) {
		int result = 0;
		result = training_DAO.t_Insert(tvo);
		return result;
	}

	@Override
	public int t_Update(Training_VO tvo) {
		int result = 0;
		result = training_DAO.t_Update(tvo);
		return result;
	}

	@Override
	public int t_Delete(Training_VO tvo) {
		int result = 0;
		result = training_DAO.t_Delete(tvo);
		return result;
	}

}
