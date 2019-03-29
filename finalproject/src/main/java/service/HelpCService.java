package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public interface HelpCService {
	public List<BoardDTO> hListProcess(PageDTO pdto);
	public BoardDTO hBlogProcess(int b_num);
	public List<ReplyDTO> hcomListProcess(int board_b_num);
	public void comInsertProcess(ReplyDTO rdto);
	public void hReplyCntProcess(int b_num);
	public void hBlogInsProcess(BoardDTO bdto);
	public void hBlogDelProcess(int b_num);
	public void hBlogUpProcess(BoardDTO bdto ,HttpServletRequest request);
	public void hComAllDelProcess(int board_b_num);
	public int hBlogCountProcess();
	public int hBlogCountProcess2(String searchText);
	public List<BoardDTO> hListProcess2(PageDTO pdto);
	public String hFileProcess(int b_num);
	public void hComDelProcess(int cm_num);
	public void hComUpdProcess(ReplyDTO rdto);
	public BoardDTO hmBoardProcess();
}
