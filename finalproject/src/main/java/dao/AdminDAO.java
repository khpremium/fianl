package dao;

import java.util.List;

import dto.AirInfoDTO;
import dto.CityDTO;
import dto.ClientDTO;
import dto.ReservationDTO;

public interface AdminDAO {
	public List<ClientDTO> clientSelectMethod();
	public void clientDeleteMethod(String id);
	public int clientChkMethod(String id);
	public ClientDTO clientUpdateSelectMethod(String id);
	public void clientUpdateMethod(ClientDTO dto);
	public void clientInsertMethod(ClientDTO dto);
	
	public List<AirInfoDTO> airInfoSelectMethod();
	public void airinfoDeleteMethod(String flight);
	public int airinfoChkMethod(String flight);
	public AirInfoDTO airinfoUpdateSelectMethod(String flight);
	public void airinfoUpdateMethod(AirInfoDTO dto);
	public void airinfoInsertMethod(AirInfoDTO dto);
	
	public List<ReservationDTO> reservationSelectMethod();
	public void reservationDeleteMethod(String rv_num);
	public ReservationDTO reservationUpdateSelectMethod(String rv_num);
	public void reservationUpdateMethod(ReservationDTO dto);
	public void reservationInsertMethod(ReservationDTO dto);
	
	public List<CityDTO> cityListMethod();
}
