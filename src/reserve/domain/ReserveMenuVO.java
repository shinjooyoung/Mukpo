package reserve.domain;

public class ReserveMenuVO {
	private String rmid;	// 예약메뉴ID
	private String rId;		// 예약ID
	private Integer mId;	// 메뉴ID
	private Integer rmCnt;	// 수량
	
	public ReserveMenuVO() {}
	
	public ReserveMenuVO(String rmid, String rId, Integer mId, Integer rmCnt) {
		super();
		this.rmid = rmid;
		this.rId = rId;
		this.mId = mId;
		this.rmCnt = rmCnt;
	}
	
	// Getter, Setter
	public String getRmid() {
		return rmid;
	}
	public void setRmid(String rmid) {
		this.rmid = rmid;
	}
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public Integer getRmCnt() {
		return rmCnt;
	}
	public void setRmCnt(Integer rmCnt) {
		this.rmCnt = rmCnt;
	}
	
	
	
}
