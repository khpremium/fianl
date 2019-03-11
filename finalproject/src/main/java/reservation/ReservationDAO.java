package reservation;

import java.util.List;

public interface ReservationDAO {
	public List<AirinfoDTO> deptListMethod(ReservationDTO dto);
	public List<AirinfoDTO> returnListMethod(ReservationDTO dto);
	public List<AirinfoDTO> search();
}
