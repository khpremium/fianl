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
	
}
