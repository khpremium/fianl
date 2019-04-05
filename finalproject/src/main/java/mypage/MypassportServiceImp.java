package mypage;

import java.util.List;

public class MypassportServiceImp implements MypassportService {
	
	private MypassportDAO mypdao;
	
	public MypassportServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMypdao(MypassportDAO mypdao) {
		this.mypdao = mypdao;
	}

	
	@Override
	public int passportProcess(String rv_code) {
		// TODO Auto-generated method stub
		return mypdao.passport(rv_code);
	}

	
	@Override
	public void passportinsProcess(List<MypassportDTO> aList) {
		// TODO Auto-generated method stub
		mypdao.delpassport(aList.get(0).getReservation_rv_code());
		for(MypassportDTO dto : aList) {
		
			mypdao.inspassport(dto);
		}
		
	}

	@Override
	public List<MypassportDTO> passportSrcProcess(String reservation_rv_code) {
		// TODO Auto-generated method stub
		return mypdao.searchPassport(reservation_rv_code);
	}


	
	
	
	
}// class


