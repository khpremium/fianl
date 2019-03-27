package service;

import java.util.List;

import dao.AdminDAO;
import dto.AirInfoDTO;
import dto.ClientDTO;
import dto.ReservationDTO;

public class AdminServiceImp implements AdminService{
	AdminDAO dao;

	public AdminServiceImp() {
	
	}
	
	public void setDao(AdminDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<ClientDTO> clientSelectProcess() {
	
		return dao.clientSelectMethod();
	}

	@Override
	public List<AirInfoDTO> airInfoSelectProcess() {
		return dao.airInfoSelectMethod();
	}

	@Override
	public List<ReservationDTO> reservationSelectProcess() {
		return dao.reservationSelectMethod();
	}

	@Override
	public void clientDeleteProcess(String id) {
		dao.clientDeleteMethod(id);
	}

	@Override
	public void airinfoDeleteProcess(String flight) {
		dao.airinfoDeleteMethod(flight);
		
	}

	@Override
	public void reservationDeleteProcess(String rv_num) {
		dao.reservationDeleteMethod(rv_num);
	}

	@Override
	public int clientChkProcess(String id) {
		
		return dao.clientChkMethod(id);
	}

	@Override
	public int airinfoChkProcess(String flight) {
		return dao.airinfoChkMethod(flight);
	}

	@Override
	public ClientDTO clientUpdateSelectProcess(String id) {
		return dao.clientUpdateSelectMethod(id);
	}

	@Override
	public AirInfoDTO airinfoUpdateSelectProcess(String flight) {
		return dao.airinfoUpdateSelectMethod(flight);

	}

	@Override
	public ReservationDTO reservationUpdateSelectProcess(String rv_num) {
		return dao.reservationUpdateSelectMethod(rv_num);

	}

	

	
	

}
