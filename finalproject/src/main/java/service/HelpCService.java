package service;

import java.util.List;

import dto.BoardDTO;
import dto.ReplyDTO;

public interface HelpCService {
	public List<BoardDTO> hListProcess();
	public BoardDTO hBlogProcess(int b_num);
	public List<ReplyDTO> hcomListProcess(int b_num);
	public void comInsertProcess(ReplyDTO rdto);
}
