package service;

import java.util.List;

import dto.CityDTO;
import dto.MainReviewDTO;

public interface MainService {
	public List<CityDTO> ListProcess();
	public List<MainReviewDTO> rListProcess(String city_code);
}
