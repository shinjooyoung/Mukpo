package user.domain;

public class FavoriteVO {
	String fId;	//단골매장ID
	String mId;	//회원ID
	String rCid;//사업자등록번호
	
	public FavoriteVO() {}
	
	public FavoriteVO(String fId, String mId, String rCid) {
		super();
		this.fId = fId;
		this.mId = mId;
		this.rCid = rCid;
	}
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
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
}
