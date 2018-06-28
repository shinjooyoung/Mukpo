package reserve.dao;

import java.util.HashMap;
import java.util.List;

import pos.domain.PaymentVO;
import reserve.domain.ReserveMenuVO;
import reserve.domain.ReserveVO;
import store.domain.MenuVO;
import user.domain.UserVO;

public interface ReserveDAO {

	int reserveInsert(ReserveVO vo); //예약하기 insert
	
	List<HashMap> reserveList(ReserveVO vo); //예약 불러오기 select
	
	ReserveVO reserveUpdate(ReserveVO vo); //예약 취소 or 주간예약 취소,변경 update
	
	int reserveMenuInsert(ReserveMenuVO vo); // ReserveMenuVO로 수정 메뉴 예약 insert
	
	//ReserveVO reserveMenuList(ReserveVO vo); //메뉴 예약 불러오기 select 
	
	int reserveWeekInsert(ReserveVO vo); // 주간예약하기 insert
	
	ReserveVO reserveWeekSelect(ReserveVO vo); // 주간예약 불러오기select
	
	ReserveVO favoriteWeekInsert(ReserveVO vo); // 주간 예약즐겨찾기 insert
	
	ReserveVO favoriteWeekSelect(ReserveVO vo); // 주주간예약 즐겨찾기 불러오기 selsect
	
	List<MenuVO> reserveMenuList(ReserveVO vo); // 아름 메뉴정보 가져오기 
	
	List<UserVO> reserveTable(UserVO vo); //테이블예약 회원정보 가져오기
	
	int reservePayment(PaymentVO vo);
	
	int reservePackage(ReserveVO vo);	//주용 포장 예약

	ReserveVO selectreserveInfo(ReserveVO vo); //사업자등록번호로 업소명 검색

	ReserveVO reservePaymentOk(ReserveVO vo);

	ReserveVO selectReserveListView(String rId); //예약내역

	List<HashMap> selectReserveDetail(String rId);	//POS기에서 예약 상세내역 보기
	
}
