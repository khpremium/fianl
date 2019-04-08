package mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.ClientDTO;

public class ReservationServiceImp implements ReservationService {
	private ReservationDAO myrdao;
	
	
	public ReservationServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMyrdao(ReservationDAO myrdao) {
		this.myrdao = myrdao;
	}

	@Override
	public List<ReservationDTO> reservationProcess(String user_id) {
		// TODO Auto-generated method stub
		return myrdao.reservation(user_id);
	}

	@Override
	public void resdelProcess(String rv_code) {
		// TODO Auto-generated method stub
		myrdao.reservation_del(rv_code);
	}

	@Override
	public List<ReservationDTO> reschkProcess(ReservationDTO rdto) {
		// TODO Auto-generated method stub
		return myrdao.reschk(rdto);
	}

	@Override
	public List<ReservationDTO> reservationcheckPro(ReservationDTO dto, HttpSession session) {
		return myrdao.reservationcheck(dto);
	
	}
	
	
}// class
