package mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClientDAO;



@Service("memberManagement")
public class MemberManagement {
	
	@Autowired
	private ClientDAO mDao;

	//이메일 중복체크
	public int emailCheck(String memberemail, int result) {
		int emailcheck = mDao.emailCheck(memberemail);
		if(emailcheck == 0) {
			result = 0;
		}
		else {
			result = 1;
		}
		return result;
	}

}