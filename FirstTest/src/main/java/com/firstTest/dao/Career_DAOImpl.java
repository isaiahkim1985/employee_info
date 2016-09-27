package com.firstTest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.firstTest.vo.Career_VO;


@Repository		

public class Career_DAOImpl implements Career_DAO {

	
	@Autowired
	private SqlSession session; 
	
	
	@Override
	public List<Career_VO> c_List(Career_VO cvo) {
		return session.selectList("c_List");
	}

	@Override
	public int c_Insert(Career_VO cvo) {
		return session.insert("c_Insert");
	}

	@Override
	public int c_Update(Career_VO cvo) {
		return session.update("c_Update");
	}

	@Override
	public int c_Delete(Career_VO cvo) {
		return session.delete("c_Delete");
	}

}
