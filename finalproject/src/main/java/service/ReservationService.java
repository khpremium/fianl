package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import dto.AirinfoDTO;
import dto.ReservationDTO;

public interface ReservationService {
	public List<AirinfoDTO> deptListProcess(ReservationDTO dto);
	public List<AirinfoDTO> returnListProcess(ReservationDTO dto);
	public String cityNameProcess(String city_code);
	public void reservationProcess(ReservationDTO rdto, HttpSession session);
	public int pointProcess(String id);
}
