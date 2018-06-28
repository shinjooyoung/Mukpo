package reserve.domain;

public class ReserveWeekVO {
	private String rId;		// 예약ID
	private String wrId;	// 주간예약ID
	
	public ReserveWeekVO() {}
	
	public ReserveWeekVO(String rId, String wrId) {
		super();
		this.rId = rId;
		this.wrId = wrId;
	}
	
	// Getter, Setter
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public String getWrId() {
		return wrId;
	}
	public void setWrId(String wrId) {
		this.wrId = wrId;
	}
	
	
}
