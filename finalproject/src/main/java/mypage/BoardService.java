package mypage;

import java.util.List;

public interface BoardService {
	public int countProcess();
	public List<MyBoardDTO> listProcess(PagingDTO pv);
	
}// end
