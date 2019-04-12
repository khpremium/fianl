package mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;



public class BoardDaoImp implements BoardDAO{
	private SqlSessionTemplate sqlSession;
	
    public BoardDaoImp() {
		// TODO Auto-generated constructor stub
	}
    
    public BoardDaoImp(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
    public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MyBoardDTO> list(PagingDTO pv) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mypage.list",pv);
	}

	@Override
	public List<MyBoardDTO> mylist(PagingDTO pv) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mypage.myboardlist",pv);
	}

	@Override
	public int count(PagingDTO pv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypage.count",pv);
	}

	@Override
	public List<MyBoardDTO> deleteBoardMem(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mypage.myblist_chk",user_id);
	}


	
	

	
    
}// class
