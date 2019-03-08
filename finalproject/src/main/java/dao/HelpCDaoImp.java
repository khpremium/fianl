package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;

public class HelpCDaoImp implements HelpCDAO{
	private SqlSessionTemplate sqlSession;
	
	public HelpCDaoImp() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<BoardDTO> hListMethod() {
		System.out.println(sqlSession.selectList("helpC.Hlist"));
		return sqlSession.selectList("helpC.Hlist");
	}

}
