package dao;

import java.util.List;

import dto.AirInfoDTO;
import dto.ClientDTO;
import dto.ReservationDTO;

public interface AdminDAO {
	public List<ClientDTO> clientSelectMethod();
	public List<AirInfoDTO> airInfoSelectMethod();
	public List<ReservationDTO> reservationSelectMethod();
	public void clientDeleteMethod(String id);
	public void airinfoDeleteMethod(String flight);
	public void reservationDeleteMethod(String rv_num);
	public int clientChkMethod(String id);
	public int airinfoChkMethod(String flight);
	public ClientDTO clientUpdateSelectMethod(String id);
	public AirInfoDTO airinfoUpdateSelectMethod(String flight);
	public ReservationDTO reservationUpdateSelectMethod(String rv_num);


}
