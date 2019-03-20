package maindao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import maindto.MainDto;
import maindto.MainReviewDTO;

public class MainDaoImp implements MainDao{
	
	private SqlSessionTemplate sqlSession;
	
	public MainDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MainDto> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.cityList");
	}

	@Override
	public List<MainReviewDTO> rlist(String city_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.reviewList",city_code);
	}

	
}
