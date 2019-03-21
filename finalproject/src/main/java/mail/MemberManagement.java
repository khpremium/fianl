package mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ClientDAO;



@Service("memberManagement")
public class MemberManagement {
	

	@Autowired
	private ClientDAO mDao;
	private ModelAndView mav;



	//이메일 중복체크
	public int emailCheck(String memberemail, int result) {
		
		mav = new ModelAndView();
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