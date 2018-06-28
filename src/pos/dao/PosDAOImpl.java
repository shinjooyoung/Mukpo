package pos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pos.domain.CongestionSetVO;
import pos.domain.OrderListVO;
import pos.domain.PaymentVO;
import reserve.domain.ReserveVO;
import store.domain.MenuVO;
import store.domain.TableSetVO;

@Repository
public class PosDAOImpl implements PosDAO {
	@Autowired
	private SqlSessionTemplate posss;
	
	@Override
	public void insertCongestionset(CongestionSetVO pcVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCongestionset(CongestionSetVO cVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CongestionSetVO selectCongestionset(CongestionSetVO vo) {
		return posss.selectOne("pos.selectCongestionset", vo);
	}

	@Override
	public  int insertOrderList(OrderListVO olVO) {
		return posss.insert("pos.insertOrderList",olVO);
		
	}

	@Override
	public List<OrderListVO> selectOrderList(String rCid) {
		return posss.selectList("pos.selectOrderList", rCid);
	}

	@Override
	public void updateOrderListYN(OrderListVO OrderListVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertPayment(PaymentVO ppVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePstate(PaymentVO ppVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MenuVO> selectMenuList(String rCid) {
		return posss.selectList("pos.selectMenuList", rCid);
	}

	@Override
	public TableSetVO selectTableSet(String rCid) {
		return posss.selectOne("pos.selectTableSet", rCid);
	}

	@Override
	public List<ReserveVO> selectReserveList(String rCid) {
		return posss.selectList("pos.selectReserveList", rCid);
	}
}
