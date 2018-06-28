package store.domain;

public class BossVO {
	String bId;		//사장 ID
	String bPw;		//비밀번호
	String bBorn;	//생년월일
	String bName;	//이름
	String bTel;	//전화번호
	String bEmail;	//이메일
	String bZipcode;//우편번호
	String bAddress;//주소

	public BossVO() {
	}

	

	public BossVO(String bId, String bPw, String bBorn, String bName, String bTel, String bEmail, String bZipcode,
			String bAddress) {
		super();
		this.bId = bId;
		this.bPw = bPw;
		this.bBorn = bBorn;
		this.bName = bName;
		this.bTel = bTel;
		this.bEmail = bEmail;
		this.bZipcode = bZipcode;
		this.bAddress = bAddress;
	}



	public String getbTel() {
		return bTel;
	}



	public void setbTel(String bTel) {
		this.bTel = bTel;
	}



	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbPw() {
		return bPw;
	}

	public void setbPw(String bPw) {
		this.bPw = bPw;
	}

	public String getbBorn() {
		return bBorn;
	}

	public void setbBorn(String bBorn) {
		this.bBorn = bBorn;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getbZipcode() {
		return bZipcode;
	}

	public void setbZipcode(String bZipcode) {
		this.bZipcode = bZipcode;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

}
