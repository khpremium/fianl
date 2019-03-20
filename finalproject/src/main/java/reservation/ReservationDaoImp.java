package reservation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReservationDaoImp implements ReservationDAO {
	private SqlSessionTemplate sqlSession;

	public ReservationDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AirinfoDTO> search() {
		return sqlSession.selectList("res.list");
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
	public int rvChkMethod(String rv_num) {
		return sqlSession.selectOne("res.rvchk", rv_num);
	}
	
}
