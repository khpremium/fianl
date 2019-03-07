package dao;

import java.util.List;

import dto.BoardDTO;

public interface BoardDAO {
	public int viewCount();
	public int likeCount();
	public List<BoardDTO> list(int c_num);
 }