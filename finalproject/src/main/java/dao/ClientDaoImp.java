package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ClientDTO;

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
	public List<ClientDTO> findId(ClientDTO dto) {
		return sqlSession.selectList("client.findId", dto);
	}
	
}//end class
