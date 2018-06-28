package reserve.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pos.domain.PaymentVO;
import reserve.domain.ReserveMenuVO;
import reserve.domain.ReserveVO;
import store.domain.MenuVO;
import user.domain.UserVO;
@Repository
public class ReserveDAOImpl implements ReserveDAO{
	
	@Autowired
	private SqlSessionTemplate reservess;

	@Override
	public int reserveInsert(ReserveVO vo) {					//예약하기 insert
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap> reserveList(ReserveVO vo) {			//예약 불러오기 select
			return  reservess.selectList("reserve.reserveList", vo);
	}

	@Override
	public ReserveVO reserveUpdate(ReserveVO vo) {				//예약 취소 or 주간예약 취소,변경 update
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int reserveMenuInsert(ReserveMenuVO vo) {				//메뉴 예약 insert
		return reservess.insert("reserve.reserveMenuInsert", vo);
	}

//	@Override
//	public ReserveVO reserveMenuList(ReserveVO vo) {			//메뉴 예약 불러오기 select 
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int reserveWeekInsert(ReserveVO vo) {				// 주간예약하기 insert
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReserveVO reserveWeekSelect(ReserveVO vo) {			// 주간예약 불러오기select
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReserveVO favoriteWeekInsert(ReserveVO vo) {			// 주간 예약즐겨찾기 insert
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReserveVO favoriteWeekSelect(ReserveVO vo) {			// 주주간예약 즐겨찾기 불러오기 select
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuVO> reserveMenuList(ReserveVO vo) {			// 메뉴정보 가져오기 
		return reservess.selectList("reserve.reserveMenuList", vo);
	}
	
	@Override
	public List<UserVO> reserveTable(UserVO vo) { 		//ReserveM 회원정보 가져오기
		return reservess.selectList("reserve.reserveTable", vo);
	}

	@Override
	public int reservePayment(PaymentVO vo) {
		return reservess.insert("reserve.reservePayment",vo); // 아름 수정
	}
	
	//추가 포장 결제
	@Override
	public int reservePackage(ReserveVO vo) {			// 주용 포장예약
		// TODO Auto-generated method stub
		return reservess.insert("reserve.reservePackage",vo);
	}

	// 1213 아름 사업자등록번호로 업소명 검색
	@Override
	public ReserveVO selectreserveInfo(ReserveVO vo) {
		return reservess.selectOne("reserve.selectreserveInfo", vo);
	}

	@Override
	public ReserveVO reservePaymentOk(ReserveVO vo) {
		return reservess.selectOne("reserve.reservePaymentOk", vo);
	}

	// 예약내역
	@Override
	public ReserveVO selectReserveListView(String rId) {
		return reservess.selectOne("reserve.selectReserveListView", rId);
	}

	//POS기에서 예약 상세내역 보기
	@Override
	public List<HashMap> selectReserveDetail(String rId) {
		return reservess.selectList("reserve.selectReserveDetail", rId);
	}

}
