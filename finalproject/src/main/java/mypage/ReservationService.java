package mypage;

import java.util.HashMap;
import java.util.List;

public interface ReservationService {
	public List<ReservationDTO> reservationProcess(String id);
	public void resdelProcess(String rv_code);
	public List<ReservationDTO> reschkProcess(HashMap<String,Object> map);
	
}
