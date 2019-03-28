package service;

import java.util.List;

import dto.AirinfoDTO;
import dto.CityDTO;
import dto.ClientDTO;
import dto.ReservationDTO;

public interface AdminService {
	public List<ClientDTO> clientSelectProcess();
	public void clientDeleteProcess(String id);
	public int clientChkProcess(String id);
	public ClientDTO clientUpdateSelectProcess(String id);
	public void clientUpdateProcess(ClientDTO dto);
	public void clientInsertProcess(ClientDTO dto);
	
	public List<AirinfoDTO> airInfoSelectProcess();
	public void airinfoDeleteProcess(String flight);
	public int airinfoChkProcess(String flight);
	public AirinfoDTO airinfoUpdateSelectProcess(String flight);
	public void airinfoUpdateProcess(AirinfoDTO dto);
	public void airinfoInsertProcess(AirinfoDTO dto);
	
	public List<ReservationDTO> reservationSelectProcess();
	public void reservationDeleteProcess(String rv_num);
	public ReservationDTO reservationUpdateSelectProcess(String rv_num);
	public void reservationUpdateProcess(ReservationDTO dto);
	public void reservationInsertProcess(ReservationDTO dto);
	
	public List<CityDTO> cityListProcess();
}
