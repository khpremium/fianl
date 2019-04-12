package mypage;

import java.util.List;

import dto.BoardDTO;

public interface BoardService {
	public int countProcess(PagingDTO pv);
	public List<MyBoardDTO> listProcess(PagingDTO pv);
	public List<MyBoardDTO> mylistProcess(PagingDTO pv);
	public List<MyBoardDTO> BoardListWho(String user_id);
}// end
