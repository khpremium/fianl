package mypage;

import java.util.List;

public interface ReservationDAO {
	public List<ReservationDTO> reservation(String id);
	public void reservation_del(String rv_code);
	public List<ReservationDTO> reservationcheck(ReservationDTO dto);
	public List<ReservationDTO> reschk(ReservationDTO rdto);
}
