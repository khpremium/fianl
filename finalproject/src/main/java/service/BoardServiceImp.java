package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import dto.BcatDTO;
import dto.BoardDTO;
import dto.CityDTO;
import dto.CityPageDTO;
import dto.CommentDTO;
import dto.FilesDTO;
import dto.PageDTO;
import sun.print.resources.serviceui;

public class BoardServiceImp implements BoardService {
	
	private BoardDAO dao;

	
	public BoardServiceImp() {
		
	}
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public int dataCountProcess() {
		return dao.dataCount();
	}

	
	@Override
	public int UserLikeChk(BoardDTO dto) {
		int res = 0;
		if(dao.likechk(dto) == null) {	
			res = 1; //좋아요 누르지 않은 상태
		}else {
			res=2; //좋아요 누른 상태
		}

		return res;
	}
	
	@Override
	public int likechkProcess(BoardDTO dto) {
		int res = 0;
		if(dao.likechk(dto)== null) { //좋아요 누르지 않은 상태 -> 좋아요 증가 메소드
			dao.liked(dto.getB_num()); //좋아요 1 증가
			dao.insertLike(dto);
			res = 2;//2반환
		}else {
			dao.unliked(dto.getB_num()); //좋아요 1 감소
			dao.chk_del(dto); //like table 데이터 삭제
			res = 1; //1반환
		}
		
		return res;
	}
	
	@Override
	public int likeCountProcess(int b_num) {
		return dao.likeCount(b_num);
	}
	
	@Override
	public List<BoardDTO> listProcess(PageDTO pdto) {
		return dao.list(pdto);
	}

	@Override
	public List<BoardDTO> listAllProcess(PageDTO pdto) {
		return dao.listAll(pdto);
	}
	
	@Override
	public List<BoardDTO> listAllProcess() {
		return dao.list();
	}
	
	@Override
	public List<BoardDTO> viewProcess(int b_num) {
		dao.viewCount(b_num);
		return dao.view(b_num);
	}
	
    @Override
	public List<FilesDTO> getFiles(int b_num) {
		return dao.fileListMethod(b_num);
	}
    
    @Override
    public List<FilesDTO> fileChangePro(String f_name,int b_num) {
		if(f_name != null) {
			String saveDirectory =  "C:/Users/user2/git/fianl/finalproject/src/main/webapp/SHINnara/images";
			File ff = new File(saveDirectory, f_name);
			ff.delete();
			}
		
    	dao.fileChangeMethod(f_name);
    	return dao.fileListMethod(b_num);
    }
    
	@Override
	public List<CityDTO> getCityListProcess(String country_code) {
		return dao.getCityList(country_code);
	}

	@Override
	public void insertSugProcess(BoardDTO dto, HttpServletRequest request) {
		dao.insertSug(dto);
		List<MultipartFile> files = dto.getFilename();

		
		if(files != null) {
			List<FilesDTO> rupload = new ArrayList<FilesDTO>();
			for(MultipartFile file : files) {
				
				String fileName = file.getOriginalFilename();
				//System.out.println(fileName);
				// 중복파일명을 처리하기 위해 난수 발생
				UUID random = UUID.randomUUID();
				String root = request.getSession().getServletContext().getRealPath("/");
				
				String saveDirectory = "c:/Users/user2/git/final/finalproject/src/main/webapp/SHINnara/images";
				File fe = new File(saveDirectory);
				if(!fe.exists())
					fe.mkdir();
				File ff = new File(saveDirectory, random + "_" + fileName);
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				} catch (IOException e) {
					e.printStackTrace();
				}
				FilesDTO fdto = new FilesDTO();
				fdto.setBoard_b_num(dto.getB_num());
				fdto.setF_name(random + "_" + fileName);
				System.out.println(fdto.getF_name());
				rupload.add(fdto);			
			}
			dto.setFiles(rupload);
		}
		if(dto.getFiles() != null)			
			dao.fileInsertMethod(dto.getFiles());
		
	}//end insert()
	
	@Override
	public List<BoardDTO> UpdateProcess(BoardDTO dto) {
		dao.update(dto);
        List<MultipartFile> files = dto.getFilename();
		if(files != null) {
			List<FilesDTO> rupload = new ArrayList<FilesDTO>();
			for(MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				//System.out.println(fileName);
				// 중복파일명을 처리하기 위해 난수 발생
				UUID random = UUID.randomUUID();
				//String root = request.getSession().getServletContext().getRealPath("/");
				String saveDirectory ="c:/Users/user2/git/final/finalproject/src/main/webapp/SHINnara/images";
				File fe = new File(saveDirectory);
				if(!fe.exists())
					fe.mkdir();
				File ff = new File(saveDirectory, random + "_" + fileName);
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				} catch (IOException e) {
					e.printStackTrace();
				}
				FilesDTO fdto = new FilesDTO();
				fdto.setBoard_b_num(dto.getB_num());
				fdto.setF_name(random + "_" + fileName);
				rupload.add(fdto);			
			}
			dto.setFiles(rupload);
		}
		if(dto.getFiles() != null)			
			dao.fileInsertMethod(dto.getFiles());
		
		return dao.view(dto.getB_num());
	}//end update()
	
	

	@Override
	public void DeleteProcess(BoardDTO dto, HttpServletRequest request) {
		
		List<FilesDTO> list = dao.fileListMethod(dto.getB_num());
		if(list != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDirectory =  "C:/Users/user2/git/fianl/finalproject/src/main/webapp/SHINnara/images";
			for(FilesDTO fdto : list) {
				File ff = new File(saveDirectory, fdto.getF_name());
				ff.delete();
			}
		}
		dao.chk_del(dto);
		dao.fileDeleteMethod(dto.getB_num());
		dao.deleteAllCm(dto.getB_num());
		dao.delete(dto.getB_num());

	}

	@Override
	public int cityCountProcess(String city_code) {
		return dao.cityCount(city_code);
	}

	@Override
	public List<CommentDTO> insertCmPro(CommentDTO cdto) {
		dao.insertCm(cdto);
		return dao.commentList(cdto.getBoard_b_num());
	}
	
	@Override
	public List<CommentDTO> deleteCmPro(CommentDTO cdto) {
		dao.deleteCm(cdto.getCm_num());
		return dao.commentList(cdto.getBoard_b_num());
	}

	@Override
	public List<CommentDTO> updateCmPro(CommentDTO cdto) {
		dao.updateCm(cdto);
		return dao.commentList(cdto.getBoard_b_num());
	}
	
	@Override
	public List<CommentDTO> listCmPro(int b_num) {
		return dao.commentList(b_num);
	}
	
	@Override
	public Double rateAvgPro(int b_num) {
		return (Math.round((dao.rateAvg(b_num))*100)/100.0);
	}

	//----------------------------------------------------
	
	@Override
	public int BoardDataCountProcess() {
		return dao.BoardDataCount();
	}

	@Override
	public int BoardcityCountProcess(String city_code) {
		return dao.BoardCityCount(city_code);
	}

	@Override
	public List<BoardDTO> BoardListProcess(PageDTO pdto) {
		return dao.BoardList(pdto);
	}

	@Override
	public List<BoardDTO> BoardListAllProcess(PageDTO pdto) {
		return dao.BoardListAll(pdto);
	}
	
	@Override
	public void insertBoardProcess(BoardDTO dto) {
		dao.insertBoard(dto);
		List<MultipartFile> files = dto.getFilename();

		
		if(files != null) {
			List<FilesDTO> rupload = new ArrayList<FilesDTO>();
			for(MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				//System.out.println(fileName);
				// 중복파일명을 처리하기 위해 난수 발생
				UUID random = UUID.randomUUID();
				String saveDirectory = "c:/Users/user2/git/final/finalproject/src/main/webapp/SHINnara/images";
				File fe = new File(saveDirectory);
				if(!fe.exists())
					fe.mkdir();
				File ff = new File(saveDirectory, random + "_" + fileName);
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				} catch (IOException e) {
					e.printStackTrace();
				}
				FilesDTO fdto = new FilesDTO();
				fdto.setBoard_b_num(dto.getB_num());
				fdto.setF_name(random + "_" + fileName);
				rupload.add(fdto);			
			}
			dto.setFiles(rupload);
		}
		if(dto.getFiles() != null)			
			dao.fileInsertMethod(dto.getFiles());
		
	}//end insert()
	
	@Override
	public List<CommentDTO> insertBoardCmPro(CommentDTO cdto) {
		dao.insertBoardCm(cdto);
		return dao.commentList(cdto.getBoard_b_num());
	}
	
	@Override
	public BoardDTO getMostLikedPro() {
		return dao.getMostLiked();
	}
	
	@Override
	public BoardDTO getMostLikedCityPro(String city_code) {
		return dao.getMostLikedCity(city_code);
	}

	@Override
	public int sugSearchCountPro(PageDTO pdto) {
		return dao.sugSearchCount(pdto);
	}

	@Override
	public int boardSearchCountPro(PageDTO pdto) {
		return dao.boardSearchCount(pdto);
	}

	@Override
	public List<BoardDTO> sugSearchListPro(PageDTO pdto) {
		return dao.sugSearchList(pdto);
	}

	@Override
	public List<BoardDTO> boardSearchListPro(PageDTO pdto) {
		return dao.boardSearchList(pdto);
	}
}
