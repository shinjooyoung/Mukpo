package common.domain;

public class NoticeVO {
	private Integer nId;		// 공지사항ID
	private String nTitle;		// 제목
	private String nContent;	// 내용
	private Integer nHit;		// 조회수
	private String nDate;		// 작성날짜
	private String nYn;			// 공개여부
	
	public NoticeVO() {}
	
	public NoticeVO(Integer nId, String nTitle, String nContent, Integer nHit, String nDate, String nYn) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nHit = nHit;
		this.nDate = nDate;
		this.nYn = nYn;
	}
	
	// Getter, Setter
	public Integer getnId() {
		return nId;
	}
	public void setnId(Integer nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Integer getnHit() {
		return nHit;
	}
	public void setnHit(Integer nHit) {
		this.nHit = nHit;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getnYn() {
		return nYn;
	}
	public void setnYn(String nYn) {
		this.nYn = nYn;
	}
	
	
	
}
