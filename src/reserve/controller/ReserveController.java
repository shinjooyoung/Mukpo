package reserve.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pos.domain.PaymentVO;
import reserve.dao.ReserveDAO;
import reserve.domain.ReserveMenuVO;
import reserve.domain.ReserveVO;
import store.domain.MenuVO;
import user.domain.UserVO;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	private ReserveDAO reserveDAO;

	// 화면띄우기
	@RequestMapping(value = "/{url}.do")
	public String url(@PathVariable String url) {
		return "/reserve/" + url;
	}

	// 로그인 후 마이페이지 접속할때, 마이페이지에서 예약 내역 클릭했을때
	@RequestMapping("/userMypageReservList.do")
	public ModelAndView userInsert(ReserveVO vo, HttpSession httpSession) {
		vo.setmId((String) httpSession.getAttribute("userName"));

		// 예약 내역 db select
		List<HashMap> voList = reserveDAO.reserveList(vo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userMypageReservList");
		mv.addObject("voList", voList);

		return mv;
	}

	//예약화면 (테이블번호 가져가기)
	@RequestMapping(value = "/reserveM.do")
	public ModelAndView reserveM(UserVO userVO, ReserveVO vo, HttpSession httpSession) {
		userVO.setmId((String)httpSession.getAttribute("userName"));
		vo.setmId((String)httpSession.getAttribute("userName"));   //사용자 값 들어옴
		List<UserVO> reserveTable = reserveDAO.reserveTable(userVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveM");
		mv.addObject("reserveInfo", vo);
		mv.addObject("reserveUserInfo", reserveTable);
		
		return mv;
	}

	// 예약정보저장
	@RequestMapping(value = "reserveMPayment.do")
	public ModelAndView reserveMPayment(ReserveVO vo, String rTel, String rName, String rMemo) {
		List<MenuVO> payMenuList = reserveDAO.reserveMenuList(vo);	// 1201 아름 메뉴정보 가져오기
		ModelAndView mv = new ModelAndView();
		int deposit = vo.getrPnum()*5000; //예치금 계산
	
		mv.setViewName("reserve/reserveMPayment");
		mv.addObject("reserveInfo", vo);
		mv.addObject("payMenuList", payMenuList);
		mv.addObject("rTel", rTel);
		mv.addObject("rName", rName);
		mv.addObject("rMemo", rMemo);
		mv.addObject("rPnum", deposit);
		return mv;
	}
	
	//포장 결제하기 
	@RequestMapping(value ="/reservePaymentOk.do")
	public ModelAndView userRegister(Integer[] mId, Integer[] rmCnt, PaymentVO vo,ReserveVO rvo,HttpServletRequest request, HttpSession httpSession) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);   // 주문시간으로 주문번호만들기
		SimpleDateFormat rDate = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);   // 예약날짜구하기
		Date date = new Date();
			rvo.setrId(df.format(date));	// 예약ID 현재 날짜로 가져오기
			rvo.setmId((String)httpSession.getAttribute("userName"));	// 세션에 저장된 회원ID SET
			rvo.setrMpwp("P");	// 포장예약 SET
			rvo.setrDate(rDate.format(date));	// 현재날짜 SET
			rvo.setrPnum(0);	// 인원수 SET
			rvo.setrTnum(0);	// 테이블번호 SET
			rvo.setrYn("RW");	// 예약대기상태 SET
		ReserveVO reservePaymentOk = reserveDAO.reservePaymentOk(rvo); // 예약테이블 insert
		
		
		ReserveMenuVO reserveMenuVO = new ReserveMenuVO();
		for(int i=0; i<mId.length; i++) {	// 배열로 들어온 메뉴ID, 수량 for문으로 하나씩 insert
			reserveMenuVO.setrId(rvo.getrId());	// 예약테이블의 예약ID로 SET (현재날짜)
			reserveMenuVO.setmId(mId[i]);		// 메뉴ID SET
			reserveMenuVO.setRmid(reserveMenuVO.getrId()+"_"+reserveMenuVO.getmId()); // 예약ID_메뉴ID 형식
			reserveMenuVO.setRmCnt(rmCnt[i]);	// 수량 SET
			int result = reserveDAO.reserveMenuInsert(reserveMenuVO);	// 예약메뉴테이블 insert
		}
		
		// 결제테이블 정보 SET 
		vo.setoNum(rvo.getrId()); // 예약테이블의 예약ID로 SET (현재날짜)
		vo.setmId((String)httpSession.getAttribute("userName"));	// 세션에 저장된 회원ID SET
		vo.setsId(rvo.getrCid()); 	// 예약테이블에서 사업자등록번호 가져오기
		vo.setsName(rvo.getsName()); 	// 예약테이블에서 업소명 가져오기
		vo.setpState("PO");
		int result2 = reserveDAO.reservePayment(vo);	// 결제테이블 insert
		
		ModelAndView mv = new ModelAndView();
	
		
		mv.setViewName("reserve/reservePaymentOk");
		//mv.addObject("result",result);
		return mv; 
		}
		
	@RequestMapping(value = "/reserveMPaymentOk.do")
	public ModelAndView reserveMPaymentOk(Integer[] mId, Integer[] rmCnt, ReserveVO vo, HttpSession httpSession, String radio) {
		// reservelist insert
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);   // 주문시간으로 주문번호만들기
	    Date date = new Date();
		vo.setrId(df.format(date));	// 예약ID 현재 날짜로 가져오기
		vo.setmId((String)httpSession.getAttribute("userName"));	// 세션에 저장된 사용자 ID SET
		ReserveVO selectsName = reserveDAO.selectreserveInfo(vo);	// 사업자등록번호로 업소명 검색
		vo.setsName(selectsName.getsName());
		vo.setrMpwp("M");
		vo.setrYn("RW");	// 예약대기
		ReserveVO reservePaymentOk = reserveDAO.reservePaymentOk(vo);
		
		ReserveMenuVO reserveMenuVO = new ReserveMenuVO();
		// reservemenu insert
		for(int i=0; i<mId.length; i++) {
			reserveMenuVO.setrId(vo.getrId());
			reserveMenuVO.setmId(mId[i]);
			reserveMenuVO.setRmid(reserveMenuVO.getrId()+"_"+reserveMenuVO.getmId());
			reserveMenuVO.setRmCnt(rmCnt[i]);
			int result = reserveDAO.reserveMenuInsert(reserveMenuVO);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("reserve/reservePaymentOk");
		mv.addObject("reserveInfo", vo);
		
		return mv;
	}
	
	//POS기에서 예약 상세내역 보기
	@RequestMapping(value="/reserveDetail.do")
	@ResponseBody
	public void storeReserve(HttpServletResponse response, Model model, String rId) throws Exception {
		List<HashMap> reserveDetail =  reserveDAO.selectReserveDetail(rId);	// 예약상세내역 HashMap으로 받기
		
		JSONArray jsonArray = new JSONArray();
		
		for(int i=0; i<reserveDetail.size(); i++) {
			jsonArray.put(reserveDetail.get(i));
		}
		
		String json = jsonArray.toString();
		
		response.getWriter().print(json);

	}
	
	//POS기에서 예약 내역 보기
		@RequestMapping(value="/reserveListView.do")
		@ResponseBody
		public void reserveListView(HttpServletResponse response, Model model, String rId) throws Exception {
			ReserveVO reserveListView =  reserveDAO.selectReserveListView(rId);	// 예약상세내역 HashMap으로 받기

			
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			
			jsonObject.put("rId", reserveListView.getrId());
			jsonObject.put("rDate", reserveListView.getrDate());
			jsonObject.put("rTime", reserveListView.getrTime());
			jsonObject.put("rPnum", reserveListView.getrPnum());
			jsonObject.put("rKeepmoney", reserveListView.getrKeepmoney());
			jsonObject.put("rTnum", reserveListView.getrTnum());
			
			jsonArray.put(jsonObject);
			
			response.getWriter().print(jsonArray.toString());

		}

}
