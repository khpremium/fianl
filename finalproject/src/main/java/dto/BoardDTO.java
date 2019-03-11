package dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int b_num;
	private String title;
	private int b_category_c_num;
	private String b_content;
	private String client_id;
	private Date upload_date;
	private int viewcount;
	private int b_like;
	private int city_code;
	private String filename;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}
	public List<MultipartFile> getFilename2() {
		return filename2;
	}
	public void setFilename2(List<MultipartFile> filename2) {
		this.filename2 = filename2;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	private List<FilesDTO> fileList;
	private List<MultipartFile> filename2;
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getB_category_c_num() {
		return b_category_c_num;
	}
	public void setB_category_c_num(int b_category_c_num) {
		this.b_category_c_num = b_category_c_num;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
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
	public int getCity_code() {
		return city_code;
	}
	public void setCity_code(int city_code) {
		this.city_code = city_code;
	}
	public List<FilesDTO> getFileList() {
		return fileList;
	}
	public void setFileList(List<FilesDTO> fileList) {
		this.fileList = fileList;
	}
	public List<MultipartFile> getFilename() {
		return filename2;
	}
	public void setFilename(List<MultipartFile> filename) {
		this.filename2 = filename2;
	}
	
	
}
