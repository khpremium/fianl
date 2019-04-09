package dto;

public class PageDTO {
	private int currentPage; // ����������
	private int totalCount; // �� ���ڵ��
	private int blockCount = 5; // �� �������� ������ ���ڵ��
	private int blockPage = 1; // �� ��Ͽ� ������ ��������
	private int totalPage; // �� ��������
	private int startRow; // ���� ���ڵ� ��ȣ
	private int endRow; // �� ���ڵ��ȣ
	private int startPage; // �� ����� ���� ������ ��ȣ
	private int endPage; // �� ����� �������� ��ȣ
	private int number;	

	private String city_code;
	private String searchKey;
	private String searchWord;

	public PageDTO() {

	}


	public PageDTO(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		// ���۷��ڵ�
		startRow = (currentPage - 1) * blockCount + 1;

		// �����ڵ�
		endRow = startRow + blockCount - 1;

		// ����������
		totalPage = totalCount / blockCount + (totalCount % blockCount == 0 ? 0 : 1);

		// ����������
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;

		// ��������
		endPage = startPage + blockPage - 1;
		if (totalPage < endPage)
			endPage = totalPage;

		// ����Ʈ�������� ��¹�ȣ
		number = totalCount - (currentPage - 1) * blockCount;
	}

	public PageDTO(int currentPage, int totalCount, String searchKey, String searchWord) {
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
	
	public String getCity_code() {
		return city_code;
	}
	
	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}
}
