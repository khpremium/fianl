package reservation;

import java.util.List;

public interface ReservationDAO {
	public List<AirinfoDTO> searchAirinfo(AirinfoDTO dto);
	public List<AirinfoDTO> search();
}
