package com.firstTest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.firstTest.vo.Skill_VO;


@Repository

public class Skill_DAOImpl implements Skill_DAO {

	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Skill_VO> s_List(Skill_VO svo) {
		return session.selectList("s_List");
	}
	@Override
	public int s_Insert(Skill_VO svo) {
		return session.insert("s_Insert");
	}
	@Override
	public int s_Update(Skill_VO svo) {
		return session.update("s_Update");
	}

	@Override
	public int s_Delete(Skill_VO svo) {
		return session.delete("s_Delete");
	}

}
