package mypage;

import java.util.List;

public interface BoardDAO {
	public int count();
	public List<MyBoardDTO> list(PagingDTO pv);
	public List<MyBoardDTO> mylist(PagingDTO pv);
}
