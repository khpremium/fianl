package maindao;

import java.util.List;

import maindto.MainDto;
import maindto.MainReviewDTO;

public interface MainDao {
	public List<MainDto> list();
	public List<MainReviewDTO> rlist(String city_code);
}
