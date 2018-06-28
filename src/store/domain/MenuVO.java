package store.domain;

public class MenuVO {
	int mId;		//메뉴ID
	String rCid;	//사업자등록번호
	String mCate;	//메뉴카테고리
	String mName;	//메뉴명
	String mDetail;	//메뉴 설명
	String mUrl;	//메뉴url
	int mPrice;		//메뉴 가격
	String mYn;		//판매여부(Y/N)
	
	public MenuVO() {}
	
	
	public MenuVO(int mId, String rCid, String mCate, String mName, String mDetail, String mUrl, int mPrice,
			String mYn) {
		super();
		this.mId = mId;
		this.rCid = rCid;
		this.mCate = mCate;
		this.mName = mName;
		this.mDetail = mDetail;
		this.mUrl = mUrl;
		this.mPrice = mPrice;
		this.mYn = mYn;
	}


	public String getmDetail() {
		return mDetail;
	}


	public void setmDetail(String mDetail) {
		this.mDetail = mDetail;
	}


	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getrCid() {
		return rCid;
	}
	public void setrCid(String rCid) {
		this.rCid = rCid;
	}
	public String getmCate() {
		return mCate;
	}
	public void setmCate(String mCate) {
		this.mCate = mCate;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmUrl() {
		return mUrl;
	}
	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public String getmYn() {
		return mYn;
	}
	public void setmYn(String mYn) {
		this.mYn = mYn;
	}
	
}
