package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Cart;

public interface CartService {

	public Cart getCartById(Serializable id);
	public Collection<Cart> getAllCart();
	public void saveCart(Cart cart);
	public void updateCart(Cart cart);
	public void deleteCart(Serializable id);
	
	
	public List<Cart> getCartsBySid(Long sid);
	public void saveCarts(List<Cart> carts);
	public void deleteCartBySidAndCid(Long sid, Long cid);
}
