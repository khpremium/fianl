package service;

import java.util.List;

import dao.MainDAO;
import dto.CityDTO;
import dto.MainReviewDTO;

public class MainServiceImp implements MainService {
	private MainDAO dao;
	
	public MainServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setDao(MainDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<CityDTO> ListProcess(){
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<MainReviewDTO> rListProcess(String city_code) {
		// TODO Auto-generated method stub
		return dao.rlist(city_code);
	}

}
