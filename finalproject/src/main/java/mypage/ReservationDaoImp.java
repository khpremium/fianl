package mypage;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReservationDaoImp implements ReservationDAO {

	private SqlSessionTemplate SqlSession;
	
	public ReservationDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		SqlSession = sqlSession;
	}
	
	@Override
	public List<ReservationDTO> reservation(String user_id) {
		// TODO Auto-generated method stub
		return SqlSession.selectList("mypage.reservation",user_id);
	}

	@Override
	public void reservation_del(String rv_code) {
		// TODO Auto-generated method stub
		SqlSession.delete("mypage.reservationdel",rv_code);
	}

	@Override
	public List<ReservationDTO> reschk(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return SqlSession.selectList("mypage.reschk",map);
	}

	

}
