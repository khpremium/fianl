package mypage;

import java.util.List;

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
		int p_count = sqlSession.selectOne("mypage.passport",rv_code) == null ? 0 : sqlSession.selectOne("mypage.passport",rv_code);
		return p_count;
	}

	@Override
	public void inspassport(MypassportDTO dto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert("mypage.passportIns",dto);
	}

	@Override
	public void delpassport(String reservation_rv_code) {
		// TODO Auto-generated method stub
		sqlSession.delete("mypage.passportdel",reservation_rv_code);
	}

	@Override
	public List<MypassportDTO> searchPassport(String reservation_rv_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mypage.passportSearch",reservation_rv_code);
	}

	

	
	
	
	
}// class




