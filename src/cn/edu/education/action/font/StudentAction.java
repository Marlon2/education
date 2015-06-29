package cn.edu.education.action.font;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.service.BanjiService;
import cn.edu.education.service.CartService;
import cn.edu.education.service.OrderdService;
import cn.edu.education.service.StudentService;
import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Cart;
import cn.edu.education.domain.Orderd;
import cn.edu.education.domain.Student;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Controller("studentAction")
@Scope("prototype")
public class StudentAction extends ActionSupport{

	@Resource(name="studentService")
	private StudentService studentService;
	@Resource(name="cartService")
	private CartService cartService;
	@Resource(name="banjiService")
	private BanjiService banjiService;
	@Resource(name="orderdService")
	private OrderdService orderdService;
	
	private Student student_admin,entity;
	private String username;
	private String password;
	private String login_msg;
	private Student sessions;
	
	private List<Banji> cart_banji= new ArrayList<Banji>();
	private List<Cart> carts = new ArrayList<Cart>();
	public String login(){
		//System.out.println("username="+username+",password="+password);
		student_admin = studentService.getStudentByTel(username);
		if(student_admin==null){
			login_msg = "用户名不存在！";
		}else {
			if(!student_admin.getPassword().equals(password)){
				login_msg="密码错误！";
				return INPUT;
			}
			ActionContext.getContext().getSession().put("student_admin", student_admin);
			//初始化购物车。
			carts = this.cartService.getCartsBySid(student_admin.getSid());
			
			for (Cart cart : carts) {
				Banji banji1 = new Banji();
				BeanUtils.copyProperties(this.banjiService.getBanjiById(cart.getCid()), banji1);
				cart_banji.add(banji1);
			}
			if(cart_banji==null){
				System.out.println("cart id empoty");
				cart_banji = new ArrayList<Banji>();
			}
			if(carts==null){
				carts = new ArrayList<Cart>();
			}
			
			ActionContext.getContext().getSession().put("cart_banji", cart_banji);
			ActionContext.getContext().getSession().put("carts", carts);
			
			return "login";
		}
		return INPUT;
	}
	
	//订单的所有ids
	private String bids;
	private double price;
	private List<Banji> banjis = new ArrayList<Banji>();
	public String confirmorder(){
		String[] ids = bids.split(",");
		price = 0;
		for(int i=0;i<ids.length;i++){
			Banji banji1 = new Banji();
			BeanUtils.copyProperties(this.banjiService.getBanjiById(Long.parseLong(ids[i])),banji1);
			price +=banji1.getPrice();
			banjis.add(banji1);
		}
		return "order";
	}
	private String o_address;
	private String oids;
	public String saveOrder(){
		System.out.println("o_address:"+o_address);
		Student student_admin = (Student) ActionContext.getContext().getSession().get("student_admin");
		if(student_admin==null){
			return INPUT;
		}
		String[] ids = bids.split(",");
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<ids.length;i++){
			Orderd orderd1 = new Orderd();
			orderd1.setSid(student_admin.getSid());
			Banji ban = new Banji();
			ban = this.banjiService.getBanjiById(Long.parseLong(ids[i]));
			orderd1.setBanji(ban);
			orderd1.setO_price(ban.getPrice());
			orderd1.setO_time(new Date());
			orderd1.setO_address(o_address);
			orderd1.setIspay(0);
			this.orderdService.saveOrderd(orderd1);
			sb.append(this.orderdService.getIdByOrderd(orderd1)+",");
		}
		oids = sb.substring(0, sb.length()-1).toString();
		//oid = this.orderdService.getIdByOrderd(orderd1);
		//删除购物车里面的订单物品
		price = 0;
		for(int i=0;i<ids.length;i++){
			Banji banji1 = new Banji();
			BeanUtils.copyProperties(this.banjiService.getBanjiById(Long.parseLong(ids[i])),banji1);
			price +=banji1.getPrice();
			banjis.add(banji1);
			this.cartService.deleteCartBySidAndCid(student_admin.getSid(),Long.parseLong(ids[i]));
		}
		//初始化购物车。
		carts = this.cartService.getCartsBySid(student_admin.getSid());
		
		for (Cart cart : carts) {
			Banji banji1 = new Banji();
			BeanUtils.copyProperties(this.banjiService.getBanjiById(cart.getCid()), banji1);
			cart_banji.add(banji1);
		}
		if(cart_banji==null){
			System.out.println("cart id empoty");
			cart_banji = new ArrayList<Banji>();
		}
		if(carts==null){
			carts = new ArrayList<Cart>();
		}
		
		ActionContext.getContext().getSession().put("cart_banji", cart_banji);
		ActionContext.getContext().getSession().put("carts", carts);
		return "payUI";
	}
	private String pwd;
	private String message;
	public  String pay(){
		Student student_admin = (Student) ActionContext.getContext().getSession().get("student_admin");
		if(student_admin==null){
			return INPUT;
		}
		if(!pwd.equals(student_admin.getPassword())){
			message = "密码错误，请重新输入。";
			return "payUI";
		}
		String[] ids = oids.split(",");
		for(int i=0;i<ids.length;i++){
			Orderd ord = this.orderdService.getOrderdById(Long.parseLong(ids[i]));
			ord.setIspay(1);
			this.orderdService.updateOrderd(ord);
		}
		message = "支付成功，请去我的订单查看。";
		return "pay";
	}
	
	public String orderUI(){
		return "orderUI";
	}
	
	public String logout(){
		ActionContext.getContext().getSession().clear();
		return "login";
	}
	/**
	 * 获取学生的信息，修改
	 * @return
	 * @throws Exception
	 */
	public String detail() throws Exception{
		sessions = (Student) ActionContext.getContext()
				.getSession().get("student_admin");
		if(sessions ==null){
			return "login";
		}
		//String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(sessions.getBirthday());
		//System.out.println(time);
		return "detail";
	}
	/**
	 * 保存用户的新密码，并放到session
	 * @return
	 * @throws Exception
	 */
	public String savePWD() throws Exception{
		Student student = studentService.getStudentById(entity.getSid());
		student.setPassword(entity.getPassword());
		studentService.updateStudent(student);
		ActionContext.getContext().getSession().put("student_admin", student);
		return "update";
	}
	public String cart() throws Exception{
		Student studentSession = (Student) ActionContext.getContext()
				.getSession().get("student_admin");
		carts = (List<Cart>) ActionContext.getContext()
				.getSession().get("carts");
		if(studentSession ==null){
			return "login";
		}
		
		ActionContext.getContext().put("carts", carts);
		return "cart";
	}
	/**
	 * 转到修改密码的页面
	 * @return
	 * @throws Exception
	 */
	public String saveUI() throws Exception {
		sessions = (Student) ActionContext.getContext().getSession()
				.get("student_admin");
		if (sessions == null) {
			return "login";
		}
		return "saveUI";
	}
	
	/**
	 * 更新学生的个人信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		// System.out.println(entity.getTid());
		// System.out.println(entity.getName());
		System.out.println(entity.getSid());
		Student student = studentService.getStudentById(entity.getSid());
		student.setName(entity.getName());
		student.setSex(entity.getSex());
		student.setBirthday(entity.getBirthday());
		student.setMobilenumber(entity.getMobilenumber());
		student.setEmail(entity.getEmail());
		// BeanUtils.copyProperties(entity, t1);
		studentService.updateStudent(student);
		ActionContext.getContext().getSession().put("student_admin", student);
		return "update";
	}
	public Student getStudent_admin() {
		return student_admin;
	}
	public void setStudent_admin(Student student_admin) {
		this.student_admin = student_admin;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLogin_msg() {
		return login_msg;
	}
	public void setLogin_msg(String login_msg) {
		this.login_msg = login_msg;
	}
	public List<Banji> getCart_banji() {
		return cart_banji;
	}
	public void setCart_banji(List<Banji> cart_banji) {
		this.cart_banji = cart_banji;
	}
	public List<Cart> getCarts() {
		return carts;
	}
	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}
	public String getBids() {
		return bids;
	}
	public void setBids(String bids) {
		this.bids = bids;
	}

	public List<Banji> getBanjis() {
		return banjis;
	}

	public void setBanjis(List<Banji> banjis) {
		this.banjis = banjis;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getO_address() {
		return o_address;
	}

	public void setO_address(String o_address) {
		this.o_address = o_address;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getOids() {
		return oids;
	}

	public void setOids(String oids) {
		this.oids = oids;
	}

	public Student getEntity() {
		return entity;
	}

	public void setEntity(Student entity) {
		this.entity = entity;
	}

	public Student getSessions() {
		return sessions;
	}

	public void setSessions(Student sessions) {
		this.sessions = sessions;
	}


}
