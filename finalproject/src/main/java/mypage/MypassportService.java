package mypage;

import java.util.List;

public interface MypassportService {
	public int passportProcess(String rv_code);
	public void passportinsProcess(List<MypassportDTO> dto);
	public List<MypassportDTO> passportSrcProcess(String reservation_rv_code);
	
}
