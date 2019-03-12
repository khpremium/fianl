package mainservice;

import java.util.List;

import maindao.MainDao;
import maindto.MainDto;
import maindto.MainReviewDTO;

public class MainServiceImp implements MainService {
	private MainDao dao;
	
	public MainServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setDao(MainDao dao) {
		this.dao = dao;
	}
	
	@Override
	public List<MainDto> ListProcess(){
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<MainReviewDTO> rListProcess(int num) {
		// TODO Auto-generated method stub
		return dao.rlist(num);
	}

}
