package reservation;

import java.util.List;

public class ReservationServiceImp implements ReservationService {
	private ReservationDAO dao;

	public ReservationServiceImp() {
		
	}
	
	public void setDao(ReservationDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<AirinfoDTO> searchAirinfoProcess(AirinfoDTO dto) {
		return dao.searchAirinfo(dto);
	}
	
}
