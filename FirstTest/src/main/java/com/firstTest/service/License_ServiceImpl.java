package com.firstTest.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.firstTest.dao.License_DAO;
import com.firstTest.vo.License_VO;


@Service
@Transactional
public class License_ServiceImpl implements License_Service {

	
	@Autowired
	private License_DAO license_DAO;
	
	
	@Override
	public List<License_VO> l_List(License_VO lvo) {
		List<License_VO> myList = null;
		myList = license_DAO.l_List(lvo);
		return myList;
	}
	@Override
	public int l_Insert(License_VO lvo) {
		int result = 0;
		result = license_DAO.l_Insert(lvo);
		return result;
	}
	@Override
	public int l_Update(License_VO lvo) {
		int result = 0;
		result = license_DAO.l_Update(lvo);
		return result;
	}
	@Override
	public int l_Delete(License_VO lvo) {
		int result = 0;
		result = license_DAO.l_Delete(lvo);
		return result;
	}

}
