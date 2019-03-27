package service;

import java.util.List;

import dto.AirInfoDTO;
import dto.ClientDTO;
import dto.ReservationDTO;

public interface AdminService {
	public List<ClientDTO> clientSelectProcess();
	public List<AirInfoDTO> airInfoSelectProcess();
	public List<ReservationDTO> reservationSelectProcess();
	public void clientDeleteProcess(String id);
	public void airinfoDeleteProcess(String flight);
	public void reservationDeleteProcess(String rv_num);
	public int clientChkProcess(String id);
	public int airinfoChkProcess(String flight);
	public ClientDTO clientUpdateSelectProcess(String id);
	public AirInfoDTO airinfoUpdateSelectProcess(String flight);
	public ReservationDTO reservationUpdateSelectProcess(String rv_num);
}
