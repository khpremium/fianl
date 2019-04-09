package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.FilesDTO;
import dto.PageDTO;
import service.BoardService;

//http://localhost:8090/myfinal/BoardList.do

@Controller
public class BoardController {
	BoardService service;	
	private int currentPage;
	private PageDTO pdto;
	
	public BoardController() {
	}
	
	public void setService(BoardService service) {
		this.service = service;
	}
	
	@RequestMapping("/BoardList.do")
	public ModelAndView BoardList(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.BoardDataCountProcess();

		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}

		pdto = new PageDTO(currentPage,totalRecord);
		
		
		List<BoardDTO> aList = service.BoardListAllProcess(pdto); //BoardDTO
	    for(int i=aList.size(); i>0; i--) {
	          aList.get(aList.size()-i).setB_like(service.likeCountProcess(aList.get(aList.size()-i).getB_num()));  
	    } //좋아요 갯수 출력을 위해 
	    
	    BoardDTO mlList = service.getMostLikedPro();
	    List<FilesDTO> files = service.getFiles(mlList.getB_num());
	    String filename = "";
	    for(FilesDTO dd : files) {
	    	filename = dd.getF_name();
	    }
	    
	    
	    //인기 게시글 이미지 출력을 위해
	    mav.addObject("filename",filename);
	    mav.addObject("mlList",mlList);
		mav.addObject("aList",aList);
		mav.addObject("pv", pdto);
		mav.setViewName("/board");
		
		return mav;
	}//end BoardList();
	
	@RequestMapping("/BoardCityList.do")
	public @ResponseBody ModelAndView cityListMethod(String city_code, PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int cityRecord= service.BoardcityCountProcess(city_code);
		if(cityRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}
	   pdto = new PageDTO(currentPage,cityRecord);
	   pdto.setCity_code(city_code);
		List<BoardDTO> aList = service.BoardListProcess(pdto); //BoardDTO
	    for(int i=aList.size(); i>0; i--) {
	          aList.get(aList.size()-i).setB_like(service.likeCountProcess(aList.get(aList.size()-i).getB_num()));
	    }
	    
	    BoardDTO mlList = service.getMostLikedCityPro(city_code);
	    
	    List<FilesDTO> files = service.getFiles(mlList.getB_num());
	    String filename = "";
	    for(FilesDTO dd : files) {
	    	filename = dd.getF_name();
	    }
		
	    mav.addObject("filename",filename);
	    mav.addObject("mlList",mlList);
		mav.addObject("aList",aList);
		mav.addObject("pv", pdto);
		mav.setViewName("/board");
	   
	   return mav;
	}
	
	@RequestMapping("/boardWirteForm.do")
	public ModelAndView writeMethod(PageDTO pv, BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vList",dto);
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.setViewName("/boardWrite");
		return mav;
	}//end wirtrForm
	
	@RequestMapping(value= "/boardWrite.do", method=RequestMethod.POST)
	public @ResponseBody void writeProMethod(BoardDTO dto, HttpServletRequest request) {
		service.insertBoardProcess(dto);		 
	}//end wirte
	
	@RequestMapping("/boardView.do")
	public ModelAndView viewMethod(int b_num,int currentPage) {
		ModelAndView mav = new ModelAndView();
		List<FilesDTO> ffo = service.getFiles(b_num);
		List<String> filenames = new ArrayList<String>(); 
		for(FilesDTO ff : ffo) {
			filenames.add(ff.getF_name());
		}
		
		//user 좋아요 여부 확인
		
		List<BoardDTO> vList = service.viewProcess(b_num);
		BoardDTO aa = vList.get(0);

		//System.out.println(aa.getUser_id() + aa.getB_num());
		vList.get(0).setUserLikeChk(service.UserLikeChk(aa));
		mav.addObject("vList",vList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("cmList", service.listCmPro(b_num));
		mav.addObject("files", filenames);	
		mav.addObject("likeCount", service.likeCountProcess(b_num));
		mav.setViewName("/boardView");
		return mav;
	}//end view
	
	@RequestMapping("/boardUpdateForm.do")
	public ModelAndView UpdateFormMethod(BoardDTO dto, int currentPage) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("fdto", service.getFiles(dto.getB_num()));
		mav.addObject("currentPage",currentPage);
		mav.setViewName("/boardUpdate");
		return mav;
	}
	
	
	@RequestMapping("/boardDelete.do")
	public String DeleteProMethod(BoardDTO dto, HttpServletRequest request) {
		service.DeleteProcess(dto, request);
		return "redirect:/BoardList.do";
	}

	@RequestMapping(value= "/boardCommentWrite.do", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> commentList(CommentDTO cdto){
		return  service.insertBoardCmPro(cdto);
	}
	
	@RequestMapping(value= "/boardSearchList.do", method=RequestMethod.GET)
	public @ResponseBody ModelAndView boardSearchList(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int searchRecord = service.boardSearchCountPro(pv);

		if(searchRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}

		pdto = new PageDTO(currentPage,searchRecord);
		pdto.setSearchWord(pv.getSearchWord());
		
		List<BoardDTO> aList = service.boardSearchListPro(pdto); //BoardDTO
	    for(int i=aList.size(); i>0; i--) {
	          aList.get(aList.size()-i).setB_like(service.likeCountProcess(aList.get(aList.size()-i).getB_num()));  
	    } //좋아요 갯수 출력을 위해 
		mav.addObject("aList",aList);
		mav.addObject("pv", pdto);
		mav.setViewName("/board");
		
		return mav;	
	}
	
}//end class
