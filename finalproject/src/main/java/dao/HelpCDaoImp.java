package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.ReplyDTO;

public class HelpCDaoImp implements HelpCDAO{
	private SqlSessionTemplate sqlSession;
	
	public HelpCDaoImp() { 
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<BoardDTO> hListMethod() {
		return sqlSession.selectList("helpC.Hlist");
	}

	@Override
	public BoardDTO hBlogBlogMethod(int b_num) {
		return sqlSession.selectOne("helpC.Hblog", b_num);
	}

	@Override
	public List<ReplyDTO> hComListMethod(int board_b_num) {
		System.out.println("hComListMethod");
		
		return sqlSession.selectList("helpC.Hcomlist", board_b_num);
	}

	@Override
	public void hComInsMethod(ReplyDTO rdto) {
		sqlSession.insert("helpC.Hcomins", rdto);
		
	}
     
} 
