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
	public List<AirinfoDTO> searchProcess() {
		return dao.search();
	}

	@Override
	public List<AirinfoDTO> deptListProcess(ReservationDTO dto) {
		return dao.deptListMethod(dto);
	}

	@Override
	public List<AirinfoDTO> returnListProcess(ReservationDTO dto) {
		return dao.returnListMethod(dto);
	}

	@Override
	public String cityNameProcess(String city_code) {
		return dao.cityNameMethod(city_code);
	}
	
}
