package cn.edu.education.action.font;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Orderd;
import cn.edu.education.domain.Student;
import cn.edu.education.service.BanjiService;
import cn.edu.education.service.OrderdService;
import cn.edu.education.util.PageBean;

@Controller("orderdAction")
@Scope("prototype")
public class OrderdAction extends BaseAction<Orderd>{

	private static final long serialVersionUID = 1L;

	@Resource(name="orderdService")
	private OrderdService orderdService;
	@Resource(name="banjiService")
	private BanjiService banjiService;

	//分页
	private int page;
	private PageBean<Orderd> pageBean;
	
	public String orderlist(){
		
		Student student_admin = (Student) ActionContext.getContext().getSession().get("student_admin");
		if(student_admin==null){
			return INPUT;
		}
		pageBean = this.orderdService.getPageBean(3, page, student_admin.getSid());
		System.out.println("");
		return "orderlist";
	}
	
	
	private Long oid;
	private Orderd orderd;
	public String pay(){
		System.out.println(oid+"=id");
		orderd = this.orderdService.getOrderdById(oid);
		return "orderdpay";
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public PageBean<Orderd> getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean<Orderd> pageBean) {
		this.pageBean = pageBean;
	}
	
	public Long getOid() {
		return oid;
	}
	public void setOid(Long oid) {
		this.oid = oid;
	}
	public Orderd getOrderd() {
		return orderd;
	}
	public void setOrderd(Orderd orderd) {
		this.orderd = orderd;
	}
	
	
}
