package mypage;

import org.mybatis.spring.SqlSessionTemplate;

public class ClientDaoImp implements ClientDAO{
	private SqlSessionTemplate sqlSession;
	
	public ClientDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ClientDTO profile(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypage.profile",id);
	}

	
	
}// class

