package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.education.dao.CartDao;
import cn.edu.education.domain.Cart;
import cn.edu.education.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService{

	@Resource(name="cartDao")
	private CartDao cartDao;
	@Override
	public Cart getCartById(Serializable id) {
		return (Cart) this.cartDao.getEntityById(id);
	}

	@Override
	public Collection<Cart> getAllCart() {
		return this.cartDao.getAllEntity();
	}

	@Override
	public void saveCart(Cart cart) {
		this.cartDao.saveEntity(cart);
	}

	@Override
	public void updateCart(Cart cart) {
		this.cartDao.updateEntity(cart);
	}

	@Override
	public void deleteCart(Serializable id) {
		this.cartDao.deleteEntity(id);
	}

	@Override
	public List<Cart> getCartsBySid(Long sid) {
		return this.cartDao.getCartsBySid(sid);
	}

	@Override
	public void saveCarts(List<Cart> carts) {
		this.cartDao.saveCarts(carts);
	}

	@Override
	public void deleteCartBySidAndCid(Long sid, Long cid) {
		this.cartDao.deleteCartBySidAndCid(sid, cid);
	}

}
