package cn.edu.education.dao;

import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Cart;

public interface CartDao<T> extends BaseDao<T>{

	public List<Cart> getCartsBySid(Long sid);

	public void saveCarts(List<Cart> carts);

	public void deleteCartBySidAndCid(Long sid, Long cid);

}
