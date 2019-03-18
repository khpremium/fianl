package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public class HelpCDaoImp implements HelpCDAO{
	private SqlSessionTemplate sqlSession;
	
	public HelpCDaoImp() { 
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<BoardDTO> hListMethod(PageDTO pdto) {
		return sqlSession.selectList("helpC.Hlist", pdto);
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

	@Override
	public void hReplyCntMethod(int b_num) {
		sqlSession.update("helpC.HviewCnt", b_num);
		
	}

	@Override
	public void hBlogInsMethod(BoardDTO bdto) {
		sqlSession.insert("helpC.HblogIns", bdto);
		
	}

	@Override
	public void hBlogDelMethod(int b_num) {
		sqlSession.delete("helpC.HblogDel", b_num);
		
	}

	@Override
	public void hBlogUpMethod(BoardDTO bdto) {
		sqlSession.update("helpC.HblogUp", bdto);
		
	}

	@Override
	public void hComDelAllMethod(int board_b_num) {
		sqlSession.delete("helpC.HcomAllDel", board_b_num);
		
	}

	@Override
	public String getFilename(int b_num) {
		return sqlSession.selectOne("helpC.Hgetfile", b_num);
	}

	@Override
	public int hBlogCountMethod() {
		return sqlSession.selectOne("helpC.HBlogCount");
		
	}

	@Override
	public int hBlogCountMethod2(String searchText) {
		return sqlSession.selectOne("helpC.HBlogCount2", searchText);
	}

	@Override
	public List<BoardDTO> hListMethod2(PageDTO pdto) {
		return sqlSession.selectList("helpC.Hlist2", pdto);
	}
     
} 
