package reservation;

import java.util.List;

public interface ReservationService {
	public List<AirinfoDTO> searchAirinfoProcess(AirinfoDTO dto);
	public List<AirinfoDTO> searchProcess();
}
