package mypage;

import org.mybatis.spring.SqlSessionTemplate;

public class MypassportDaoImp implements MypassportDAO {
	private SqlSessionTemplate sqlSession;
	
	public MypassportDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int passport(String rv_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypage.passport",rv_code);
	}

	@Override
	public void inspassport(MypassportDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("mypage.passportIns",dto);
	}

	
	
	
}// class




