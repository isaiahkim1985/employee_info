package com.firstTest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.firstTest.vo.Training_VO;


@Repository

public class Training_DAOImpl implements Training_DAO {

	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Training_VO> t_List(Training_VO tvo) {
		return session.selectList("t_List");
	}

	@Override
	public int t_Insert(Training_VO tvo) {
		return session.insert("t_Insert");
	}

	@Override
	public int t_Update(Training_VO tvo) {
		return session.update("t_Update");
	}

	@Override
	public int t_Delete(Training_VO tvo) {
		return session.delete("t_Delete");
	}

}
