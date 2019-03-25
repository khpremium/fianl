package dao;

import java.util.List;

import dto.MainDto;
import dto.MainReviewDTO;

public interface MainDao {
	public List<MainDto> list();
	public List<MainReviewDTO> rlist(String city_code);
}
