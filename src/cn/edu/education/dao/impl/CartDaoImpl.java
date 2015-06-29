package cn.edu.education.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.edu.education.dao.CartDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Cart;

@Repository("cartDao")
public class CartDaoImpl extends BaseDaoImpl<Cart> implements CartDao<Cart>{

	@Override
	public List<Cart> getCartsBySid(Long sid) {
		return this.hibernateTemplate.find("from Cart where sid=?", sid);
	}

	@Override
	public void saveCarts(List<Cart> carts) {
		this.hibernateTemplate.saveOrUpdateAll(carts);
	}

	@Override
	public void deleteCartBySidAndCid(Long sid, Long cid) {
		List<Cart> lists = this.hibernateTemplate.find("from Cart where sid=? and cid=?",sid,cid);
		this.hibernateTemplate.deleteAll(lists);
	}

}
