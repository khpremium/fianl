package reservation;

import java.util.List;

public interface ReservationService {
	public List<AirinfoDTO> deptListProcess(ReservationDTO dto);
	public List<AirinfoDTO> returnListProcess(ReservationDTO dto);
	public List<AirinfoDTO> searchProcess();
	public String cityNameProcess(String city_code);
	public void reservationProcess(ReservationDTO rdto);
}
