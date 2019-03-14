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

	@Override
	public void reservationProcess(ReservationDTO rdto) {
		for(int i = 0; i < rdto.getP_count(); i++) {
			dao.seatUptMethod(rdto.getDep_airinfo_flight());
			dao.seatUptMethod(rdto.getArv_airinfo_flight());
		}
		if(rdto.getGuestchk().equals("noguest")) {
			dao.clientResMethod(rdto);
		} else {
			dao.guestResMethod(rdto);
		}
	}
	
}
