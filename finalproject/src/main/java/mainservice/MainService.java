package mainservice;

import java.util.List;

import maindto.MainDto;
import maindto.MainReviewDTO;

public interface MainService {
	public List<MainDto> ListProcess();
	public List<MainReviewDTO> rListProcess(int num);
}
