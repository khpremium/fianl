package reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface ReservationService {
	public List<AirinfoDTO> deptListProcess(ReservationDTO dto);
	public List<AirinfoDTO> returnListProcess(ReservationDTO dto);
	public String cityNameProcess(String city_code);
	public void reservationProcess(ReservationDTO rdto, HttpSession session);
}
