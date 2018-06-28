package store.domain;

import common.domain.PagingVO;

public class StoreVO extends PagingVO{

	String rCid;		//사업자등록번호
	String bId;			//사장 ID
	String sPw;			//매장PW
	String sUrl;		//로고URL  
	String sName;		//업소명     
	String sTel;		//전화번호    
	String sZipcode;	//우편번호    
	String sAddress;	//주소       
	String sSido;		//시도
	String[] sSido2;	//현희 시도배열
	String sSigungu;	//시구군
	String[] sSigungu2;	//신주용 시군구 배열 값 추가
	String sMp;			//먹포구분(M,P,MP)
	String sCate;		//카테고리    
	String[] sCate2;	//신주용 배열카테고리 추가     
	String sOpentime;	//오픈시간    
	String sClosetime;	//마감시간    
	String sClose;		//휴무일     
	String sYn;			//휴폐업여부(Y,N)
	double sLatitude;	//위도
	double sLongitude;	//경도
	String sDetail;		//매장설명      
	String search;
	int startStore, endStore; // 페이지에 해당하는 매장의 첫번호와 끝번호

	public StoreVO() {}
	
	public StoreVO(String rCid, String bId, String sPw, String sUrl, String sName, String sTel, String sZipcode,
			String sAddress, String sSido, String sSigungu, String[] sSigungu2, String sMp, String sCate, String[] sCate2, String sOpentime,
			String sClosetime, String sClose, String sYn, double sLatitude, double sLongitude, String sDetail, String search) {
		super();
		this.rCid = rCid;
		this.bId = bId;
		this.sPw = sPw;
		this.sUrl = sUrl;
		this.sName = sName;
		this.sTel = sTel;
		this.sZipcode = sZipcode;
		this.sAddress = sAddress;
		this.sSido = sSido;
		this.sSigungu = sSigungu;
		this.sSigungu2 = sSigungu2; //신주용 시군구 배열 
		this.sMp = sMp;
		this.sCate = sCate;
		this.sCate2 = sCate2;	//신주용 카테고리 배열 
		this.sOpentime = sOpentime;
		this.sClosetime = sClosetime;
		this.sClose = sClose;
		this.sYn = sYn;
		this.sLatitude = sLatitude;
		this.sLongitude = sLongitude;
		this.sDetail = sDetail;
		this.search = search;
	}

	
	public String getsCate() {
		return sCate;
	}

	public void setsCate(String sCate) {
		this.sCate = sCate;
	}

	public String[] getsCate2() {
		return sCate2;
	}

	public void setsCate2(String[] sCate2) {
		this.sCate2 = sCate2;
	}

	public String getsSigungu() {
		return sSigungu;
	}

	public void setsSigungu(String sSigungu) {
		this.sSigungu = sSigungu;
	}
	// 1203 신주용 시군구 배열 값 추가
	public String[] getsSigungu2() {
		return sSigungu2;
	}

	public void setsSigungu2(String[] sSigungu2) {
		this.sSigungu2 = sSigungu2;
	}

	public String getrCid() {
		return rCid;
	}
	public void setrCid(String rCId) {
		this.rCid = rCId;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getsPw() {
		return sPw;
	}
	public void setsPw(String sPw) {
		this.sPw = sPw;
	}
	public String getsUrl() {
		return sUrl;
	}
	public void setsUrl(String sUrl) {
		this.sUrl = sUrl;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsTel() {
		return sTel;
	}
	public void setsTel(String sTel) {
		this.sTel = sTel;
	}
	public String getsZipcode() {
		return sZipcode;
	}
	public void setsZipcode(String sZipcode) {
		this.sZipcode = sZipcode;
	}
	public String getsAddress() {
		return sAddress;
	}
	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}
	public String getsSido() {
		return sSido;
	}
	public void setsSido(String sSido) {
		this.sSido = sSido;
	}
	public String getsMp() {
		return sMp;
	}
	public void setsMp(String sMp) {
		this.sMp = sMp;
	}
	public String getsOpentime() {
		return sOpentime;
	}
	public void setsOpentime(String sOpentime) {
		this.sOpentime = sOpentime;
	}
	public String getsClosetime() {
		return sClosetime;
	}
	public void setsClosetime(String sClosetime) {
		this.sClosetime = sClosetime;
	}
	public String getsClose() {
		return sClose;
	}
	public void setsClose(String sClose) {
		this.sClose = sClose;
	}
	public String getsYn() {
		return sYn;
	}
	public void setsYn(String sYn) {
		this.sYn = sYn;
	}
	public double getsLatitude() {
		return sLatitude;
	}
	public void setsLatitude(double sLatitude) {
		this.sLatitude = sLatitude;
	}
	public double getsLongitude() {
		return sLongitude;
	}
	public void setsLongitude(double sLongitude) {
		this.sLongitude = sLongitude;
	}

	public String getsDetail() {
		return sDetail;
	}

	public void setsDetail(String sDetail) {
		this.sDetail = sDetail;
	}
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String[] getsSido2() {
		return sSido2;
	}

	public void setsSido2(String[] sSido2) {
		this.sSido2 = sSido2;
	}

	public int getStartStore() {
		return startStore;
	}

	public void setStartStore(int startStore) {
		this.startStore = startStore;
	}

	public int getEndStore() {
		return endStore;
	}

	public void setEndStore(int endStore) {
		this.endStore = endStore;
	}
	
}
