package mypage;

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
	
	
}// class


