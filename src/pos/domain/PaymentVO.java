package pos.domain;

public class PaymentVO {
	private String oNum;	// 주문번호
	private String mId;		// 회원ID
	private String sId;		// 사업자등록번호
	private String rCid;	// 1209 주용사업자등록번호
	private String pWith;	// 결제수단
	private Integer oTotal;	// 총금액
	private String pState;	// 상대값
	private String sName;   // 업소명
	
	
	
	public PaymentVO(String oNum, String mId, String sId, String rCid, String pWith, Integer oTotal, String pState, String sName) {
		super();
		this.oNum = oNum;
		this.mId = mId;
		this.sId = sId;
		this.rCid = rCid;
		this.pWith = pWith;
		this.oTotal = oTotal;
		this.pState = pState;
		this.sName = sName;
	}
	public PaymentVO() {}
	public String getsName() {
		return sName;
	}
	
	public String getrCid() {
		return rCid;
	}
	public void setrCid(String rCid) {
		this.rCid = rCid;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	
	// Getter, Setter
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getpWith() {
		return pWith;
	}
	public void setpWith(String pWith) {
		this.pWith = pWith;
	}
	public Integer getoTotal() {
		return oTotal;
	}
	public void setoTotal(Integer oTotal) {
		this.oTotal = oTotal;
	}
	public String getpState() {
		return pState;
	}
	public void setpState(String pState) {
		this.pState = pState;
	}
	
	
	
}
