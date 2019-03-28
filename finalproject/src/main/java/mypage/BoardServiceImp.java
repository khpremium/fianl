package mypage;

import java.util.List;

public class BoardServiceImp implements BoardService {
	private BoardDAO myndao;
	
	public BoardServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMyndao(BoardDAO myndao) {
		this.myndao = myndao;
	}

	@Override
	public List<MyBoardDTO> listProcess(PagingDTO pv) {
		// TODO Auto-generated method stub
		return myndao.list(pv);
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return myndao.count();
	}
	
}//end class
