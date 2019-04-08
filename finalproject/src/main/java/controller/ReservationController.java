package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.ReservationDTO;
import service.ReservationService;

// http://localhost:8090/myfinal/selectFlight.do

@Controller
public class ReservationController {
	private ReservationService service;
	
	public ReservationController() {
		
	}
	
	public void setService(ReservationService service) {
		this.service = service;
	}
	
	// 비회원 정보입력
	@RequestMapping(value = "/guestInfo.do", method = RequestMethod.POST)
	public ModelAndView select(ReservationDTO rdto) {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list", service.searchProcess());
		mav.addObject("rdto", rdto);
		mav.setViewName("/view/guestForm");
		return mav;
	}
	
	// 비행편 선택
	@RequestMapping(value = "/selectFlight.do", method = RequestMethod.POST)
	public ModelAndView selectFlight(ReservationDTO rdto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dep_date", rdto.getDep_date());
		mav.addObject("arv_date", rdto.getArv_date());
		rdto.setDep_date(rdto.getDep_date().replaceAll("-", ""));
		rdto.setArv_date(rdto.getArv_date().replaceAll("-", ""));
		if(rdto.getNon_name() == null) {
			mav.addObject("point", service.pointProcess((String)session.getAttribute("id")));
		}
		mav.addObject("dList", service.deptListProcess(rdto));
		mav.addObject("rList", service.returnListProcess(rdto));
		mav.addObject("dep_name", service.cityNameProcess(rdto.getCity_code_dep()));
		mav.addObject("arv_name", service.cityNameProcess(rdto.getCity_code_arv()));
		mav.addObject("rdto", rdto);
		mav.setViewName("/view/select");
		return mav;
	}
	
	// 예약 실행
	@RequestMapping("/reservation.do")
	public String guestReservation(ReservationDTO rdto, RedirectAttributes reattr, HttpSession session) {
		service.reservationProcess(rdto, session);
		if(rdto.getNon_name() == null)
			return "redirect:/main.do";
		else {
			reattr.addFlashAttribute("rv_code", rdto.getRv_code());
			return "redirect:/guestAlert.do";
		}
	}
	
	// 비회원 예약번호 출력
	@RequestMapping("/guestAlert.do")
	public String guestAlert() {
		return "/view/guestAlert";
	}
	
	// http://localhost:8090/myfinal/guestAlert.do?code="asd1xzc5"
	// 비회원 예약번호 출력
	/*@RequestMapping("/guestAlert.do")
	public ModelAndView guestAlert(String code) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("rv_code", code);
		mav.setViewName("/view/guestAlert");
		return mav;
	}*/
	
	// 카카오페이 rest 요청
	@RequestMapping(value = "/kakaoPro.do", method = RequestMethod.POST)
	public @ResponseBody String kakaoPayment(String name, int price, int p_count) throws IOException {
		String input = "";
		String total = "";
		String url = "https://kapi.kakao.com/v1/payment/ready";
		url += "?cid=TC0ONETIME";
		url += "&partner_order_id=partner_order_id";
		url += "&partner_user_id=" + name;
		url += "&item_name=항공권";
		url += "&quantity=" + p_count * 2;
		url += "&total_amount=100000"/* + price*/;
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
	
	// 카카오페이 결과 받아오는곳
	@RequestMapping("/kakaoRes.do")
	public ModelAndView kakaoResult(String result) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("/view/kakaores");
		return mav;
	}
	
	@RequestMapping(value = {"/selectFlight.do", "/guestInfo.do"} , method = RequestMethod.GET)
	public String redirectMain() {
		return "redirect:/main.do";
	}

}
