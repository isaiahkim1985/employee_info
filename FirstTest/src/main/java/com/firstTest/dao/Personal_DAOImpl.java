package com.firstTest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.firstTest.vo.Personal_VO;


@Repository

public class Personal_DAOImpl implements Personal_DAO {

	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Personal_VO> main_List(Personal_VO pvo) {
		return session.selectList("main_List");
	}

	@Override
	public int main_ListCnt(Personal_VO pvo) {
		
		return (Integer)session.selectOne("main_ListCnt");
	}

	@Override
	public int p_Insert(Personal_VO pvo) {
		return session.insert("p_Insert");
	}
	@Override
	public Personal_VO p_num_fk(Personal_VO pvo) {
		return session.selectOne("p_num_fk");
	}


	@Override
	public Personal_VO p_Detail(Personal_VO pvo) {
		return session.selectOne("p_Detail");
	}

	@Override
	public int p_Update(Personal_VO pvo) {
		return session.update("p_Update");
	}

	@Override
	public int p_Delete(Personal_VO pvo) {
		return session.delete("p_Delete");
	}

	@Override
	public int juminOverlap(String p_number) {
		return session.selectOne("juminOverlap");
	}

	@Override
	public int mailOverlap(String p_email) {
		return session.selectOne("mailOverlap");
	}

}
