package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CityDTO;
import dto.MainReviewDTO;

public class MainDaoImp implements MainDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public MainDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<CityDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.cityList");
	}

	@Override
	public List<MainReviewDTO> rlist(String city_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.reviewList",city_code);
	}

	
}
