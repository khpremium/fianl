package dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int b_num;
	private String b_content;
	private List<MultipartFile> filename;
	private List<FilesDTO> files;
	private int viewcount;
	private int b_like;
	private String user_id;
	private String city_code;
	private int b_category_c_num;
	private String title;
	private Date upload_date;
	private int userLikeChk = 0;

	private String file;
	
	private List<CommentDTO> replyList;
	
	public BoardDTO() {
		
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	public int getUserLikeChk() {
		return userLikeChk;
	}
	
	public void setUserLikeChk(int userLikeChk) {
		this.userLikeChk = userLikeChk;
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

	public List<MultipartFile> getFilename() {
		return filename;
	}
	
	public void setFilename(List<MultipartFile> filename) {
		this.filename = filename;
	}
	
	public List<FilesDTO> getFiles() {
		return files;
	}
	
	public void setFiles(List<FilesDTO> files) {
		this.files = files;
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

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	
	public Date getUpload_date() {
		return upload_date;
	}
	
	public List<CommentDTO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<CommentDTO> replyList) {
		this.replyList = replyList;
	}
}
