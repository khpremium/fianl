package reservation;

import java.util.List;

public interface ReservationDAO {
	public List<AirinfoDTO> deptListMethod(AirinfoDTO dto);
	public List<AirinfoDTO> returnListMethod(AirinfoDTO dto);
	public List<AirinfoDTO> search();
}
