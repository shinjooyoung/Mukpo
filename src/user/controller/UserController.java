package user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import pos.domain.CongestionSetVO;
import store.domain.MenuVO;
import store.domain.StoreVO;
import store.domain.TableSetVO;
import user.dao.UserDAO;
import user.domain.FavoriteVO;
import user.domain.PointVO;
import user.domain.ReviewVO;
import user.domain.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/login.do")
	public ModelAndView login(UserVO userVO,Model model, HttpSession session) {
		String message = "fail.";
		int result=0;
	
		UserVO dbvo = userDAO.selectMemberLogin(userVO);
		
		ModelAndView mv = new ModelAndView();
		if(dbvo !=null) {
			message="success";
			result=1;
			session.setAttribute("sessionTime", (new Date().toString()));
			session.setAttribute("userName", dbvo.getmId());

			mv.setViewName("common/home");					
		} else {
			mv.setViewName("user/userLogin");
		}
		mv.addObject("result", result); 
		mv.addObject("message", message);
		return mv;
		
	}

	@RequestMapping(value="/{url}.do")
	public String url(@PathVariable String url) {
		return "/user/" + url;
	}
	
	// 마이페이지포인트
		@RequestMapping(value = "/userMypagePoint.do")
		public ModelAndView userMypagePoint(HttpSession httpsession, PointVO pointVO) {
			pointVO.setmId((String) httpsession.getAttribute("userName")); // pointVO에 mId값 설정
			List<PointVO> pointVOList = userDAO.selectPoint(pointVO); // 아이디로 검색한 리스트 porintVOList에 저장
			ModelAndView mv = new ModelAndView(); // ModelAndView 생성
			mv.setViewName("user/userMypagePoint"); // 이동할 페이지 지정
			mv.addObject("pointVOList", pointVOList); // pointVOList라는 이름으로 mv에 넣기
			return mv;
		}

		// 마이페이지포인트날짜검색
		@RequestMapping(value = "/userMypagePointDate.do")
		public ModelAndView userMypagePointDate(HttpSession httpsession, PointVO pointVO) {
			pointVO.setmId((String) httpsession.getAttribute("userName")); // pointVO에 mId값 설정
			List<PointVO> pointVOList = userDAO.selectPointDate(pointVO); // 아이디, 날짜로 검색한 리스트 porintVOList에 저장
			ModelAndView mv = new ModelAndView(); // ModelAndView 생성
			mv.setViewName("user/userMypagePoint"); // 이동할 페이지 지정
			mv.addObject("pointVOList", pointVOList); // pointVOList라는 이름으로 mv에 넣기
			return mv;
		}

		// 마이페이지포인트충전
		@RequestMapping(value = "/userMypagePointCharge.do")
		public ModelAndView userMypagePointCharge(HttpSession httpsession, PointVO pointVO, UserVO userVO) {
			ModelAndView mv = new ModelAndView(); // ModelAndView 생성
			mv.setViewName("user/userMypagePointCharge"); // 이동할 페이지 지정
			
			// 회원명 검색
			userVO.setmId((String) httpsession.getAttribute("userName"));
			UserVO userVOName = userDAO.selectMemberName(userVO);
			mv.addObject("userVOName", userVOName);
			
			pointVO.setmId((String) httpsession.getAttribute("userName")); // pointVO에 mId값 설정
			pointVO = userDAO.selectPointCharge(pointVO); // 해당 아이디의 마지막 포인트 검색
			mv.addObject("pointVO", pointVO); // pointVO라는 이름으로 mv에 넣기
			return mv;
		}
		
		// 마이페이지 포인트 충전 insert
		@RequestMapping(value="/userMypagePointChargeOk.do")
		public ModelAndView userMypagePointChargeOk (PointVO pointVO, HttpSession httpsession) {
			// ModelAndView 생성
			ModelAndView mv = new ModelAndView();
			
			String message = "충전실패하였습니다.";
			
			pointVO.setmId((String)httpsession.getAttribute("userName"));
			
			pointVO.setpCruntmoney(pointVO.getpCruntmoney() + pointVO.getpPrice());
			
			int result = userDAO.insertPoint(pointVO);
			if (result > 0) {
				message = "충전완료되었습니다.";
			}
			
			mv.setViewName("user/userMypagePointChargeOk");
			mv.addObject("result", result);
			mv.addObject("message", message);
			
			return mv;
		}
		
		// 주간예약 매장 검색
		   @RequestMapping(value= "/ReservWeeklySearch.do", produces="text/json;charset=UTF-8")
		   @ResponseBody
		   public void reviewInsert( Model model, HttpServletResponse response, HttpServletRequest request, StoreVO storeVO){
			   String s = request.getParameter("search");
			   
			   List<StoreVO> storeVOList = userDAO.getAddrList(storeVO); //데이터 가져오기
			   
			   List<JSONObject> rList = new ArrayList<>(); //제이슨 오브젝트 리스트 생성
			  
			   JSONArray ja = new JSONArray(); //제이슨Array생성
			   
			for(int i=0; i<storeVOList.size(); i++) { //가져온 데이터값 돌리기
				try {
					JSONObject obj = new JSONObject();
					obj.put("sName", storeVOList.get(i).getsName());
					obj.put("sUrl", storeVOList.get(i).getsUrl());
					obj.put("sRcid", storeVOList.get(i).getrCid());
					obj.put("sAddress", storeVOList.get(i).getsAddress());
					if(storeVOList.get(i).getsAddress().length()>30) {
						storeVOList.get(i).setsAddress(storeVOList.get(i).getsAddress().substring(0, 30)+"...");
					}
					obj.put("sAddressSubstring", storeVOList.get(i).getsAddress());
					obj.put("sTel", storeVOList.get(i).getsTel());
					obj.put("sClose", storeVOList.get(i).getsClose());
					
					ja.put(obj);//리스트에 넣기
				} catch (JSONException e) {
					e.printStackTrace();
				} //제이슨obj에 가져온 값 넣기
			}
		
			try {
				response.getWriter().print(ja.toString()); //JSONArray값 String형식으로 보내기
			} catch (IOException e) {
				e.printStackTrace();
			}
		   }
		   
		 //마이페이지 - 주간예약 - 상점클릭시 모달창 메뉴출력
			@RequestMapping(value= "/reservWeeklyMenu.do", produces="text/json;charset=UTF-8")
			@ResponseBody
			public void storeMdetail(HttpServletResponse response, Model model, MenuVO menuVO, CongestionSetVO congestionSetVO, TableSetVO tableSetVO,
					StoreVO storeVO, FavoriteVO favoriteVO, HttpSession httpsession,HttpServletRequest request) throws JSONException, IOException {
				
			    //List<StoreVO> selectStoreCid = userDAO.selectStoreCid(storeVO); //사업자번호 데이터 가져오기
				
				
				List<MenuVO> menuVOList = userDAO.selectMenuList(menuVO); // 매장의 메뉴를 출력하는 기능 구현

				JSONArray ja = new JSONArray();
				
				for(int i = 0; i < menuVOList.size(); i++) {
					JSONObject obj = new JSONObject();
					obj.put("mId", menuVOList.get(i).getmId());
					obj.put("mCate", menuVOList.get(i).getmCate());
					obj.put("mFullName", menuVOList.get(i).getmName());
					if(menuVOList.get(i).getmName().length()>5) {
						menuVOList.get(i).setmName(menuVOList.get(i).getmName().substring(0, 5)+"...");	// 메뉴 이름이 긴 메뉴는 자르기
					}
					obj.put("mName", menuVOList.get(i).getmName());
					obj.put("mDetail", menuVOList.get(i).getmDetail());
					obj.put("mUrl", menuVOList.get(i).getmUrl());
					obj.put("mPrice", menuVOList.get(i).getmPrice());
					
					ja.put(obj);
				}
				
				response.getWriter().print(ja.toString());
			}
		   
			//마에페이지 - 예약내역 - 리뷰 남기기 버튼 클릭시
			@RequestMapping("/reviewInsert.do")
			public  String reviewInsert2(ReviewVO vo){
				String msg="등록에 실패했습니다.";
				int result = userDAO.insertReview(vo);
				return "redirect:/reserve/userMypageReservList.do";
			}
		
			
			// Main - 회원가입 
			@RequestMapping("/insertMemberJoin.do")
			public ModelAndView insertMemberJoin(UserVO vo) {
				ModelAndView mv = new ModelAndView();
		
				int result = userDAO.insertMemberJoin(vo);
				if(result>0) {
				
					result=2;
				}
				mv.setViewName("common/home");
				mv.addObject("result", result);
		
				return mv;
			}
			
			// 1202 아름 회원정보 수정 전 비밀번호 확인
			@RequestMapping(value = "/userMypageInfoModify.do")
			public ModelAndView userMypageInfoModify(UserVO userVO, HttpSession httpSession) {
				userVO.setmId((String) httpSession.getAttribute("userName"));
				UserVO userInfo = userDAO.selectMemberModifyCheck(userVO);
				ModelAndView mv = new ModelAndView();
				if (userInfo == null) {
					mv.setViewName("user/userMypageInfoModifyMain");
				} else {
					mv.setViewName("user/userMypageInfoModify");
					mv.addObject("userInfo", userInfo);
				}
				return mv;
			}

			// 회원정보 수정 
			@RequestMapping(value = "/userMypageInfoModifyOk.do")
			public ModelAndView userMypageInfoModifyOk(UserVO userVO) {
				int result = userDAO.updateMemberModify(userVO);
				ModelAndView mv = new ModelAndView();
				if (result > 0) {
					mv.addObject("message", "회원정보수정완료");
				} else {
					mv.addObject("message", "회원정보수정실패");
				}
				mv.addObject("userInfo", userVO);
				mv.addObject("result", result);
				mv.setViewName("user/userMypageInfoModifyOK");
				return mv;
			}

			//  회원탈퇴
			@RequestMapping(value = "/userMypageMemberout.do")
			public ModelAndView userMypageMemberout(UserVO userVO, HttpSession httpsession) {
				userVO.setmId((String) httpsession.getAttribute("userName"));
				int result = userDAO.updateMemberDelete(userVO);
				ModelAndView mv = new ModelAndView();
				if (result > 0) {
					mv.addObject("message", "회원탈퇴완료");
					httpsession.removeAttribute("userName");
				} else {
					mv.addObject("message", "회원탈퇴실패");
				}
				mv.addObject("result", result);
				mv.setViewName("user/userMypageMemberout");
				return mv;
			}

			// 비밀번호 변경
			@RequestMapping(value = "/userMypageInfoPWModify.do")
			public ModelAndView userMypageInfoPWModify(UserVO userVO, HttpSession httpsession) {
				userVO.setmId((String) httpsession.getAttribute("userName"));
				int result = userDAO.updateMemberModify(userVO);
				ModelAndView mv = new ModelAndView();
				if (result > 0) {
					mv.addObject("message", "비밀번호수정완료");
				} else {
					mv.addObject("message", "비밀번호수정실패");
				}
				mv.addObject("result", result);
				mv.setViewName("user/userMypageInfoModifyPWOK");

				return mv;
			}

			//  즐겨찾기 기능 ajax 처리
			@RequestMapping(value="/userFavoriteStore.do")
			@ResponseBody
			public String userFavoriteStore(FavoriteVO favoriteVO, HttpServletRequest request ) throws UnsupportedEncodingException {
				String src = request.getParameter("src");
				favoriteVO.setfId(favoriteVO.getrCid() + "_" + favoriteVO.getmId());
				String resultFavorite = "즐겨찾기X";
				if (src.equals("/images/store/likeX.png")) {
					int result = userDAO.insertFavorite(favoriteVO);
					resultFavorite = "즐겨찾기O";			
				} else if (src.equals("/images/store/likeO.png")) {
					int result = userDAO.deleteFavorite(favoriteVO);
					resultFavorite = "즐겨찾기X";
				} 
				resultFavorite = URLEncoder.encode(resultFavorite, "UTF-8");
				return resultFavorite;
			}
			
			//  즐겨찾기 매장
			@RequestMapping(value="userMypageFavoriteList.do")
			public ModelAndView userMypageFavoriteList(HttpSession httpSession, FavoriteVO favoriteVO) {
				ModelAndView mv = new ModelAndView();
				
				favoriteVO.setmId((String)httpSession.getAttribute("userName"));
				List<HashMap> favoriteVOList = userDAO.selectFS(favoriteVO);
				
				mv.setViewName("user/userMypageFavoriteList");
				mv.addObject("favoriteVOList", favoriteVOList);
				
				return mv;
			}
			
			// 사용자 회원가입
						@RequestMapping(value="userRegister.do")
						public ModelAndView userRegister(UserVO userVO) {
							ModelAndView mv = new ModelAndView();
							
							int result = userDAO.insertMemberJoin(userVO);
							
							mv.setViewName("user/userLogin");
							mv.addObject("result",result);
							return mv; 
						}
}
