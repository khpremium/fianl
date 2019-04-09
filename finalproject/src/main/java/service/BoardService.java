package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.CityDTO;
import dto.CityPageDTO;
import dto.CommentDTO;
import dto.FilesDTO;
import dto.PageDTO;


public interface BoardService {
	public int dataCountProcess();
	public int cityCountProcess(String city_code);
	public int sugSearchCountPro(PageDTO pdto);
	
	public BoardDTO getMostLikedPro();
	public BoardDTO getMostLikedCityPro(String city_code);
	
	public int BoardDataCountProcess();
	public int BoardcityCountProcess(String city_code);
	public int boardSearchCountPro(PageDTO pdto);	
	
	public void likedProcess(int b_num);
	public void UnlikedProcess(int b_num);
	public int likeCountProcess(int b_num);
	
	public int likechkProcess(BoardDTO dto);
	public void insertLikePro(BoardDTO dto);
	public int UserLikeChk(BoardDTO dto);
	public void chk_likedPro(BoardDTO dto);
	public void chk_unlikedPro(BoardDTO dto);
		
	public List<CityDTO> getCityListProcess(String country_code);
	public List<BoardDTO> listProcess(PageDTO pdto);
	public List<BoardDTO> listAllProcess(PageDTO pdto);
	public List<BoardDTO> listAllProcess();
	
	public List<BoardDTO> BoardListProcess(PageDTO pdto);
	public List<BoardDTO> BoardListAllProcess(PageDTO pdto);
	
	public List<BoardDTO> sugSearchListPro(PageDTO pdto);
	public List<BoardDTO> boardSearchListPro(PageDTO pdto);
	
	public List<BoardDTO> viewProcess(int b_num);
		
	public List<FilesDTO> getFiles(int b_num);
	public List<FilesDTO> fileChangePro(String f_name, int b_num);
	
	public void insertSugProcess(BoardDTO dto, HttpServletRequest request);
	public void insertBoardProcess(BoardDTO dto);
	
	public void DeleteProcess(BoardDTO dto, HttpServletRequest request);
	public List<BoardDTO> UpdateProcess(BoardDTO dto);
	
	public List<CommentDTO> listCmPro(int b_num);
	
	public List<CommentDTO> insertCmPro(CommentDTO cdto);
	public List<CommentDTO> insertBoardCmPro(CommentDTO cdto);
	
	public List<CommentDTO> deleteCmPro(CommentDTO cdto);
	public List<CommentDTO> updateCmPro(CommentDTO cdto);
	public Double rateAvgPro(int b_num);
}
