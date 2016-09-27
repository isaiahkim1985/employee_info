package com.firstTest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.firstTest.vo.License_VO;


@Repository

public class License_DAOImpl implements License_DAO {

	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<License_VO> l_List(License_VO lvo) {
		return session.selectList("l_List");
	}
	@Override
	public int l_Insert(License_VO lvo) {
		return session.insert("l_Insert");
	}
	@Override
	public int l_Update(License_VO lvo) {
		return session.update("l_Update");
	}
	@Override
	public int l_Delete(License_VO lvo) {
		return session.delete("l_Delete");
	}

}
