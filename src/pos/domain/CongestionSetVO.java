package pos.domain;

public class CongestionSetVO {
	private String csId;	// 혼잡도ID
	private String rCid;	// 사업자등록번호
	private String csCongestion;	// 혼잡도(R, Y, G)
	private Integer csCnt;	// 주문건수
	private String csTime;	// 소요시간
	private String csYn;	// 상태
	
	public CongestionSetVO() {}
	
	public CongestionSetVO(String csId, String rCid, String csCongestion, Integer csCnt, String csTime,
			String csYn) {
		super();
		this.csId = csId;
		this.rCid = rCid;
		this.csCongestion = csCongestion;
		this.csCnt = csCnt;
		this.csTime = csTime;
		this.csYn = csYn;
	}
	
	// Getter, Setter
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public String getrCid() {
		return rCid;
	}
	public void setrCid(String rCid) {
		this.rCid = rCid;
	}
	public String getCsCongestion() {
		return csCongestion;
	}
	public void setCsCongestion(String csCongestion) {
		this.csCongestion = csCongestion;
	}
	public Integer getCsCnt() {
		return csCnt;
	}
	public void setCsCnt(Integer csCnt) {
		this.csCnt = csCnt;
	}
	public String getCsTime() {
		return csTime;
	}
	public void setCsTime(String csTime) {
		this.csTime = csTime;
	}
	public String getCsYn() {
		return csYn;
	}
	public void setCsYn(String csYn) {
		this.csYn = csYn;
	}
	
	
	
}


