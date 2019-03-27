package service;

import java.util.List;

import dao.AdminDAO;
import dto.AirInfoDTO;
import dto.CityDTO;
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
	public void clientDeleteProcess(String id) {
		dao.clientDeleteMethod(id);
	}

	@Override
	public int clientChkProcess(String id) {
		return dao.clientChkMethod(id);
	}

	@Override
	public ClientDTO clientUpdateSelectProcess(String id) {
		return dao.clientUpdateSelectMethod(id);
	}

	@Override
	public void clientUpdateProcess(ClientDTO dto) {
		dao.clientUpdateMethod(dto);
	}

	@Override
	public void clientInsertProcess(ClientDTO dto) {
		dao.clientInsertMethod(dto);
	}

	@Override
	public List<AirInfoDTO> airInfoSelectProcess() {
		return dao.airInfoSelectMethod();
	}

	@Override
	public void airinfoDeleteProcess(String flight) {
		dao.airinfoDeleteMethod(flight);
	}

	@Override
	public int airinfoChkProcess(String flight) {
		return dao.airinfoChkMethod(flight);
	}

	@Override
	public AirInfoDTO airinfoUpdateSelectProcess(String flight) {
		return dao.airinfoUpdateSelectMethod(flight);
	}

	@Override
	public void airinfoUpdateProcess(AirInfoDTO dto) {
		dao.airinfoUpdateMethod(dto);
	}

	@Override
	public void airinfoInsertProcess(AirInfoDTO dto) {
		dao.airinfoInsertMethod(dto);
	}


	@Override
	public List<ReservationDTO> reservationSelectProcess() {
		return dao.reservationSelectMethod();
	}

	@Override
	public void reservationDeleteProcess(String rv_num) {
		dao.reservationDeleteMethod(rv_num);
	}

	@Override
	public ReservationDTO reservationUpdateSelectProcess(String rv_num) {
		return dao.reservationUpdateSelectMethod(rv_num);

	}

	@Override
	public void reservationInsertProcess(ReservationDTO dto) {
		dao.reservationInsertMethod(dto);
	}

	@Override
	public void reservationUpdateProcess(ReservationDTO dto) {
		dao.reservationUpdateMethod(dto);
	}

	@Override
	public List<CityDTO> cityListProcess() {
		return dao.cityListMethod();
	}
}
