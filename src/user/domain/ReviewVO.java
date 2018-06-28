package user.domain;

public class ReviewVO {
	String rId;			//예약ID
	String rvContent;	//내용
	String rvDate;		//작성날짜
	
	public ReviewVO() {}
	
	
	public ReviewVO(String rId, String rvContent, String rvDate) {
		super();
		this.rId = rId;
		this.rvContent = rvContent;
		this.rvDate = rvDate;
	}


	public String getrId() {
		return rId;
	}


	public void setrId(String rId) {
		this.rId = rId;
	}


	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getRvDate() {
		return rvDate;
	}
	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}
}
