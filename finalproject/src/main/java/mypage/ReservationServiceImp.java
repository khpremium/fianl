package mypage;

import java.util.HashMap;
import java.util.List;

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
	public List<ReservationDTO> reschkProcess(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return myrdao.reschk(map);
	}
	
	
}// class
