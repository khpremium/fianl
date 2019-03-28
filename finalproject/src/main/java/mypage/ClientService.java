package mypage;

public interface ClientService {
	public ClientDTO profileProcess(String id);
	public void updateMemProcess(ClientDTO cdto);
	public void deleteMemProcess(String id);
}
