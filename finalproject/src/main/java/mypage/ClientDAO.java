package mypage;

import java.util.List;

public interface ClientDAO {
	public ClientDTO profile(String id);
	public void updateClient(ClientDTO cdto);
	public void deleteClient(String id);
}
