package pos.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pos.dao.PosDAO;
import pos.domain.CongestionSetVO;
import pos.domain.OrderListVO;
import reserve.domain.ReserveVO;
import store.dao.StoreDAO;
import store.domain.MenuVO;
import store.domain.TableSetVO;

@Controller
@RequestMapping("/pos")
public class PosController {

	@Autowired
	private PosDAO posDAO;
	@Autowired
	private StoreDAO storeDAO;

	// 화면띄우기
	@RequestMapping(value = "/{url}.do")
	public String url(@PathVariable String url) {

		System.out.println(url);
		return "/pos/" + url;
	}
	
	// storeMain -> posMain
	@RequestMapping(value = "/posMain.do")
	public ModelAndView posMain(String rCid) {
		ModelAndView mv = new ModelAndView();
		MenuVO mvo = new MenuVO();
		mvo.setrCid(rCid);
		//메뉴 리스트 가져오기
		List<MenuVO> menuList = posDAO.selectMenuList(rCid);
		//주문내역 가져오기
		List<OrderListVO> orderList = posDAO.selectOrderList(rCid);
		//테이블 정보가져오기
		TableSetVO tableSet = posDAO.selectTableSet(rCid);
		//카테고리 종류 가져오기
		List<MenuVO> cateList = storeDAO.selectCateList(mvo);
		
		
		//혼잡도설정 가져오기 시작
		CongestionSetVO gCon = new CongestionSetVO();
		CongestionSetVO yCon = new CongestionSetVO();
		CongestionSetVO rCon = new CongestionSetVO();
		
		gCon.setCsCongestion("G");
		gCon.setrCid(rCid);
		yCon.setCsCongestion("Y");
		yCon.setrCid(rCid);
		rCon.setCsCongestion("R");
		rCon.setrCid(rCid);
		
		gCon = posDAO.selectCongestionset(gCon);
		yCon = posDAO.selectCongestionset(yCon);
		rCon = posDAO.selectCongestionset(rCon);
		//혼잡도설정 가져오기 끄읏		
		
		//예약 내역 리스트 가져오기
		List<ReserveVO> reserveList = posDAO.selectReserveList(rCid);
		
		mv.addObject("cateList",cateList);
		mv.addObject("menuList", menuList);
		mv.addObject("orderList", orderList);
		mv.addObject("tableSet", tableSet);
		mv.addObject("gCon", gCon);
		mv.addObject("yCon", yCon);
		mv.addObject("rCon", rCon);
		mv.addObject("reserveList", reserveList);
		
		mv.setViewName("pos/posMain");
		
		return mv;
	}
	
	//주문하기
		@RequestMapping(value="/posOrder.do")
		public ModelAndView posOrder(String tableNum, MenuVO menuVO) {
			List<MenuVO> menuVOCate = storeDAO.selectMenuCate(menuVO); // 매장의 메뉴 카테고리 가져오는 기능 구현
			List<MenuVO> menuVOList = storeDAO.selectMenuList(menuVO); // 매장의 메뉴를 출력하는 기능 구현
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("pos/posOrder");
			mv.addObject("tableNum", tableNum);
			mv.addObject("menuVOCate", menuVOCate);
			mv.addObject("menuVOList", menuVOList);
			
			return mv;
		}
		
		  @RequestMapping(value="/insertOrderList.do", produces="text/json;charset=UTF-8")
	      @ResponseBody
	      public  String storeTableInsert(OrderListVO orderlistvo) {
			  
	    	  int result = posDAO.insertOrderList(orderlistvo);
	    	  
	    	  return ""+result;
	      }

}
