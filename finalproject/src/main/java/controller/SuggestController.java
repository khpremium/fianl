package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.CityDTO;

import dto.CommentDTO;

import dto.FilesDTO;
import dto.PageDTO;
import service.BoardService;

//http://localhost:8090/myfinal/List.do

//http://localhost:8090/myfinal/newList.do

@Controller
public class SuggestController {
	BoardService service;	
	private int currentPage;
	private PageDTO pdto;
	
	public SuggestController() {
		
	}
	
	public void setService(BoardService service) {
		this.service = service;
	}
	
	
	@RequestMapping("/newList.do")
	public ModelAndView list(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.dataCountProcess();

		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}

		pdto = new PageDTO(currentPage,totalRecord);
		List<BoardDTO> aList = service.listAllProcess(pdto); //BoardDTO
		
	    for(int i=aList.size(); i>0; i--) {
	          aList.get(aList.size()-i).setB_like(service
	        		  .likeCountProcess(aList.get(aList.size()-i).getB_num()));  
	          List<FilesDTO> fdto = service.getFiles(aList.get(aList.size()-i).getB_num());
	          for(FilesDTO aa:fdto) {    	  
	        	  aList.get(aList.size()-i).setFile(aa.getF_name());
	          }
	    }
	    
		mav.addObject("bList",aList);
		mav.addObject("pv", pdto);
		mav.setViewName("/SHINnara/newSuggest");
		return mav;
	}
	
	
	@RequestMapping("/List.do")
	public ModelAndView allListMethod(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.dataCountProcess();

		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}

		pdto = new PageDTO(currentPage,totalRecord);
		List<BoardDTO> aList = service.listAllProcess(pdto); //BoardDTO
		
	    for(int i=aList.size(); i>0; i--) {
	          aList.get(aList.size()-i).setB_like(service.likeCountProcess(aList.get(aList.size()-i).getB_num()));  
	          List<FilesDTO> fdto = service.getFiles(aList.get(aList.size()-i).getB_num());
	          for(FilesDTO aa:fdto) {    	  
	        	  aList.get(aList.size()-i).setFile(aa.getF_name());
	          }
	    }
	    
		mav.addObject("bList",aList);
		mav.addObject("pv", pdto);
		mav.setViewName("/SHINnara/suggest");
		return mav;
		

	}//end list()
	
	
	@RequestMapping("/CityList.do")
	public ModelAndView cityListMethod(String city_code, PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int cityRecord= service.cityCountProcess(city_code);
		if(cityRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}
	   pdto = new PageDTO(currentPage,cityRecord);
	   pdto.setCity_code(city_code);
	   List<BoardDTO> aList = service.listProcess(pdto); //BoardDTO
	   for(int i=aList.size(); i>0; i--) {
	        aList.get(aList.size()-i).setB_like(service.likeCountProcess(aList.get(aList.size()-i).getB_num()));
            List<FilesDTO> fdto = service.getFiles(aList.get(aList.size()-i).getB_num());
            for(FilesDTO aa:fdto) {
           	  aList.get(aList.size()-i).setFile(aa.getF_name());
            }
	    }
		
	   mav.addObject("bList",aList);
	   mav.addObject("pv", pdto);
	   mav.setViewName("/SHINnara/suggest");
	   
	   return mav;
	}
		
	
	@RequestMapping("/suggestView.do")
	public ModelAndView viewMethod(int b_num,int currentPage, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<FilesDTO> ffo = service.getFiles(b_num);
		List<String> filenames = new ArrayList<String>(); 
		for(FilesDTO ff : ffo) {
			filenames.add(ff.getF_name());
		}
			
		List<BoardDTO> vList = service.viewProcess(b_num);
		
		//user 좋아요 여부 확인
		String user = (String) session.getAttribute("id");
		if(user==null) {
			vList.get(0).setUserLikeChk(1);
			
		}else {
			BoardDTO likeDTO = new BoardDTO();
			likeDTO.setB_num(vList.get(0).getB_num());
			likeDTO.setUser_id(user);
			vList.get(0).setUserLikeChk(service.UserLikeChk(likeDTO));
		}
		mav.addObject("vList",vList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("cmList", service.listCmPro(b_num));
		mav.addObject("files", filenames);	
		mav.addObject("rateAvg", service.rateAvgPro(b_num));

		mav.addObject("likeCount", service.likeCountProcess(b_num));
		mav.setViewName("/SHINnara/suggestView");
		return mav;
	}
	
	@RequestMapping(value= "/suggestWriteForm.do", method=RequestMethod.GET)
	public ModelAndView writeMethod(PageDTO pv, BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vList",dto);
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.setViewName("/SHINnara/suggestWrite");
		return mav;
	}
	
	@RequestMapping(value= "/suggestWrite.do", method=RequestMethod.POST)
	public @ResponseBody void writeProMethod(BoardDTO dto, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		service.insertSugProcess(dto, request);		 
	}
	
	@RequestMapping("/sugUpdateForm.do")
	public ModelAndView UpdateFormMethod(BoardDTO dto, int currentPage) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("fdto", service.getFiles(dto.getB_num()));
		mav.addObject("currentPage",currentPage);
		mav.setViewName("/SHINnara/suggestUpdate");
		return mav;
	}
	
	@RequestMapping("/Update.do")
	public @ResponseBody List<BoardDTO> updateProMethod(BoardDTO dto){
		return service.UpdateProcess(dto);
	}
	
	@RequestMapping("/sugDelete.do")
	public String DeleteProMethod(BoardDTO dto, HttpServletRequest request) {
		service.DeleteProcess(dto, request);
		return "redirect:/List.do";
	}
	

	@RequestMapping("fileChange.do")
	public @ResponseBody List<FilesDTO> fileChange(String f_name, int b_num) {
		return service.fileChangePro(f_name,b_num);
	}
	
	@RequestMapping(value= "/chkCity.do", method=RequestMethod.GET)
	public @ResponseBody List<CityDTO> getCityCode(String country_code) {
		return service.getCityListProcess(country_code);
	}
	
	@RequestMapping(value= "/commentWrite.do", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> commentList(CommentDTO cdto){
		return  service.insertCmPro(cdto);
	}
	
	@RequestMapping("/commentDelete.do")
	public @ResponseBody List<CommentDTO> commentDelete(CommentDTO cdto){
		return  service.deleteCmPro(cdto);
	}
	
	@RequestMapping("/commentModify.do")
	public @ResponseBody List<CommentDTO> commentModify(CommentDTO cdto){
		return service.updateCmPro(cdto);
	}
	
	@RequestMapping(value="/likeProcess.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Integer> likeChk(BoardDTO dto, HttpSession session) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int likeChk =0;
		System.out.println("ddd");
		if(session.getAttribute("id")==null) {
			dto.setUser_id("nonUser");
			likeChk = service.likechkProcess(dto);
		}else {
			likeChk = service.likechkProcess(dto);
		}

		int likeCount = service.likeCountProcess(dto.getB_num());
		map.put("likeChk",likeChk);	
		map.put("likeCount",likeCount);

		return map;
	}
	
	@RequestMapping(value= "/sugSearchList.do", method=RequestMethod.GET)
	public @ResponseBody ModelAndView boardSearchList(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int searchRecord = service.sugSearchCountPro(pv);

		if(searchRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
		}

		pdto = new PageDTO(currentPage,searchRecord);
		pdto.setSearchWord(pv.getSearchWord());
		
		List<BoardDTO> aList = service.sugSearchListPro(pdto); //BoardDTO
	    for(int i=aList.size(); i>0; i--) {
	          aList.get(aList.size()-i).setB_like(service.likeCountProcess(aList.get(aList.size()-i).getB_num()));  
	          List<FilesDTO> fdto = service.getFiles(aList.get(aList.size()-i).getB_num());
	          for(FilesDTO aa:fdto) {    	  
	        	  aList.get(aList.size()-i).setFile(aa.getF_name());
	          }
	    }
		
	   mav.addObject("bList",aList);
	   mav.addObject("pv", pdto);
	   mav.setViewName("/SHINnara/suggest");
		
		return mav;	
	}
	
	
}//end class
