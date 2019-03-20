package reservation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

// http://localhost:8090/myfinal/selectFlight.do

@Controller
public class ReservationController {
	private ReservationService service;
	
	public ReservationController() {
		
	}
	
	public void setService(ReservationService service) {
		this.service = service;
	}
	
	// http://localhost:8090/myfinal/select.do
	@RequestMapping(value = "/guestInfo.do", method = RequestMethod.POST)
	public ModelAndView select(ReservationDTO rdto) {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list", service.searchProcess());
		mav.addObject("rdto", rdto);
		mav.setViewName("/view/guest");
		return mav;
	}
	
	@RequestMapping(value = "/selectFlight.do", method = RequestMethod.POST)
	public ModelAndView selectFlight(ReservationDTO rdto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		/*if(guestchk == "noguest") {
			HttpSession session = req.getSession();
			if(session.getAttribute("logOk") == null) {
				session.setAttribute("rtn", "main.do");
				mav.setViewName("redirect:/login.do");
			} else {
				mav.addObject("client_id", session.getAttribute("logOk"));
			}
		}*/
		mav.addObject("dep_date", rdto.getDep_date());
		mav.addObject("arv_date", rdto.getArv_date());
		rdto.setDep_date(rdto.getDep_date().replaceAll("-", "").substring(2));
		rdto.setArv_date(rdto.getArv_date().replaceAll("-", "").substring(2));
		mav.addObject("dList", service.deptListProcess(rdto));
		mav.addObject("rList", service.returnListProcess(rdto));
		mav.addObject("dep_name", service.cityNameProcess(rdto.getCity_code_dep()));
		mav.addObject("arv_name", service.cityNameProcess(rdto.getCity_code_arv()));
		mav.addObject("rdto", rdto);
		mav.setViewName("/view/select");
		return mav;
	}
	
	@RequestMapping(value = {"/selectFlight.do", "/guestInfo.do"} , method = RequestMethod.GET)
	public String redirectMain() {
		return "redirect:/main.do";
	}
	
	@RequestMapping("/reservation.do")
	public ModelAndView guestReservation(ReservationDTO rdto) {
		ModelAndView mav = new ModelAndView();
		service.reservationProcess(rdto);
		if(rdto.getGuestchk() == null)
			mav.setViewName("redirect:/main.do");
		else {
			mav.setViewName("redirect:/guestAlert.do?rv_code=" + rdto.getRv_code());
		}
		return mav;
	}
	
	@RequestMapping("/guestAlert.do")
	public ModelAndView guestAlert(String rv_code) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("rv_code", rv_code);
		mav.setViewName("/view/guestalert");
		return mav;
	}
	
	@RequestMapping("/kakaoPro.do")
	public @ResponseBody String kakaoPayment() throws IOException {
		String input = "";
		String total = "";
		String url = "https://kapi.kakao.com/v1/payment/ready";
		url += "?cid=TC0ONETIME";
		url += "&partner_order_id=partner_order_id";
		url += "&partner_user_id=partner_user_id";
		url += "&item_name=항공권";
		url += "&quantity=1";
		url += "&total_amount=200000";
		url += "&tax_free_amount=0";
		url += "&approval_url=http://localhost:8090/myfinal/kakaoRes.do?result=success";
		url += "&fail_url=http://localhost:8090/myfinal/kakaoRes.do?result=fail";
		url += "&cancel_url=http://localhost:8090/myfinal/kakaoRes.do?result=cancel";
		// url += "&query=" + URLEncoder.encode(search, "UTF-8");
		
		URL url2 = new URL(url);
		URLConnection conn = url2.openConnection();
		HttpURLConnection urlConn = (HttpURLConnection) conn;
		urlConn.setRequestMethod("POST");
		urlConn.setRequestProperty("Authorization", "KakaoAK 364f647d9fb6e6e23fca64e838fb6fc7");
		urlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		while((input = reader.readLine()) != null) {
			total += input;
		}
		
		return total;
	}
	
	@RequestMapping("/payment.do")
	public @ResponseBody String paymentMethod(String resultCode) {
		return resultCode;
	}
	
	@RequestMapping("/kakaoRes.do")
	public ModelAndView kakaoResult(String result) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("/view/kakaores");
		return mav;
	}

}
