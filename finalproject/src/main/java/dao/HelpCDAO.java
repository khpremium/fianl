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
}
