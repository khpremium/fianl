package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;
import service.HelpCService;

//http://localhost:8090/myfinal/helpMain.do

@Controller
public class HelpCController {
	private HelpCService service;
	private int currentPage;
	private PageDTO pdto;
	public HelpCController() {
	}
	
	public void setService(HelpCService service) {
		this.service = service;
	}
	
	@RequestMapping("/helpMain.do")
	public ModelAndView helpMain(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord =  service.hBlogCountProcess();
		if(totalRecord >= 1) { 
			if (pv.getCurrentPage() == 0) {
				currentPage =1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			mav.addObject("HList", service.hListProcess(pdto));
		}
		
		mav.setViewName("helpC");
		return mav;
	}
	
	@RequestMapping("/helpBlog.do")
	public ModelAndView helpBlog(int b_num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("currentPage", currentPage);
		mav.addObject("cList", service.hcomListProcess(b_num));
		mav.addObject("bdto", service.hBlogProcess(b_num));
		mav.setViewName("singleBlog");
		return mav;
	}
	
	@RequestMapping("/comInsertList.do")
	public @ResponseBody List<ReplyDTO> comInsList(ReplyDTO rdto) {
		service.comInsertProcess(rdto);
		return service.hcomListProcess(rdto.getBoard_b_num());
	}
	
	@RequestMapping("/boardWirete.do")
	public ModelAndView boardWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardwrite");
		return mav;
	}
	
	@RequestMapping(value="/wirtePro.do", method=RequestMethod.POST)
	public String writePro(BoardDTO bdto, HttpServletRequest request) {
		MultipartFile file=bdto.getUpload();
		if(!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			UUID random = UUID.randomUUID();
			
			/*String root = request.getSession().getServletContext().getRealPath("/");*/
			//System.out.println(root);
			/*String saveDirectory = root+"temp"+File.separator;*/
			String saveDirectory = "C:/Users/user2/git/fianl/finalproject/src/main/webapp/images";
			File fe = new File(saveDirectory);
			if(!fe.exists()) {
				fe.mkdir();
			}
			
			File ff = new File(saveDirectory, random+"_"+fileName);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bdto.setFilename(random+"_"+fileName);
		}
		
		service.hBlogInsProcess(bdto);
		return "redirect:/helpMain.do";
	}
	
	@RequestMapping("/blogDel.do")
	public String blogDel(int b_num, HttpRequest request) {
		service.hComAllDelProcess(b_num);
		String filename = service.hFileProcess(b_num);
		if (filename != null) {
			String saveDirectory = "C:/Users/user2/git/fianl/finalproject/src/main/webapp/images";
			File fe = new File(saveDirectory, filename);
			fe.delete();
		}
		service.hBlogDelProcess(b_num);
		return "redirect:/helpMain.do";
	}
	
	@RequestMapping("/blogUpForm.do")
	public ModelAndView blogUpForm(int b_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto", service.hBlogProcess(b_num));
		mav.setViewName("boardup");
		return mav;
	}
	
	@RequestMapping("/blogUpPro.do")
	public String blogUpPro(BoardDTO bdto, HttpServletRequest request) {
		service.hBlogUpProcess(bdto, request);
		return "redirect:/helpMain.do";
	}
	
	@RequestMapping("/blogSearch.do")
	public ModelAndView blogSearch(PageDTO pv) {
		System.out.println("Search");
		System.out.println(pv.getSearchWord());
		ModelAndView mav = new ModelAndView();
		int totalRecord =  service.hBlogCountProcess2(pv.getSearchWord());
		if(totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage =1;
			} else {
				currentPage = pv.getCurrentPage();
			}
		}
		pdto = new PageDTO(currentPage, totalRecord);
		pdto.setSearchWord(pv.getSearchWord());
		mav.addObject("pv", pdto);
		mav.addObject("HList", service.hListProcess2(pdto));
		
		mav.setViewName("helpC");
		return mav;
	}
	
	@RequestMapping("/hComDel.do")
	public @ResponseBody List<ReplyDTO> hComDel(int cm_num, int b_num) {
		service.hComDelProcess(cm_num);
		
		return service.hcomListProcess(b_num);
	}
	
	@RequestMapping("/hComUpd.do")
	public @ResponseBody List<ReplyDTO> hComUpd(ReplyDTO rdto){
		service.hComUpdProcess(rdto);
		
		return service.hcomListProcess(rdto.getBoard_b_num());
	}
	
	//http://localhost:8090/myfinal/kakaoLogin.do
	@RequestMapping("/kakaoLogin.do")
	public String kakaoLogin() {
		return "kakaoLogin";
	}
}
