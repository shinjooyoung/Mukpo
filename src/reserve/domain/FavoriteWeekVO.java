package reserve.domain;

public class FavoriteWeekVO {
	private String fwID;	// 주간예약ID

	public FavoriteWeekVO() {}
	
	public FavoriteWeekVO(String fwID) {
		super();
		this.fwID = fwID;
	}

	// Getter, Setter
	public String getFwID() {
		return fwID;
	}

	public void setFwID(String fwID) {
		this.fwID = fwID;
	}
	
	
}
