package dao;

import java.util.List;

import dto.AirinfoDTO;
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
	
	public List<AirinfoDTO> airInfoSelectMethod();
	public void airinfoDeleteMethod(String flight);
	public int airinfoChkMethod(String flight);
	public AirinfoDTO airinfoUpdateSelectMethod(String flight);
	public void airinfoUpdateMethod(AirinfoDTO dto);
	public void airinfoInsertMethod(AirinfoDTO dto);
	
	public List<ReservationDTO> reservationSelectMethod();
	public void reservationDeleteMethod(String rv_num);
	public ReservationDTO reservationUpdateSelectMethod(String rv_num);
	public void reservationUpdateMethod(ReservationDTO dto);
	public void reservationInsertMethod(ReservationDTO dto);
	
	public List<CityDTO> cityListMethod();
}
