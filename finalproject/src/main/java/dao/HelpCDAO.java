package dao;

import java.util.List;

import dto.BoardDTO;
import dto.ReplyDTO;

public interface HelpCDAO {
	public List<BoardDTO> hListMethod();
	public BoardDTO hBlogBlogMethod(int b_num);
	public List<ReplyDTO> hComListMethod(int b_num);
	public void hComInsMethod(ReplyDTO rdto);
}
