package reserve.domain;

public class ReserveVO {
	private String rId;			// 예약ID
	private String mId;			// 회원ID
	private String rCid;		// 사업자등록번호
	private String sName;		// 업소명 
	private String rMpwp;		// 예약유형
	private String rDate;		// 예약날짜
	private String rTime;		// 예약시간
	private Integer rPnum;		// 인원수
	private Integer rKeepmoney;	// 예치금
	private Integer rTnum;		// 테이블번호
	private String rYn;			// 예약상태
	
	public ReserveVO() {}
	
	public ReserveVO(String rId, String mId, String rCid, String sName, String rMpwp, String rDate, String rTime,
			Integer rPnum, Integer rKeepmoney, Integer rTnum, String rYn) {
		super();
		this.rId = rId;
		this.mId = mId;
		this.rCid = rCid;
		this.sName = sName; 
		this.rMpwp = rMpwp;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rPnum = rPnum;
		this.rKeepmoney = rKeepmoney;
		this.rTnum = rTnum;
		this.rYn = rYn;
	}
	
	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	// Getter, Setter
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getrCid() {
		return rCid;
	}
	public void setrCid(String rCid) {
		this.rCid = rCid;
	}
	public String getrMpwp() {
		return rMpwp;
	}
	public void setrMpwp(String rMpwp) {
		this.rMpwp = rMpwp;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public Integer getrPnum() {
		return rPnum;
	}
	public void setrPnum(Integer rPnum) {
		this.rPnum = rPnum;
	}
	public Integer getrKeepmoney() {
		return rKeepmoney;
	}
	public void setrKeepmoney(Integer rKeepmoney) {
		this.rKeepmoney = rKeepmoney;
	}
	public Integer getrTnum() {
		return rTnum;
	}
	public void setrTnum(Integer rTnum) {
		this.rTnum = rTnum;
	}
	public String getrYn() {
		return rYn;
	}
	public void setrYn(String rYn) {
		this.rYn = rYn;
	}
	
	
}
