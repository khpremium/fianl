package service;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import dao.ReservationDAO;
import dto.AirinfoDTO;
import dto.ReservationDTO;

public class ReservationServiceImp implements ReservationService {
	private ReservationDAO dao;

	public ReservationServiceImp() {
		
	}
	
	public void setDao(ReservationDAO dao) {
		this.dao = dao;
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
	public void reservationProcess(ReservationDTO rdto, HttpSession session) {
		while(true) {
			String rv_code = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
			if(dao.rvChkMethod(rv_code) > 0)
				continue;
			else {
				rdto.setRv_code(rv_code);
				break;
			}
		}
		for(int i = 0; i < rdto.getP_count(); i++) {
			dao.seatUptMethod(rdto.getDep_airinfo_flight());
			dao.seatUptMethod(rdto.getArv_airinfo_flight());
		}
		if(rdto.getNon_name() == null) {
			if(rdto.getUsePoint() > 0) {
				dao.pointUseMethod(rdto);
			}
			long point = Math.round(dao.priceMethod(rdto.getArv_airinfo_flight()) * rdto.getP_count() * 0.1);
			point += Math.round(dao.priceMethod(rdto.getDep_airinfo_flight()) * rdto.getP_count() * 0.1);
			HashMap<Object, Object> map = new HashMap<>();
			map.put("id", rdto.getUser_id());
			map.put("point", point);
			dao.pointMethod(map);
			rdto.setAirinfo_flight(rdto.getDep_airinfo_flight());
			dao.clientResMethod(rdto);
			rdto.setAirinfo_flight(rdto.getArv_airinfo_flight());
			dao.clientResMethod(rdto);
		} else {
			rdto.setAirinfo_flight(rdto.getDep_airinfo_flight());
			dao.guestResMethod(rdto);
			rdto.setAirinfo_flight(rdto.getArv_airinfo_flight());
			dao.guestResMethod(rdto);
		}
	}

	@Override
	public int pointProcess(String id) {
		return dao.pointSelectMethod(id);
	}
	
}
