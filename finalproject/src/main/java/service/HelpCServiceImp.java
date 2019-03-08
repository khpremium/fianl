package service;

import java.util.List;

import dao.HelpCDAO;
import dto.BoardDTO;

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
	
}
