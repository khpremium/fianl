package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import dto.ClientDTO;

@Repository
public class ClientDaoImp implements ClientDAO{
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertMethod(ClientDTO dto) {
		sqlSession.insert("client.ins", dto);
	}

	@Override
	public ClientDTO loginCheck(ClientDTO dto) {
		ClientDTO cdto = sqlSession.selectOne("client.loginCheck", dto);
		return cdto;
	}

	@Override
	public ClientDTO viewMember(ClientDTO dto) {
		return sqlSession.selectOne("client.viewMember", dto);
	}

	@Override
	public int emailCheck(String email) {
		return sqlSession.selectOne("client.confirmEmail", email);
	}

	@Override
	public int idcheck(String id) {
		return sqlSession.selectOne("client.idcheck", id);
	}

	@Override
	public int update_pw(ClientDTO dto) {
		return sqlSession.update("client.update_pw", dto);
	}

	@Override
	public String find_id(String email) {
		return sqlSession.selectOne("client.find_id", email);
	}
	
	public String naverLogin(String email) {
		return sqlSession.selectOne("client.naver",email);
	}
}//end class
