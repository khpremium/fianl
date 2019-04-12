package mypage;

import java.util.List;

import dto.BoardDTO;

public class BoardServiceImp implements BoardService {
	private BoardDAO mybdao;
	
	public BoardServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMybdao(BoardDAO mybdao) {
		this.mybdao = mybdao;
	}

	@Override
	public List<MyBoardDTO> listProcess(PagingDTO pv) {
		// TODO Auto-generated method stub
		return mybdao.list(pv);
	}

	@Override
	public int countProcess(PagingDTO pv) {
		// TODO Auto-generated method stub
		return mybdao.count(pv);
	}

	@Override
	public List<MyBoardDTO> mylistProcess(PagingDTO pv) {
		// TODO Auto-generated method stub
		return mybdao.mylist(pv);
	}

	@Override
	public List<MyBoardDTO> BoardListWho(String user_id) {
		// TODO Auto-generated method stub
		return mybdao.deleteBoardMem(user_id);
	}



	
	
}//end class
