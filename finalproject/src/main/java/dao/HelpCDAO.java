package dao;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public interface HelpCDAO {
	public List<BoardDTO> hListMethod(PageDTO pdto);
	public BoardDTO hBlogBlogMethod(int b_num);
	public List<ReplyDTO> hComListMethod(int board_b_num);
	public void hComInsMethod(ReplyDTO rdto);
	public void hReplyCntMethod(int b_num);
	public void hBlogInsMethod(BoardDTO bdto);
	public void hBlogDelMethod(int b_num);
	public void hBlogUpMethod(BoardDTO bdto);
	public void hComDelAllMethod(int board_b_num);
	public String getFilename(int b_num);
	public int hBlogCountMethod();
	public int hBlogCountMethod2(String searchText);
	public List<BoardDTO> hListMethod2(PageDTO pdto);
	public String hFileMethod(int b_num);
	public void hComDelMethod(int cm_num);
	public void hComUpdMethod(ReplyDTO rdto);
	public BoardDTO hmBlogMethod();
}
