package dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReplyDTO {
	private int cm_num;
	private int board_b_num;
	private String content;
	private String client_id;
	private java.sql.Date c_date;
	
	public int getCm_num() {
		return cm_num;
	}
	public void setCm_num(int cm_num) {
		this.cm_num = cm_num;
	}
	public int getBoard_b_num() {
		return board_b_num;
	}
	public void setBoard_b_num(int board_b_num) {
		this.board_b_num = board_b_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public java.sql.Date getC_date() {
		return c_date;
	}
	public void setC_date(java.sql.Date c_date) {
		this.c_date = c_date;
	}
	
    

}// end class
