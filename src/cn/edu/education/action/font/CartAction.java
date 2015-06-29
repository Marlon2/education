package cn.edu.education.action.font;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Cart;
import cn.edu.education.domain.Student;
import cn.edu.education.service.BanjiService;
import cn.edu.education.service.CartService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("cartAction")
@Scope("prototype")
public class CartAction extends ActionSupport{

	private boolean flag = true;
	private Long bid=-1L;
	private Long sid=-1L;
	@Resource(name="cartService")
	private CartService cartService;
	@Resource(name="banjiService")
	private BanjiService banjiService;
	
	public String init(){
		
		Student student_admin = (Student) ActionContext.getContext().getSession().get("student_admin");
		if(student_admin==null){
			return INPUT;
		}
		sid = student_admin.getSid();
		System.out.println("班级id="+bid+"学生id="+sid);
		
		//获得购物车
		List<Banji> cart_banji = (List<Banji>) ActionContext.getContext().getSession().get("cart_banji");
		List<Cart> carts = (List<Cart>) ActionContext.getContext().getSession().get("carts");

		for (Cart cart1 : carts) {
			if(cart1.getCid().equals(bid)){
				flag = false;
			}
		}
		
		if(flag){
			Banji banji = this.banjiService.getBanjiById(bid);
			if(banji!=null){
				cart_banji.add(banji);
				
				Cart cart = new Cart();
				cart.setCid(bid);
				cart.setSid(sid);
				carts.add(cart);
				
				this.cartService.saveCarts(carts);
			}
		}
		
		ActionContext.getContext().getSession().put("cart_banji", cart_banji);
		ActionContext.getContext().getSession().put("carts", carts);
		return SUCCESS;
	}

	public String cartlist() {

		return "list";
	}
	public Long getBid() {
		return bid;
	}
	public void setBid(Long bid) {
		this.bid = bid;
	}
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	
	public String delete(){
		System.out.println("班级id="+bid+"delete学生id="+sid);
		//判断用户是否登录，如果没有登录直接跳到登录页面
		Student student_admin = (Student) ActionContext.getContext().getSession().get("student_admin");
		if(student_admin==null){
			return INPUT;
		}
		
		//获得购物车
		List<Banji> cart_banji = (List<Banji>) ActionContext.getContext().getSession().get("cart_banji");
		List<Cart> carts = (List<Cart>) ActionContext.getContext().getSession().get("carts");

		//获得要删除的班级
		Banji banji=null;
		for (Banji banji1 : cart_banji) {
			if(banji1.getBid().equals(bid)){
				banji = banji1;
			}
		}
		
		//删除购物车中的班级
		
		Cart cart=null;
		for (Cart cart1 : carts) {
			if(cart1.getCid().equals(bid)){
				cart = cart1;
				flag = false;
			}
		}
		
		if(!flag){
			cart_banji.remove(banji);
			carts.remove(cart);
			this.cartService.deleteCart(cart.getId());
		}
		
		ActionContext.getContext().getSession().put("cart_banji", cart_banji);
		ActionContext.getContext().getSession().put("carts", carts);
		
		return "list";
	}
	public String clear(){
		//判断用户是否登录，如果没有登录直接跳到登录页面
		Student student_admin = (Student) ActionContext.getContext().getSession().get("student_admin");
		if(student_admin==null){
			return INPUT;
		}
				
		//获得购物车
		List<Banji> cart_banji = (List<Banji>) ActionContext.getContext().getSession().get("cart_banji");
		List<Cart> carts = (List<Cart>) ActionContext.getContext().getSession().get("carts");
		cart_banji.clear();
		carts.clear();
		for(Cart cart:carts){
			this.cartService.deleteCart(cart.getId());
		}
		ActionContext.getContext().getSession().put("cart_banji", cart_banji);
		ActionContext.getContext().getSession().put("carts", carts);
		
		return "list";
	}
}
