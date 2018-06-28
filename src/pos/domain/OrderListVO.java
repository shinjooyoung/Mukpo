package pos.domain;

public class OrderListVO {
	private String oId;			// 주문ID
	private String oNum;		// 주문번호
	private String rCid;		// 사업자등록번호
	private String oMenu;		// 메뉴명
	private String oTablenum;	// 테이블번호
	private String oOrderdate;	// 주문날짜
	private Integer oCnt;		// 수량
	private Integer oKeepmoney;	// 예치금
	private Integer o_price;	// 금액
	private String oPyn;		// 결제완료여부
	private String oOyn;		// 주문취소
	
	public OrderListVO() {}
	
	public OrderListVO(String oId, String oNum, String rCid, String oMenu, String oTablenum, String oOrderdate,
			Integer oCnt, Integer oKeepmoney, Integer o_price, String oPyn, String oOyn) {
		super();
		this.oId = oId;
		this.oNum = oNum;
		this.rCid = rCid;
		this.oMenu = oMenu;
		this.oTablenum = oTablenum;
		this.oOrderdate = oOrderdate;
		this.oCnt = oCnt;
		this.oKeepmoney = oKeepmoney;
		this.o_price = o_price;
		this.oPyn = oPyn;
		this.oOyn = oOyn;
	}
	
	// Setter, Getter
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getrCid() {
		return rCid;
	}
	public void setrCid(String rCid) {
		this.rCid = rCid;
	}
	public String getoMenu() {
		return oMenu;
	}
	public void setoMenu(String oMenu) {
		this.oMenu = oMenu;
	}
	public String getoTablenum() {
		return oTablenum;
	}
	public void setoTablenum(String oTablenum) {
		this.oTablenum = oTablenum;
	}
	public String getoOrderdate() {
		return oOrderdate;
	}
	public void setoOrderdate(String oOrderdate) {
		this.oOrderdate = oOrderdate;
	}
	public Integer getoCnt() {
		return oCnt;
	}
	public void setoCnt(Integer oCnt) {
		this.oCnt = oCnt;
	}
	public Integer getoKeepmoney() {
		return oKeepmoney;
	}
	public void setoKeepmoney(Integer oKeepmoney) {
		this.oKeepmoney = oKeepmoney;
	}
	public Integer getO_price() {
		return o_price;
	}
	public void setO_price(Integer o_price) {
		this.o_price = o_price;
	}
	public String getoPyn() {
		return oPyn;
	}
	public void setoPyn(String oPyn) {
		this.oPyn = oPyn;
	}
	public String getoOyn() {
		return oOyn;
	}
	public void setoOyn(String oOyn) {
		this.oOyn = oOyn;
	}
	
	
}
