package mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface ReservationService {
	public List<ReservationDTO> reservationProcess(String id);
	public void resdelProcess(String rv_code);
	public List<ReservationDTO> reschkProcess(ReservationDTO rdto);
	public List<ReservationDTO> reservationcheckPro(ReservationDTO dto,HttpSession session);
}
