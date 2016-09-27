package com.firstTest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.firstTest.vo.Edu_background_VO;


@Repository		

public class Edu_background_DAOImpl implements Edu_background_DAO {

	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Edu_background_VO> edu_List(Edu_background_VO evo) {
		return session.selectList("edu_List");
	}

	@Override
	public int edu_Insert(Edu_background_VO evo) {
		return session.insert("edu_Insert");
	}

	@Override
	public Edu_background_VO edu_Detail(Edu_background_VO evo) {
		return session.selectOne("edu_Detail");
	}

	@Override
	public int edu_Update(Edu_background_VO evo) {
		return session.update("edu_Update");
	}

	@Override
	public int edu_Delete(Edu_background_VO evo) {
		return session.delete("edu_Delete");
	}

}
