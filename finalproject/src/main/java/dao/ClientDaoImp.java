package dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.http.codec.ClientCodecConfigurer.ClientDefaultCodecs;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.ClientDTO;

@Repository
public class ClientDaoImp implements ClientDAO{
	private SqlSessionTemplate sqlSession;
	//private SqlSession session;
	private SqlSessionFactory ssf;
	
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
	public String find_id(String email) {
		return sqlSession.selectOne("client.find_id", email);
	}

	@Override
	public int update_pw(ClientDTO dto) {
		return sqlSession.update("client.update_pw", dto);
	}

}//end class
