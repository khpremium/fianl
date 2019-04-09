package mypage;

import java.util.List;

public interface BoardService {
	public int countProcess(PagingDTO pv);
	public List<MyBoardDTO> listProcess(PagingDTO pv);
	public List<MyBoardDTO> mylistProcess(PagingDTO pv);
}// end
