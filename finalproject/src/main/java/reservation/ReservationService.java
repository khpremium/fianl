package reservation;

import java.util.List;

public interface ReservationService {
	public List<AirinfoDTO> deptListProcess(AirinfoDTO dto);
	public List<AirinfoDTO> returnListProcess(AirinfoDTO dto);
	public List<AirinfoDTO> searchProcess();
}
