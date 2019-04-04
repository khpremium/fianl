package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.AirinfoDTO;
import dto.ReservationDTO;

public class ReservationDaoImp implements ReservationDAO {
	private SqlSessionTemplate sqlSession;

	public ReservationDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AirinfoDTO> deptListMethod(ReservationDTO dto) {
		return sqlSession.selectList("res.dList", dto);
	}

	@Override
	public List<AirinfoDTO> returnListMethod(ReservationDTO dto) {
		return sqlSession.selectList("res.rList", dto);
	}

	@Override
	public String cityNameMethod(String city_code) {
		return sqlSession.selectOne("res.name", city_code);
	}

	@Override
	public void clientResMethod(ReservationDTO rdto) {
		sqlSession.insert("res.client", rdto);
	}

	@Override
	public void guestResMethod(ReservationDTO rdto) {
		sqlSession.insert("res.guest", rdto);
	}

	@Override
	public void seatUptMethod(String flight) {
		sqlSession.update("res.seatUpt", flight);
	}

	@Override
	public int rvChkMethod(String rv_code) {
		return sqlSession.selectOne("res.rvchk", rv_code);
	}

	@Override
	public int priceMethod(String rv_code) {
		return sqlSession.selectOne("res.price", rv_code);
	}

	@Override
	public void pointMethod(HashMap<Object, Object> map) {
		sqlSession.update("res.point", map);
	}

	@Override
	public int pointSelectMethod(String id) {
		return sqlSession.selectOne("res.pointSelect", id);
	}

	@Override
	public void pointUseMethod(ReservationDTO rdto) {
		sqlSession.update("res.pointUse", rdto);
	}
	
}
