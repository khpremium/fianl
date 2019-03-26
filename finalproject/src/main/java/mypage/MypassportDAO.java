package mypage;

import java.util.List;

public interface MypassportDAO {
	public int passport(String rv_code);
	public void inspassport(MypassportDTO dto);
	public void delpassport(String reservation_rv_code);
	public List<MypassportDTO> searchPassport(String reservation_rv_code);
}
