package store.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import common.domain.PagingVO;
import pos.domain.CongestionSetVO;
import reserve.domain.ReserveVO;
import store.dao.MongoDAO;
import store.dao.StoreDAO;
import store.domain.BossVO;
import store.domain.ImageFileInfoVO;
import store.domain.ImageFileVO;
import store.domain.MenuVO;
import store.domain.StoreVO;
import store.domain.TableSetVO;
import user.domain.FavoriteVO;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreDAO storeDAO;
	@Autowired
	private MongoDAO mongoDAO;

	// 화면 띄우기
	@RequestMapping(value = "/{url}.do")
	public String url(@PathVariable String url) {
		return "/store/" + url;
	}

	@RequestMapping("/storeBossLogin.do")
	public void storeBossLogin() {

	}

	// 로그인 후 Main으로 이동하며 데이터 처리하는 메소드
	@RequestMapping("/storeMain.do")
	public ModelAndView storeMain(BossVO bossVO, HttpSession httpsession) {
		ModelAndView mv = new ModelAndView();
		BossVO result = null;
		if (httpsession.getAttribute("bId") == null) {

			result = storeDAO.selectBossLogin(bossVO); // 로그인 후 사장님 정보 가져오기

			if (result != null) { // 로그인 정보가 일치할때
				httpsession.setAttribute("bId", result.getbId()); // 세션에 사장님 아이디 저장
				mv.setViewName("store/storeMain"); // viewname 지정
				List<StoreVO> storeList = storeDAO.selectStoreList(bossVO); // 사장님 아이디에 대한 매장 목록 가져오기
				mv.addObject("storeList", storeList); // model에 매장 목록 추가
				mv.addObject("bossInfo", result); // model에 사장 정보 추가

			} else { // 로그인 정보가 불일치할때
				mv.setViewName("store/storeBossLogin"); // 로그인 실패시 다시 로그인 창으로 이동
			}
		} else {
			mv.setViewName("store/storeMain"); // viewname 지정
			bossVO.setbId((String) httpsession.getAttribute("bId"));
			bossVO = storeDAO.selectBossSearch(bossVO);
			List<StoreVO> storeList = storeDAO.selectStoreList(bossVO); // 사장님 아이디에 대한 매장 목록 가져오기
			mv.addObject("storeList", storeList); // model에 매장 목록 추가
			mv.addObject("bossInfo", bossVO); // model에 사장 정보 추가
		}
		return mv;
	}

	// 매장 등록화면으로 이동하며 데이터 처리하는 메소드
	@RequestMapping(value = "/storeInput.do")
	public ModelAndView storeInput(BossVO bossVO, String bId) {
		ModelAndView mv = new ModelAndView();
		bossVO.setbId(bId);
		bossVO = storeDAO.selectBossSearch(bossVO);

		mv.setViewName("store/storeInput");
		mv.addObject("bossVO", bossVO);

		return mv;

	}

	// 매장 등록하는 메소드
	@RequestMapping(value = "/storeInputOk.do")
	public ModelAndView storeInputOk(StoreVO storeVO, TableSetVO tableSetVO, String[] checkbox, String GcsCnt,
			String GcsTime, String YcsCnt, String YcsTime, String RcsCnt, String RcsTime) {
		String msg = "매장 등록, 매장테이블 등록, 혼잡도 설정 실패";

		// Start - store테이블 등록 부분
		storeVO.setsAddress(storeVO.getsAddress() + " " + storeVO.getsSido());
		StringTokenizer st = new StringTokenizer(storeVO.getsAddress());
		storeVO.setsSido(st.nextToken());
		storeVO.setsSigungu(st.nextToken());
		String sClose = "";
		for (String tmp : checkbox) {
			sClose = sClose + tmp + ", ";
		}
		storeVO.setsClose(sClose);
		int result = storeDAO.insertStoreInfo(storeVO);
		if (result > 0) {
			msg = "매장 등록 완료! 매장 테이블 등록,혼잡도 설정 실패!";
		}
		// End - 매장정보 등록 부분

		// Start - tableset테이블 등록부분
		int tSetResult = storeDAO.insertTableSet(tableSetVO);
		if (tSetResult > 0) {
			msg = "매장정보,매장 테이블 정보 등록 완료! 혼잡도 설정 실패!";
		}
		// End - tableset테이블 등록부분

		// Start - CongestionSet테이블 등록부분
		CongestionSetVO gConSetVO = new CongestionSetVO();
		CongestionSetVO yConSetVO = new CongestionSetVO();
		CongestionSetVO rConSetVO = new CongestionSetVO();

		gConSetVO.setrCid(storeVO.getrCid());
		gConSetVO.setCsId(storeVO.getrCid() + "_G");
		gConSetVO.setCsCongestion("G");
		gConSetVO.setCsCnt(Integer.parseInt(GcsCnt));
		gConSetVO.setCsTime(GcsTime);
		gConSetVO.setCsYn("Y");

		yConSetVO.setrCid(storeVO.getrCid());
		yConSetVO.setCsId(storeVO.getrCid() + "_Y");
		yConSetVO.setCsCongestion("Y");
		yConSetVO.setCsCnt(Integer.parseInt(YcsCnt));
		yConSetVO.setCsTime(YcsTime);
		yConSetVO.setCsYn("N");

		rConSetVO.setrCid(storeVO.getrCid());
		rConSetVO.setCsId(storeVO.getrCid() + "_R");
		rConSetVO.setCsCongestion("R");
		rConSetVO.setCsCnt(Integer.parseInt(RcsCnt));
		rConSetVO.setCsTime(RcsTime);
		rConSetVO.setCsYn("N");

		int result1 = storeDAO.insertCongestionset(gConSetVO);
		int result2 = storeDAO.insertCongestionset(yConSetVO);
		int result3 = storeDAO.insertCongestionset(rConSetVO);
		if (result1 > 0) {
			msg = "매장정보,매장 테이블 정보 등록 완료! Y,R혼잡도 설정 실패!";
		}
		if (result2 > 0) {
			msg = "매장정보,매장 테이블 정보 등록 완료! R혼잡도 설정 실패!";
		}
		if (result3 > 0) {
			msg = "매장정보 등록 완료!";
		}

		// End - CongestionSet테이블 등록부분

		ModelAndView mv = new ModelAndView();
		mv.setViewName("store/storeInputOk");
		mv.addObject("result", result3);
		mv.addObject("message", msg);

		return mv;
	}

	// 매장 설정화면으로 이동하며 데이터 처리하는 메소드
	@RequestMapping(value = "/storeSetting.do")
	public ModelAndView storeSetting(String rCid) {
		
		MenuVO mvo = new MenuVO();
		mvo.setrCid(rCid);

		StoreVO svo = storeDAO.selectStorerCid(rCid);
		List<MenuVO> list = storeDAO.selectMenuList(svo); // 메장 의 메뉴리스트 뽑아 오기
		List<MenuVO> catelist = storeDAO.selectCateList(mvo); // 매뉴 카테고리

		ModelAndView mv = new ModelAndView();

		mv.setViewName("store/storeModify"); // viewname 지정
		mv.addObject("menuList", list);
		mv.addObject("cateList", catelist);
		mv.addObject("storeVO", svo); // model에 매장정보 추가

		return mv;
	}

	// 매장 검색
		@RequestMapping(value = "storeList.do")
		public ModelAndView storeList(StoreVO store, String pageCount, PagingVO page) {

			
			String[] lo = store.getsSido().split(",");
			String[] ca = store.getsCate().split(",");
			 
			store.setsSido2(lo);
			store.setsCate2(ca);
			ModelAndView mv = new ModelAndView();
			mv.addObject("sMp", store.getsMp()); // 매장인지 포장인지 구분값
			
			int totalCount = storeDAO.countUserStore(store); // 매장 리스트 총 갯수
			page.setTotalCount(totalCount);
			// 총 페이지 수 구하기 
			int pageSize = 1; 
			if(pageSize % 10 == 0) pageSize = totalCount / 10;
			else pageSize += totalCount / 10;
//			if(pageCount == null) page.setPageNo(0); // 현재 페이지 번호
			// 시작 페이지 구하기
//			if(page.getPageNo() == 0) page.setFirstPageNo(1);
//			else page.setFirstPageNo(page.getPageNo()*5 + 1);
			// 끝 페이지 구하기
//			page.setFinalPageNo((page.getPageNo()+1)*5);
			
			// 끝매장 첫매장 구하기 
//			int startStore = 10 * (Integer.parseInt(pageCount) - 1) + 1; // 시작매장
//			int endStore = 10 * Integer.parseInt(pageCount); // 끝 매장
			
//			store.setStartStore(startStore);
//			store.setEndStore(endStore);
			
			store.setStartStore(1);
			store.setEndStore(10);
			int start=0;
			int end=0;
			end=page.getPageNo()*10;
			start=end-9;
			store.setStartStore(start);
			store.setEndStore(end);
			
			List<StoreVO> list = storeDAO.selectPageStore(store); // 상점리스트 받아오기
			mv.addObject("pSido",store.getsSido());
			mv.addObject("pCate",store.getsCate());
			
			mv.addObject("storeList", list);// 상점리스트
			mv.addObject("pageVO", page);// 페이징 정보
			mv.setViewName("store/storeList");
			return mv;
		}

	// 포장 상세 페이지
	@RequestMapping("/storePdetail.do")
	public ModelAndView storePdetail(MenuVO menuVO, StoreVO storeVO, HttpServletRequest request) {

		String rCid = request.getParameter("rCid");
		storeVO.setrCid(rCid);
		ModelAndView mv = new ModelAndView();
		List<MenuVO> list = storeDAO.selectMenuList(storeVO);
		List<MenuVO> catelist = storeDAO.selectCateList(menuVO);
		List<HashMap> reviewList = storeDAO.selectReviewList(menuVO);
		storeVO = storeDAO.selectStore(storeVO);

		mv.setViewName("store/storePdetail");

		mv.addObject("cateList", catelist);
		mv.addObject("menuList", list);
		mv.addObject("reviewList", reviewList);
		mv.addObject("storeVO", storeVO);
		return mv;
	}

	// 매장 상세 페이지
	@RequestMapping(value = "storeMdetail.do")
	public ModelAndView storeMdetail(MenuVO menuVO, CongestionSetVO congestionSetVO, TableSetVO tableSetVO,
			StoreVO storeVO, FavoriteVO favoriteVO, HttpSession httpsession) {

		List<MenuVO> menuVOCate = storeDAO.selectMenuCate(menuVO); // 매장의 메뉴 카테고리 가져오는 기능 구현
		List<MenuVO> menuVOList = storeDAO.selectMenuList(menuVO); // 매장의 메뉴를 출력하는 기능 구현
		String congestionState = (String) storeDAO.selectCongestionset(congestionSetVO); // 매장의 혼잡도 가져오는 기능 구현
		tableSetVO = storeDAO.selectTableSetSearch(tableSetVO); // 매장의 테이블정보 가져오기
		storeVO = storeDAO.selectStore(storeVO); // 매장설명 가져오는 기능 구현
		List<HashMap> reviewList = storeDAO.selectReviewList(menuVO); // 매장의 리뷰 가져오는 기능 구현
		//즐겨찾기 매장 가져오는 기능 구현
		Object userName = "";
		userName = httpsession.getAttribute("userName");
		ModelAndView mv = new ModelAndView();
		mv.addObject("favoriteVO", "즐겨찾기X");
		if (userName != null) {
			favoriteVO.setmId((String) httpsession.getAttribute("userName"));
			favoriteVO = storeDAO.selectFavoriteStore(favoriteVO);
			mv.addObject("reserveInfo", userName);	// 로그인여부확인
			if (favoriteVO != null) {
				mv.addObject("favoriteVO", "즐겨찾기O");
			}
		}

		mv.setViewName("store/storeMdetail");
		mv.addObject("menuVOCate", menuVOCate);
		mv.addObject("menuVOList", menuVOList);
		mv.addObject("congestionState", congestionState);
		mv.addObject("tableSetVO", tableSetVO);
		mv.addObject("storeVO", storeVO);
		mv.addObject("reviewList", reviewList);
		return mv;
	}

	// 모달창 pwd 체크
	@RequestMapping(value = "bossPwdCheck.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bossPwdCheck(String bossId, String bossPwd, String rCid) {
		BossVO bossVO = new BossVO();
		bossVO.setbId(bossId);
		bossVO.setbPw(bossPwd);

		bossVO = storeDAO.selectBossLogin(bossVO); // 로그인 후 사장님 정보 가져오기
		if (bossVO == null) {
			rCid = null;
		}

		return rCid;
	}

	//경기도 시군구 불러오기
	@RequestMapping(value = "/sigunguSelect.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public void sigunguSelect(Model model, HttpServletResponse response, HttpServletRequest request, StoreVO store) {
		List<StoreVO> storeVOList = storeDAO.selectSigungu(store); // mybatis형식으로 데이터 가져오기
		List<JSONObject> rList = new ArrayList<>(); // 제이슨 오브젝트 리스트 생성

		JSONArray ja = new JSONArray(); // 제이슨Array 배열생성

		for (int i = 0; i < storeVOList.size(); i++) { // 가져온 데이터값 돌려서 한줄씩 JSONobject에 넣기
			JSONObject obj = new JSONObject(); // JONS형식으로 변환할 OBJECT형식 선언
			try {
				obj.put("sSigungu", storeVOList.get(i).getsSigungu());
				ja.put(obj);// object에 넣은값을 배열로 변환하기위해 JSONArray에 넣기
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 제이슨obj에 가져온 값 넣기
		}
		try {
			response.getWriter().print(ja.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 사장회원가입
	@RequestMapping(value = "bossRegister.do")
	public ModelAndView userRegister(BossVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String bAddr1 = request.getParameter("bAddr1"); // 주소값 받아오기
		String bAddr2 = request.getParameter("bAddr2"); // 상세주소값 받아오기
		String bAddress = bAddr1 + "-" + bAddr2; // 주소+상세주소 합치기
		vo.setbAddress(bAddress); // 주고 set
		int result = storeDAO.insertBossJoin(vo);

		mv.setViewName("store/storeBossLogin");
		mv.addObject("result", result);
		return mv;
	}

	// store 예약내역 불러오기 기능
	@RequestMapping(value = "/storeReserve.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public void storeReserve(Model model, HttpServletResponse response, HttpServletRequest request, ReserveVO vo) {

		List<ReserveVO> reserveVOList = storeDAO.selectReserveList(vo); // mybatis형식으로 데이터 가져오기

		List<JSONObject> rList = new ArrayList<>(); // 제이슨 오브젝트 리스트 생성

		JSONArray ja = new JSONArray(); // 제이슨Array 배열생성

		for (int i = 0; i < reserveVOList.size(); i++) { // 가져온 데이터값 돌려서 한줄씩 JSONobject에 넣기
			JSONObject obj = new JSONObject(); // JONS형식으로 변환할 OBJECT형식 선언
			try {
				obj.put("mId", reserveVOList.get(i).getmId());
				obj.put("rMpwp", reserveVOList.get(i).getrMpwp());
				obj.put("rDate", reserveVOList.get(i).getrDate());
				obj.put("rPnum", reserveVOList.get(i).getrPnum());
				obj.put("rTnum", reserveVOList.get(i).getrTnum());
				obj.put("rYn", reserveVOList.get(i).getrYn());
				obj.put("rId", reserveVOList.get(i).getrId());

				ja.put(obj);// object에 넣은값을 배열로 변환하기위해 JSONArray에 넣기
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 제이슨obj에 가져온 값 넣기
		}
		try {

			response.getWriter().print(ja.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// store 예약내역x버튼 눌렀을떄
	   @RequestMapping(value = "/storeReserveUpdate.do", produces = "text/json;charset=UTF-8")
	   @ResponseBody
	   public void storeReserveUpdate(Model model, HttpServletResponse response, HttpServletRequest request,
	         ReserveVO vo) {
	      
	      String mId = request.getParameter("mId");
	      String rId = request.getParameter("rId");
	      String rCid = request.getParameter("rCid");
	      vo.setmId(mId);
	      vo.setrId(rId);
	      vo.setrCid(rCid);
	      int result = storeDAO.storeReserveUpdate(vo); // 예약 취소 업데이트
	      vo.setmId(mId);
	      vo.setrId(rId);
	      vo.setrCid(rCid);

	      int result2 = storeDAO.storeReserveReturn(vo); // 포인트 환급 업데이트

	      vo.setmId(mId);
	      vo.setrId(rId);
	      vo.setrCid(rCid);
	      List<ReserveVO> reserveVOList = storeDAO.selectReserveList(vo); // mybatis형식으로 데이터 가져오기

	      List<JSONObject> rList = new ArrayList<>(); // 제이슨 오브젝트 리스트 생성

	      JSONArray ja = new JSONArray(); // 제이슨Array 배열생성

	      for (int i = 0; i < reserveVOList.size(); i++) { // 가져온 데이터값 돌려서 한줄씩 JSONobject에 넣기
	         JSONObject obj = new JSONObject(); // JONS형식으로 변환할 OBJECT형식 선언
	         try {
	            obj.put("mId", reserveVOList.get(i).getmId());
	            obj.put("rMpwp", reserveVOList.get(i).getrMpwp());
	            obj.put("rDate", reserveVOList.get(i).getrDate());
	            obj.put("rPnum", reserveVOList.get(i).getrPnum());
	            obj.put("rTnum", reserveVOList.get(i).getrTnum());
	            obj.put("rYn", reserveVOList.get(i).getrYn());
	            obj.put("rId", reserveVOList.get(i).getrId());

	            ja.put(obj);// object에 넣은값을 배열로 변환하기위해 JSONArray에 넣기
	         } catch (JSONException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         } // 제이슨obj에 가져온 값 넣기
	      }
	      try {

	         response.getWriter().print(ja.toString());
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }

	   }

	   //store 예약내역O버튼 눌렀을떄
	   @RequestMapping(value = "/storeReserveUpdateOk.do", produces = "text/json;charset=UTF-8")
	   @ResponseBody
	   public void storeReserveUpdateOk(Model model, HttpServletResponse response, HttpServletRequest request,
	         ReserveVO vo) {
	      String mId = vo.getmId();
	      String rId = vo.getrId();
	      String rCid = vo.getrCid();
	      
	      vo.setmId(mId);
	      vo.setrId(rId);
	      vo.setrCid(rCid);
	      int result = storeDAO.storeReserveUpdateOk(vo); // 예약 업데이트
	      vo.setmId(mId);
	      vo.setrId(rId);
	      vo.setrCid(rCid);
	      List<ReserveVO> reserveVOList = storeDAO.selectReserveList(vo); // mybatis형식으로 데이터 가져오기

	      List<JSONObject> rList = new ArrayList<>(); // 제이슨 오브젝트 리스트 생성

	      JSONArray ja = new JSONArray(); // 제이슨Array 배열생성

	      for (int i = 0; i < reserveVOList.size(); i++) { // 가져온 데이터값 돌려서 한줄씩 JSONobject에 넣기
	         JSONObject obj = new JSONObject(); // JONS형식으로 변환할 OBJECT형식 선언
	         try {
	            obj.put("mId", reserveVOList.get(i).getmId());
	            obj.put("rMpwp", reserveVOList.get(i).getrMpwp());
	            obj.put("rDate", reserveVOList.get(i).getrDate());
	            obj.put("rPnum", reserveVOList.get(i).getrPnum());
	            obj.put("rTnum", reserveVOList.get(i).getrTnum());
	            obj.put("rYn", reserveVOList.get(i).getrYn());
	            obj.put("rId", reserveVOList.get(i).getrId());

	            ja.put(obj);// object에 넣은값을 배열로 변환하기위해 JSONArray에 넣기
	         } catch (JSONException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         } // 제이슨obj에 가져온 값 넣기
	      }
	      try {

	         response.getWriter().print(ja.toString());
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
	// 매장 사진등록 페이지로 이동하며 사업자등록번호 넘겨주기
	@RequestMapping(value = "storeImageInput.do")
	public ModelAndView storeImageInput(String rCid) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("store/storeImageInput");
		mv.addObject("rCid", rCid);

		return mv;
	}

	// 파일 업로드 및 파일정보 몽고db에 추가
	@RequestMapping(value = "storeImageInputOk.do")
	public ModelAndView storeImageInputOk(ImageFileVO vo) {
		ModelAndView mv = new ModelAndView();
		if (vo.getFile() != null) {
			for (MultipartFile tmp : vo.getFile()) {
				UUID uid = UUID.randomUUID();
				ImageFileInfoVO info = new ImageFileInfoVO();
				info.setrCid(vo.getrCid());
				info.setSaveName(uid.toString() + "_" + tmp.getOriginalFilename());
				info.setFileSize(tmp.getSize());
				info.setFileName(tmp.getOriginalFilename());

				mongoDAO.insertImgFileInfo(info);

			}
		}
		mv.addObject("rCid", vo.getrCid());
		mv.setViewName("store/storeImageInputOk");

		return mv;
	}

	
	 // 주간예약 메뉴카테 가져오기
  	@RequestMapping(value = "reservWeeklyMenuCate.do", produces="text/json;charset=UTF-8")
  	@ResponseBody
  	public void reservWeeklyMenuCate(MenuVO menuVO, HttpServletResponse response) throws JSONException, IOException {
  		List<MenuVO> menuCate = storeDAO.selectMenuCate(menuVO);
  		JSONArray ja = new JSONArray();
  		
  		for(int i = 0; i < menuCate.size(); i++) {
  			JSONObject obj = new JSONObject();
  			obj.put("mCate", menuCate.get(i).getmCate());
  			
  			ja.put(obj);
  		}
  		response.getWriter().print(ja.toString());
  	}
  	
  	
 // 매장 등록하는 메소드
 	@RequestMapping(value = "/storeModifyOk.do")
 	public ModelAndView storeModifyOk(StoreVO storeVO, TableSetVO tableSetVO, String[] checkbox, String GcsCnt,
 			String GcsTime, String YcsCnt, String YcsTime, String RcsCnt, String RcsTime) {
 		String msg = "매장 수정, 매장테이블 수정, 혼잡도 설정 실패";

 		// Start - store테이블 등록 부분
 		storeVO.setsAddress(storeVO.getsAddress() + " " + storeVO.getsSido());
 		StringTokenizer st = new StringTokenizer(storeVO.getsAddress());
 		storeVO.setsSido(st.nextToken());
 		storeVO.setsSigungu(st.nextToken());
 		String sClose = "";
 		for (String tmp : checkbox) {
 			sClose = sClose + tmp + ", ";
 		}
 		storeVO.setsClose(sClose);
 		int result = storeDAO.updateStoreModify(storeVO);
 		if (result > 0) {
 			msg = "매장 수정 완료! 매장 테이블 수정,혼잡도 설정 실패!";
 		}
 		// End - 매장정보 등록 부분

 		// Start - tableset테이블 등록부분
 		int tSetResult = storeDAO.updateTableSetModify(tableSetVO);
 		if (tSetResult > 0) {
 			msg = "매장정보 수정,매장 테이블 정보 수정 완료! 혼잡도 설정 수정!";
 		}
 		// End - tableset테이블 등록부분

 		// Start - CongestionSet테이블 등록부분
 		CongestionSetVO gConSetVO = new CongestionSetVO();
 		CongestionSetVO yConSetVO = new CongestionSetVO();
 		CongestionSetVO rConSetVO = new CongestionSetVO();

 		gConSetVO.setrCid(storeVO.getrCid());
 		gConSetVO.setCsId(storeVO.getrCid() + "_G");
 		gConSetVO.setCsCongestion("G");
 		gConSetVO.setCsCnt(Integer.parseInt(GcsCnt));
 		gConSetVO.setCsTime(GcsTime);
 		gConSetVO.setCsYn("Y");

 		yConSetVO.setrCid(storeVO.getrCid());
 		yConSetVO.setCsId(storeVO.getrCid() + "_Y");
 		yConSetVO.setCsCongestion("Y");
 		yConSetVO.setCsCnt(Integer.parseInt(YcsCnt));
 		yConSetVO.setCsTime(YcsTime);
 		yConSetVO.setCsYn("N");

 		rConSetVO.setrCid(storeVO.getrCid());
 		rConSetVO.setCsId(storeVO.getrCid() + "_R");
 		rConSetVO.setCsCongestion("R");
 		rConSetVO.setCsCnt(Integer.parseInt(RcsCnt));
 		rConSetVO.setCsTime(RcsTime);
 		rConSetVO.setCsYn("N");

 		int result1 = storeDAO.updateCongestionset(gConSetVO);
 		int result2 = storeDAO.updateCongestionset(yConSetVO);
 		int result3 = storeDAO.updateCongestionset(rConSetVO);
 		if (result1 > 0) {
 			msg = "매장정보,매장 테이블 정보 수정 완료! Y,R혼잡도 설정 실패!";
 		}
 		if (result2 > 0) {
 			msg = "매장정보,매장 테이블 정보 수정 완료! R혼잡도 설정 실패!";
 		}
 		if (result3 > 0) {
 			msg = "매장정보 수정 완료!";
 		}

 		// End - CongestionSet테이블 등록부분

 		ModelAndView mv = new ModelAndView();
 		mv.setViewName("store/storeModify");
 		mv.addObject("result", result3);
 		mv.addObject("message", msg);

 		return mv;
 	}
  	
 	//매장 삭제하는 메소드
 	@RequestMapping(value="/storeDeleteOk.do")
 	public ModelAndView storeDeleteOk(BossVO bossVO,StoreVO vo,HttpSession session ) {
 		session.setAttribute("bId", vo.getbId());
 		int result1 = storeDAO.updateStoreDelete(vo.getrCid());
 		BossVO result = null;
 		ModelAndView mv = new ModelAndView();
 		if (session.getAttribute("bId") == null) {

			result = storeDAO.selectBossLogin(bossVO); // 로그인 후 사장님 정보 가져오기

			if (result != null) { // 로그인 정보가 일치할때
				session.setAttribute("bId", result.getbId()); // 세션에 사장님 아이디 저장
				mv.setViewName("store/storeMain"); // viewname 지정
				List<StoreVO> storeList = storeDAO.selectStoreList(bossVO); // 사장님 아이디에 대한 매장 목록 가져오기
				mv.addObject("storeList", storeList); // model에 매장 목록 추가
				mv.addObject("bossInfo", result); // model에 사장 정보 추가

			} else { // 로그인 정보가 불일치할때
				mv.setViewName("store/storeBossLogin"); // 로그인 실패시 다시 로그인 창으로 이동
			}
		} else {
			mv.setViewName("store/storeMain"); // viewname 지정
			bossVO.setbId((String) session.getAttribute("bId"));
			bossVO = storeDAO.selectBossSearch(bossVO);
			List<StoreVO> storeList = storeDAO.selectStoreList(bossVO); // 사장님 아이디에 대한 매장 목록 가져오기
			mv.addObject("storeList", storeList); // model에 매장 목록 추가
			mv.addObject("bossInfo", bossVO); // model에 사장 정보 추가
		}
 		mv.setViewName("store/storeMain");
 		mv.addObject("result",result1);
 		return mv;
 	}
 	//홈 으로 돌아가기
 	@RequestMapping(value="/home.do")
public ModelAndView home(StoreVO vo, HttpSession session) {
 		ModelAndView mv = new ModelAndView();
 		mv.setViewName("common/index");
 		return mv;
 	}
}
