package store.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pos.domain.CongestionSetVO;
import reserve.domain.ReserveVO;
import store.domain.BlackListVO;
import store.domain.BossVO;
import store.domain.MenuVO;
import store.domain.StoreVO;
import store.domain.TableSetVO;
import user.domain.FavoriteVO;
import user.domain.UserVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate storess;

	// 사장님 로그인 기능 구현
	@Override
	public BossVO selectBossLogin(BossVO vo) {
		return storess.selectOne("store.selectBossLogin", vo);
	}

	@Override
	public int insertBossJoin(BossVO vo) {
		// TODO Auto-generated method stub
		return storess.insert("store.insertBossRegister",vo);
	}

	@Override
	public BossVO selectBossIdCheck(BossVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBossInfoModify(BossVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 사장님 정보 가져오는 기능 구현
	@Override
	public BossVO selectBossSearch(BossVO vo) {
		return storess.selectOne("store.selectBossSearch", vo);
	}

	@Override
	public int updateBossInfoDelete(BossVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 매장 등록 기능 구현
	@Override
	public int insertStoreInfo(StoreVO vo) {
		return storess.insert("store.insertStoreInfo", vo);
	}

	// 테이블 매장 관리 테이블 입력
	@Override
	public int insertTableSet(TableSetVO vo) {
		return storess.insert("store.insertTableSet", vo);
	}

	//매장 정보 수정
	@Override
	public int updateStoreModify(StoreVO vo) {
		// TODO Auto-generated method stub
		return storess.update("store.updateStoreInfo",vo);
	}
	
	//매장 테이블 수 수정
	@Override
	public int updateTableSetModify(TableSetVO vo) {
		// TODO Auto-generated method stub
		return storess.update("store.updateTableSet",vo);
	}

	@Override
	public int updateStoreDelete(String vo) {
		// TODO Auto-generated method stub
		return storess.update("store.updateStoreDelete",vo);
	}

	@Override
	public int updateTableSetDelete(TableSetVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 혼잡도 수정
	@Override
	public int updateCongestionset(CongestionSetVO vo) {
		
		return storess.update("store.updateCongestionset",vo);
	}

	// 매장 목록 리스트 반환 메소드
	@Override
	public List<StoreVO> selectStoreList(BossVO vo) {
		return storess.selectList("store.selectStoreList", vo);
	}

	@Override
	public int insertMenu(MenuVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMenuModify(MenuVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMenuDelete(MenuVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBlackList(BlackListVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int blackListUpdate(BlackListVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int blackListDelete(BlackListVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BlackListVO> menuInsert(BlackListVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용자 매장검색 리스트
	@Override
	public List<StoreVO> selectUserStore(StoreVO store) {

		return storess.selectList("store.selectUserStore", store);
	}
	
	//사용자 매장리스트 총개수
	public int countUserStore(StoreVO store) {
		return storess.selectOne("store.countUserStore", store);
	}

	// 혼잡도 초기설정
	@Override
	public int insertCongestionset(CongestionSetVO vo) {
		return storess.insert("store.insertCongestionset", vo);
	}

	// 매장의 메뉴를 출력하는 기능 구현
	@Override
	public List<MenuVO> selectMenuList(MenuVO menuVO) {
		return storess.selectList("store.selectMMenuList", menuVO);
	}
	
	@Override
	public List<MenuVO> selectMenuList(StoreVO storeVO) {
		return storess.selectList("store.selectMenuList", storeVO);
	}

	// 매장의 메뉴 카테고리 가져오는 기능 구현
	@Override
	public List<MenuVO> selectMenuCate(MenuVO menuVO) {
		return storess.selectList("store.selectMenuCate", menuVO);
	}

	// 매장 리뷰 가져오는 기능 구현
	@Override
	public List<HashMap> selectReviewList(MenuVO menuVO) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("rCid", menuVO.getrCid());
		return storess.selectList("store.selectReviewList", menuVO);
	}

	// 매장 혼잡도 가져오는 기능 구현
	@Override
	public String selectCongestionset(CongestionSetVO congestionSetVO) {
		return storess.selectOne("store.selectCongestionset", congestionSetVO);
	}

	// 선택한 매장에 대한 테이블 정보를 가져오는 기능 구현
	@Override
	public TableSetVO selectTableSetSearch(TableSetVO tableSetVO) {
		return storess.selectOne("store.selectTableSetSearch", tableSetVO);
	}

	//매장설명 가져오는 기능 구현
	@Override
	public StoreVO selectStore(StoreVO storeVO) {
		return storess.selectOne("store.selectStore", storeVO);
	}
	
	//즐겨찾기 매장 가져오는 기능 구현
	@Override
	public FavoriteVO selectFavoriteStore(FavoriteVO vo) {
		return storess.selectOne("store.selectFavoriteStore", vo);
	}
	
	//시군구 가져오는 기능 구현
	@Override
	public List<StoreVO> selectSigungu(StoreVO storeVO) {
		return storess.selectList("store.selectSigungu", storeVO);
	}

	//메뉴 카테고리 리스트 가져오기
	@Override
	public List<MenuVO> selectCateList(MenuVO menuVO) {
		return storess.selectList("store.selectCateList", menuVO);
	}
	
	// 사장님 예약리스트 출력
	@Override
	public List<ReserveVO> selectReserveList(ReserveVO reserveVO) {
		return storess.selectList("store.selectReserveList", reserveVO);
	}
	
	//사장님 예약리스트 거절
	@Override
	public int storeReserveUpdate(ReserveVO reserveVO) {
		return storess.update("store.storeReserveUpdate", reserveVO);
	}
		
	// 사장님 예약리스트 거절
	@Override
	public int storeReserveUpdateOk(ReserveVO reserveVO) {
		return storess.update("store.storeReserveUpdateOk", reserveVO);
	}
	
	//사장님 예약리스트 거절
	@Override
	public int storeReserveReturn(ReserveVO reserveVO) {
		return storess.update("store.storeReserveReturn", reserveVO);
	}
	
	// 페이지별로 매장 출력
		public List<StoreVO> selectPageStore(StoreVO storeVO) {
			return storess.selectList("store.selectPageStore", storeVO);
		}

		@Override
		public StoreVO selectStorerCid(String rCid) {
			// TODO Auto-generated method stub
			return storess.selectOne("store.selectStorerCid",rCid);
		}
	
	
}
