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
	public List<AirinfoDTO> searchAirinfo(AirinfoDTO dto) {
		return sqlSession.selectList("res.air", dto);
	}

	@Override
	public List<AirinfoDTO> search() {
		return sqlSession.selectList("res.list");
	}
	
}
