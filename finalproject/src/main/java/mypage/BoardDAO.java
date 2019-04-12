package mypage;

import java.util.List;

import dto.BoardDTO;

public interface BoardDAO {
	public int count(PagingDTO pv);
	public List<MyBoardDTO> list(PagingDTO pv);
	public List<MyBoardDTO> mylist(PagingDTO pv);
	public List<MyBoardDTO> deleteBoardMem(String user_id);
}


