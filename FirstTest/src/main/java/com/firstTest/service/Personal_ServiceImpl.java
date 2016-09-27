package com.firstTest.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.firstTest.dao.Personal_DAO;
import com.firstTest.vo.Personal_VO;



@Service
@Transactional
public class Personal_ServiceImpl implements Personal_Service {

	
	@Autowired
	private Personal_DAO personal_DAO;
	
	@Override
	public List<Personal_VO> main_List(Personal_VO pvo) {
		List<Personal_VO> myList = null;
		myList = personal_DAO.main_List(pvo);
		return myList;
	}

	@Override
	public int main_ListCnt(Personal_VO pvo) {
		// TODO Auto-generated method stub
		return personal_DAO.main_ListCnt(pvo);
	}

	@Override
	public int p_Insert(Personal_VO pvo) {
		int result = 0;
		result = personal_DAO.p_Insert(pvo);
		return result;
	}
	@Override
	public Personal_VO p_num_fk(Personal_VO pvo) {
		Personal_VO fk = null;
		fk = personal_DAO.p_num_fk(pvo);
		return fk;
	}

	@Override
	public Personal_VO p_Detail(Personal_VO pvo) {
		Personal_VO detail = null;
		detail = personal_DAO.p_Detail(pvo);
		return detail;
	}

	@Override
	public int p_Update(Personal_VO pvo) {
		int result = 0;
		result = personal_DAO.p_Update(pvo);
		return result;
	}

	@Override
	public int p_Delete(Personal_VO pvo) {
		int result = 0;
		result = personal_DAO.p_Delete(pvo);
		return result;
	}

	@Override
	public int juminOverlap(String p_number) {
		int result = 0;
		result = personal_DAO.juminOverlap(p_number);
		return result;
	}

	@Override
	public int mailOverlap(String p_email) {
		int result = 0;
		result = personal_DAO.mailOverlap(p_email);
		return result;
	}

}
