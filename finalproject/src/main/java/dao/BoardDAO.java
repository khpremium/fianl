package dao;

import java.util.List;

import dto.BoardDTO;
import dto.CityDTO;
import dto.CommentDTO;
import dto.FilesDTO;
import dto.Like_chkDTO;
import dto.PageDTO;

public interface BoardDAO {
	public int dataCount();
	public int cityCount(String city_code);
	public int sugSearchCount(PageDTO pdto);
	
	public int BoardDataCount();
	public int BoardCityCount(String city_code);
	public int boardSearchCount(PageDTO pdto);
	
	public int viewCount(int b_num);
	public List<CityDTO> getCityList(String country_code);
	
	public void liked(int b_num);
	public void unliked(int b_num);
	public int likeCount(int b_num);
		
	//public int first_chk(BoardDTO dto);
	//public void likechk(BoardDTO dto);
	public Like_chkDTO likechk(BoardDTO dto);
	public void insertLike(BoardDTO dto);
	public void chk_del(BoardDTO dto);
	
	public BoardDTO getMostLiked();
	public BoardDTO getMostLikedCity(String city_code);
	
	public List<BoardDTO> list(PageDTO pdto);
	public List<BoardDTO> list();
	public List<BoardDTO> listAll(PageDTO pdto);
	
	public List<BoardDTO> BoardList(PageDTO pdto);
	public List<BoardDTO> BoardListAll(PageDTO pdto);
	
	public List<BoardDTO> sugSearchList(PageDTO pdto);
	public List<BoardDTO> boardSearchList(PageDTO pdto);
	
	public List<BoardDTO> view(int b_num);
	
	public void insertSug(BoardDTO bdto);
	public void insertBoard(BoardDTO bdto);
	
	public void delete(int b_num);
	public void update(BoardDTO bdto);
	
	public List<FilesDTO> fileListMethod(int b_num);
	public void fileDeleteMethod(int b_num);
	public void fileUpdateMethod(BoardDTO dto);
	public void fileInsertMethod(List<FilesDTO> fileList);
	public void fileChangeMethod(String f_name);
	
	public List<CommentDTO> commentList(int b_num);
	
	public void insertCm(CommentDTO cdto);
	public void insertBoardCm(CommentDTO cdto);
	
	public void deleteCm(int cm_num);
	public void deleteAllCm(int b_num);
	public void updateCm(CommentDTO cdto);
	public double rateAvg(int b_num);
	
 }