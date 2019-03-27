package dao;

import java.util.List;

import dto.CityDTO;
import dto.MainReviewDTO;

public interface MainDAO {
	public List<CityDTO> list();
	public List<MainReviewDTO> rlist(String city_code);
}
