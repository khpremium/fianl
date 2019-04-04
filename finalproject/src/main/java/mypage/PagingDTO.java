package mypage;

public class PagingDTO {
	private int currentPage; // �쁽�옱�럹�씠吏�
	private int totalCount; // 珥� �젅肄붾뱶�닔
	private int blockCount = 5; // �븳 �럹�씠吏��뿉 蹂댁뿬以� �젅肄붾뱶�닔
	private int blockPage = 3; // �븳 釉붾줉�뿉 蹂댁뿬以� �럹�씠吏��닔
	private int totalPage; // 珥� �럹�씠吏��닔
	private int startRow; // �떆�옉 �젅肄붾뱶 踰덊샇
	private int endRow; // �걹 �젅肄붾뱶踰덊샇
	private int startPage; // �븳 釉붾줉�쓽 �떆�옉 �럹�씠吏� 踰덊샇
	private int endPage; // �븳 釉붾줉�쓽 �걹�럹�씠吏� 踰덊샇
	private int number;	
	private String user_id;

	private String searchKey;
	private String searchWord;

	public PagingDTO() {

	}


	public PagingDTO(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		// �떆�옉�젅肄붾뱶
		startRow = (currentPage - 1) * blockCount + 1;

		// �걹�젅肄붾뱶
		endRow = startRow + blockCount - 1;

		// 珥앺럹�씠吏��닔
		totalPage = totalCount / blockCount + (totalCount % blockCount == 0 ? 0 : 1);

		// �떆�옉�럹�씠吏�
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;

		// �걹�럹�씠吏�
		endPage = startPage + blockPage - 1;
		if (totalPage < endPage)
			endPage = totalPage;

		// 由ъ뒪�듃�럹�씠吏��뿉 異쒕젰踰덊샇
		number = totalCount - (currentPage - 1) * blockCount;
	}
	

	public PagingDTO(int currentPage, int totalCount, String searchKey, String searchWord) {
		this(currentPage, totalCount);
		this.searchKey = searchKey;
		this.searchWord = searchWord;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	
}