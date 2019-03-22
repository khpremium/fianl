package mypage;

import java.util.List;

public interface MypassportDAO {
	public int passport(String rv_code);
	public void inspassport(MypassportDTO dto);
}
