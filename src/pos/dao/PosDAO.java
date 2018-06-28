package pos.dao;

import java.util.List;

import pos.domain.CongestionSetVO;
import pos.domain.OrderListVO;
import pos.domain.PaymentVO;
import reserve.domain.ReserveVO;
import store.domain.MenuVO;
import store.domain.TableSetVO;

public interface PosDAO {
	// 오늘날짜 예약 포스기 화면에 띄어주기 -> select FROM 예약
	
	// 예약 거절 -> update 예약테이블의 예약상태컬럼을 RR로 바꿔주기
	
	// 혼잡도 보여주기 -> select FROM 혼잡도설정 / 혼잡도상태컬럼 Y인 것 뽑아오기 
	
	// 혼잡도 설정 -> update 혼잡도상태컬럼 그 전 상태는 N으로 변경, 설정한 상태는 Y로 변경
	
	// 테이블 수 불러오기 -> select 테이블매장관리에서 테이블 수 가져오기
	
	// 주문  받기 -> insert 주문내역 테이블에 등록
	
	// 주문 취소 -> update 주문내역 테이블 주문취소컬럼 값 OC로 변경
	
	// 결제 완료 -> update, select, insert 주문내역테이블에서 결제완료여부를 PO로 변경해주고 주문번호를 가져와 결제테이블에 등록
	
	// 결제 취소(환불) -> update 결제테이블에서 상태값컬럼을 PC로 변경
	
	//-----------------------------------------------------------------
	
	// 혼잡도 insert
	void insertCongestionset(CongestionSetVO pcVO);
	
//	// 혼잡도 설정
//	void updateCsYn();
//	
//	// 혼잡도 수정
//	void updateCongestionset();			// --------- 혼잡도 설정과 수정 합치기
	
	// 혼잡도 설정&수정
	void updateCongestionset(CongestionSetVO cVO); 
	
	// 혼잡도 보여주기
	CongestionSetVO selectCongestionset(CongestionSetVO vo);
	
	// 주문하기
	int insertOrderList(OrderListVO olVO);	// 주문취소
	//	void uapdateOyn();
	
	// 주문 내역보기
	List<OrderListVO> selectOrderList(String rCid);
	
//	// 결제 취소/완료
//	void updatePyn();			// ---------- 주문취소와 결제취소/완료 합치기
	
	// 주문취소 & 결제 취소/완료
	void updateOrderListYN(OrderListVO OrderListVO); // 결제 후 결제테이블에 삽입
	void insertPayment(PaymentVO ppVO);
	
	// 결제 취소할 때 결제테이블 상태값 바꿔주기
	void updatePstate(PaymentVO ppVO);


	// 사업자등록번호를 통한 메뉴리스트 가져오기
	List<MenuVO> selectMenuList(String rCid);

	// 사업자등록번호를 통한 매장 테이블정보 가져오기
	TableSetVO selectTableSet(String rCid);

	// 예약리스트 가져오기
	List<ReserveVO> selectReserveList(String rCid);

}
