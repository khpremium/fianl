package mypage;

import java.sql.Date;

public class MyBoardDTO {
	private int b_num;
	private String b_content;
	private String filename;
	private int viewcount;
	private int b_like;
	private String user_id;
	private String city_code;
	private int b_category_c_num;
	private String title;
	private Date upload_date;
	
	public MyBoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCity_code() {
		return city_code;
	}

	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}

	public int getB_category_c_num() {
		return b_category_c_num;
	}

	public void setB_category_c_num(int b_category_c_num) {
		this.b_category_c_num = b_category_c_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	
	
}// class
