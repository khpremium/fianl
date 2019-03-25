package service;

import java.util.List;

import dto.MainDto;
import dto.MainReviewDTO;

public interface MainService {
	public List<MainDto> ListProcess();
	public List<MainReviewDTO> rListProcess(String city_code);
}
