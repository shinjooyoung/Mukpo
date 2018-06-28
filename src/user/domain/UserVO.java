package user.domain;

public class UserVO {

	String mId;		//회원ID
	String mPw;		//비밀번호
	String mName;	//회원 이름
	String mTel;	//전화번호
	String mBorn;	//생년월일
	String mEmail;	//이메일
	int mPoint;		//먹포인트
	String mYn;		//회원탈퇴(Y/N)
	
	public UserVO() {}
	
	public UserVO(String mId, String mPw, String mName, String mTel, String mBorn, String mEmail, int mPoint,
			String mYn) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mTel = mTel;
		this.mBorn = mBorn;
		this.mEmail = mEmail;
		this.mPoint = mPoint;
		this.mYn = mYn;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getmBorn() {
		return mBorn;
	}
	public void setmBorn(String mBorn) {
		this.mBorn = mBorn;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public int getmPoint() {
		return mPoint;
	}
	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}
	public String getmYn() {
		return mYn;
	}
	public void setmYn(String mYn) {
		this.mYn = mYn;
	}
	
}
