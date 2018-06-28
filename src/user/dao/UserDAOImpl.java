package user.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import store.domain.MenuVO;
import store.domain.StoreVO;
import user.domain.FavoriteVO;
import user.domain.PointVO;
import user.domain.ReviewVO;
import user.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	
		@Autowired
		private SqlSessionTemplate commonss;
	
	   @Autowired
	   private SqlSessionTemplate userss;

		public int insertMemberJoin(UserVO vo) { // 사용자 회원가입  
			int result = 0;
			result = userss.insert("user.userInsert", vo);
			return result;
		}

		@Override
		public UserVO selectMemberLogin(UserVO vo) { // main - 사용자 로그인
			UserVO userVO = commonss.selectOne("user.userLogin", vo);
			return userVO;
		}

		@Override
		public int updateMemberModify(UserVO vo) { // 마이페이지 - 사용자 회원정보수정
			return userss.update("user.updateMemberModify", vo);
		}
	
		@Override
		public int updateMemberDelete(UserVO vo) { //마이페이지 - 회원탈퇴
			return userss.update("user.updateMemberDelete", vo);
		}	
		
		@Override
		public List<HashMap> selectFS(FavoriteVO vo) { //마이페이지 - 즐겨찾기 상점 목록			
			return userss.selectList("user.selectFS", vo);
		}
	
		@Override
		public ReviewVO selectReview(ReviewVO vo) { //마이페이지 - 내가 쓴 리뷰
			ReviewVO reviewVO = null;
			
			return reviewVO;
		}
		
		@Override
		public List<PointVO> selectPoint(PointVO vo) { // 마이페이지 - 포인트 현황
			return userss.selectList("user.selectPoint", vo);
		}
	
		@Override
		public int insertPoint(PointVO vo) { // 마이페이지 - 포인트 적립
	
			return userss.insert("user.insertPoint", vo);
		}
		
		@Override
		public List<PointVO> selectPointDate(PointVO vo) {	//마이페이지 - 먹포인트 현황 (날짜검색)
			return userss.selectList("user.selectPointDate", vo);
		}
	
		@Override
		public PointVO selectPointCharge(PointVO pointVO) {	// 마이페이지 - 현재포인트
			return userss.selectOne("user.selectPointCharge", pointVO);
		}
	
		@Override
		public UserVO selectMemberName(UserVO userVO) {	// 회원명 검색
			return userss.selectOne("user.selectMemberName", userVO);
		}
	

		@Override
		public List<HashMap> selectLatelyReview(String mp) { // 메인 - 생생리뷰
			HashMap map = new HashMap();
			map.put("rMpwp", mp);
			return userss.selectList("user.selectLatelyReview", map);
		}
		
		@Override
		public List<StoreVO> getAddrList(StoreVO storeVO) { // 마이페이지 - 주간예약 매장검색 
			HashMap map = new HashMap();
			map.put("search", storeVO.getSearch());
			return userss.selectList("user.getaddr", map);
			
		}

		@Override
		public int insertReview(ReviewVO vo) {		//마이페이지 - 예약내역 리뷰 작성
			int result = 0;
			return userss.insert("user.reviewInsert", vo);
		}
		
		@Override
		public UserVO selectMemberModifyCheck(UserVO vo) {
			return userss.selectOne("user.selectMemberModifyCheck", vo);
		}

		@Override
		public int insertFavorite(FavoriteVO vo) {
			return userss.insert("user.insertFavorite", vo);
		}

		@Override
		public int deleteFavorite(FavoriteVO vo) {
			return userss.delete("user.deleteFavorite", vo);
		}
		
		@Override
		public List<MenuVO> selectMenuList(MenuVO menuVO) {
			return userss.selectList("user.selectMMenuList", menuVO);
		}
		
		// 상점 위도,경도 및 정보 가져오기
		@Override
		public List<StoreVO> selectMStoreLocation(StoreVO vo) {
			return userss.selectList("user.selectMStoreLocation", vo);
		}
		
		// 상점 위도,경도 및 정보 가져오기
		@Override
		public List<StoreVO> selectPStoreLocation(StoreVO vo) {
			return userss.selectList("user.selectPStoreLocation", vo);
		}
}