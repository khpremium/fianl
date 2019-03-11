package service;

import java.util.List;

import dao.HelpCDAO;
import dto.BoardDTO;
import dto.ReplyDTO;

public class HelpCServiceImp implements HelpCService{
	private HelpCDAO hdao;
	
	public HelpCServiceImp() {
	}
	
	public void setHdao(HelpCDAO hdao) {
		this.hdao = hdao;
	}
	
	@Override
	public List<BoardDTO> hListProcess() {
		return hdao.hListMethod();
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
	
}
