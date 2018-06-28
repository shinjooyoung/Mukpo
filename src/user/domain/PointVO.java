package user.domain;

public class PointVO {
	
	int pId;
	String mId;
	String pDate;
	String pAs;
	String pStore;
	int pPrice;
	int pCruntmoney;
	// 날짜검색을 위해 추가
	String startDate;	// 시작날짜
	String endDate;		// 종료날짜
	
	public PointVO() {}

	public PointVO(int pId, String mId, String pDate, String pAs, String pStore, int pPrice, int pCruntmoney,
			String startDate, String endDate) {
		super();
		this.pId = pId;
		this.mId = mId;
		this.pDate = pDate;
		this.pAs = pAs;
		this.pStore = pStore;
		this.pPrice = pPrice;
		this.pCruntmoney = pCruntmoney;
		this.startDate = startDate;
		this.endDate = endDate;
	}



	// Setter, Getter
	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
		this.pDate = pDate;
	}

	public String getpAs() {
		return pAs;
	}

	public void setpAs(String pAs) {
		this.pAs = pAs;
	}

	public String getpStore() {
		return pStore;
	}

	public void setpStore(String pStore) {
		this.pStore = pStore;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCruntmoney() {
		return pCruntmoney;
	}

	public void setpCruntmoney(int pCruntmoney) {
		this.pCruntmoney = pCruntmoney;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
