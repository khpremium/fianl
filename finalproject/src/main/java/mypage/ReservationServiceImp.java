package mypage;

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
	
	
}// class
