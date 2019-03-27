package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.AirInfoDTO;
import dto.ClientDTO;
import dto.ReservationDTO;

public class AdminDaoImp implements AdminDAO {
	private SqlSessionTemplate sqlSession;
	
	public AdminDaoImp() {
	
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ClientDTO> clientSelectMethod() {
		return sqlSession.selectList("mt.client");
	}

	@Override
	public List<AirInfoDTO> airInfoSelectMethod() {
	
		return sqlSession.selectList("mt.airinfo");
	}

	@Override
	public List<ReservationDTO> reservationSelectMethod() {
		return sqlSession.selectList("mt.reservation");
	}

	@Override
	public void clientDeleteMethod(String id) {
		sqlSession.delete("mt.clientDelete", id);
	}

	@Override
	public void airinfoDeleteMethod(String flight) {
		sqlSession.delete("mt.airinfoDelete",flight);
	}

	@Override
	public void reservationDeleteMethod(String rv_num) {
		sqlSession.delete("mt.reservationDelete",rv_num);		
	}

	@Override
	public int clientChkMethod(String id) {
		return sqlSession.selectOne("mt.clientChk",id);
	}

	@Override
	public int airinfoChkMethod(String flight) {
		
		return sqlSession.selectOne("mt.airinfoChk",flight);
	}

	@Override
	public ClientDTO clientUpdateSelectMethod(String id) {
		return sqlSession.selectOne("mt.clientUpdateSelect",id);
	}

	@Override
	public AirInfoDTO airinfoUpdateSelectMethod(String flight) {
		return sqlSession.selectOne("mt.airinfoUpdateSelect",flight);
	}

	@Override
	public ReservationDTO reservationUpdateSelectMethod(String rv_num) {
		return sqlSession.selectOne("mt.reservationUpdateSelect",rv_num);
	}


	

	
	
	
	
	

}
