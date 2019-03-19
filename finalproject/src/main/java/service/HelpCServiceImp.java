package service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.HelpCDAO;
import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public class HelpCServiceImp implements HelpCService{
	private HelpCDAO hdao;
	
	public HelpCServiceImp() {
	}
	
	public void setHdao(HelpCDAO hdao) {
		this.hdao = hdao;
	}
	
	@Override
	public List<BoardDTO> hListProcess(PageDTO pdto) {
		return hdao.hListMethod(pdto);
	}

	@Override
	public BoardDTO hBlogProcess(int b_num) {
		return hdao.hBlogBlogMethod(b_num);
	}

	@Override
	public List<ReplyDTO> hcomListProcess(int borad_b_num) {
		return hdao.hComListMethod(borad_b_num);
	}

	@Override
	public void comInsertProcess(ReplyDTO rdto) {
		System.out.println(rdto.getCm_content());
		hdao.hComInsMethod(rdto);
	}

	@Override
	public void hReplyCntProcess(int b_num) {
		hdao.hReplyCntMethod(b_num);
		
	}

	@Override
	public void hBlogInsProcess(BoardDTO bdto) {
		hdao.hBlogInsMethod(bdto);
		
	}

	@Override
	public void hBlogDelProcess(int b_num) {
		hdao.hBlogDelMethod(b_num);
		
	}

	@Override
	public void hBlogUpProcess(BoardDTO bdto, HttpServletRequest request) {
		// 기존 첨부파일
		String filename = hdao.getFilename(bdto.getB_num());
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;

		// 수정할 첨부파일
		MultipartFile file = bdto.getUpload();

		// 수정한 첨부파일이 있으면
		if (!file.isEmpty()) {
			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();

			// 기존 첨부파일이 있으면....
			if (filename != null) {
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}

			String fileName = file.getOriginalFilename();
			bdto.setFilename(random + "_" + fileName);
			File ff = new File(saveDirectory, random + "_" + fileName);

			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		hdao.hBlogUpMethod(bdto);
		
	}

	@Override
	public void hComAllDelProcess(int board_b_num) {
		hdao.hComDelAllMethod(board_b_num);
		
	}

	@Override
	public int hBlogCountProcess() {
		
		return hdao.hBlogCountMethod();
	}

	@Override
	public int hBlogCountProcess2(String searchText) {
		return hdao.hBlogCountMethod2(searchText);
	}

	@Override
	public List<BoardDTO> hListProcess2(PageDTO pdto) {
		return hdao.hListMethod2(pdto);
	}

	@Override
	public String hFileProcess(int b_num) {
		return hdao.hFileMethod(b_num);
	}

	@Override
	public void hComDelProcess(int cm_num) {
		hdao.hComDelMethod(cm_num);
	}
	
}
