package dto;

import java.util.Date;

public class ReplyDTO {
	private int cm_num;
	private int board_b_num;
	private String cm_content;
	private String user_id;
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
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public java.sql.Date getC_date() {
		return c_date;
	}
	public void setC_date(java.sql.Date c_date) {
		this.c_date = c_date;
	}
	
	
    

}// end class
