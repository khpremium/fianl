package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BcatDTO;
import dto.BoardDTO;
import dto.CityDTO;
import dto.CityPageDTO;
import dto.CommentDTO;
import dto.FilesDTO;
import dto.PageDTO;

public class BoardDaoImp implements BoardDAO{
	private SqlSessionTemplate sqlSession;
	
	public BoardDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int dataCount() {
		return sqlSession.selectOne("suggest.dataCount");
	}
	
	@Override
	public int viewCount(int b_num) {
		return sqlSession.update("suggest.viewCount",b_num);
	}
	
	@Override
	public void insertLike(BoardDTO dto) {
		sqlSession.insert("like_chk.first_insert",dto);
	}
	
	@Override
	public int first_chk(BoardDTO dto) {
		return sqlSession.selectOne("like_chk.FirstChk",dto);
	}
	
    @Override
	public int likechk(BoardDTO dto) {
		return sqlSession.selectOne("like_chk.likeChk", dto);
	}
	
	@Override
	public void chk_liked(BoardDTO dto) {
		sqlSession.update("like_chk.chk_liked", dto);
	}
	
    @Override
	public void chk_unliked(BoardDTO dto) {
    	sqlSession.update("like_chk.chk_unliked", dto);
	}
    
	@Override
	public void chk_del(BoardDTO dto) {
		sqlSession.delete("like_chk.chk_del",dto);
	}
    
	@Override
	public void liked(int b_num) {
		sqlSession.update("suggest.liked",b_num);
	}
	
	@Override
	public void unliked(int b_num) {
		sqlSession.update("suggest.Unliked",b_num);
	}
	
	@Override
	public int likeCount(int b_num) {
		return sqlSession.selectOne("suggest.likeCount",b_num);
	}
	
	@Override
	public List<BoardDTO> list(PageDTO pdto) {
		return sqlSession.selectList("suggest.list",pdto);
	}

	@Override
	public List<BoardDTO> listAll(PageDTO pdto) {
		return sqlSession.selectList("suggest.listAll",pdto);
	}
	
	@Override
	public List<BoardDTO> list() {
		return sqlSession.selectList("suggest.listAll");
	}

	@Override
	public List<BoardDTO> view(int b_num) {
		return sqlSession.selectList("suggest.view",b_num);
	}

	@Override
	public List<CityDTO> getCityList(String country_code) {
		return sqlSession.selectList("suggest.getCityList",country_code);
	}

	@Override
	public void insertSug(BoardDTO bdto) {
	    sqlSession.insert("suggest.sugWrite",bdto);
	}

	@Override
	public void fileInsertMethod(List<FilesDTO> fileList) {
		sqlSession.insert("files.f_insert",fileList);
	}

	@Override
	public List<FilesDTO> fileListMethod(int b_num) {
		return sqlSession.selectList("files.f_list",b_num);
	}

	@Override
	public void fileDeleteMethod(int b_num) {
		sqlSession.delete("files.f_delete_all",b_num);
	}
	
	@Override
	public void fileChangeMethod(String f_name) {
		sqlSession.delete("files.f_delete",f_name);
	}
	
	@Override
	public void fileUpdateMethod(BoardDTO dto) {
		sqlSession.update("files.f_update",dto);
	}

	@Override
	public int cityCount(String city_code) {
		return sqlSession.selectOne("suggest.cityCount",city_code);
	}

	@Override
	public void delete(int b_num) {
		sqlSession.delete("suggest.Delete",b_num);
	}

	@Override
	public void update(BoardDTO bdto) {
		sqlSession.update("suggest.Update",bdto);
	}

	@Override
	public List<CommentDTO> commentList(int b_num) {
		return sqlSession.selectList("comment.cm_list",b_num);
	}

	@Override
	public void insertCm(CommentDTO cdto) {
		sqlSession.insert("comment.cm_insert",cdto);
	}
	
	@Override
	public void insertBoardCm(CommentDTO cdto) {
		sqlSession.insert("comment.board_cm_insert",cdto);
	}

	@Override
	public void deleteCm(int cm_num) {
		sqlSession.delete("comment.cm_delete",cm_num);
	}
	
	@Override
	public void deleteAllCm(int b_num) {
		sqlSession.delete("comment.sug_cm_delete",b_num);
	}
	
	@Override
	public void updateCm(CommentDTO cdto) {
		sqlSession.update("comment.cm_update",cdto);
	}
	
	@Override
	public double rateAvg(int b_num) {
		return sqlSession.selectOne("comment.rateAvg",b_num);
	}
	
	
	//----------------------------------------------------------
	
	@Override
	public int BoardCityCount(String city_code) {
		return sqlSession.selectOne("board.cityCount",city_code);
	}
	
	@Override
	public int BoardDataCount() {
		return sqlSession.selectOne("board.dataCount");
	}
	
	@Override
	public List<BoardDTO> BoardList(PageDTO pdto) {
		return sqlSession.selectList("board.list",pdto);
	}
	
	@Override
	public List<BoardDTO> BoardListAll(PageDTO pdto) {
		return sqlSession.selectList("board.listAll",pdto);
	}
	
	@Override
	public void insertBoard(BoardDTO bdto) {
		sqlSession.insert("board.boardWrite",bdto);
	}
	
	@Override
	public BoardDTO getMostLiked() {
		BoardDTO dto = new BoardDTO();
		if(sqlSession.selectList("board.mostLiked").size()>1) {
			dto = (BoardDTO) sqlSession.selectList("board.mostLiked").get(0);
		}else {
			dto = sqlSession.selectOne("board.mostLiked");
		}
		return dto;
	}
	
	@Override
	public BoardDTO getMostLikedCity(String city_code) {
		BoardDTO dto = new BoardDTO();
		if(sqlSession.selectList("board.mostLikedCity",city_code).size()>1) {
			dto = (BoardDTO) sqlSession.selectList("board.mostLikedCity",city_code).get(0);
			
		}else {
			dto = sqlSession.selectOne("board.mostLikedCity",city_code);
		}
		return dto;
	}
	
	@Override
	public int boardSearchCount(PageDTO pdto) {
		return sqlSession.selectOne("board.searchCount",pdto);
	}
	
	@Override
	public List<BoardDTO> boardSearchList(PageDTO pdto) {
		return sqlSession.selectList("board.listSearch",pdto);
	}
	
	@Override
	public int sugSearchCount(PageDTO pdto) {
		return sqlSession.selectOne("suggest.searchCount",pdto);
	}
	
	@Override
	public List<BoardDTO> sugSearchList(PageDTO pdto) {
		return sqlSession.selectList("suggest.listSearch",pdto);
	}

	
	
}
