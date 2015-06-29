package cn.edu.education.action.bg;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Orderd;
import cn.edu.education.service.BanjiService;
import cn.edu.education.service.OrderdService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("bgOrderdAction")
@Scope("prototype")
public class BgOrderdAction extends BaseAction<Orderd> implements ServletRequestAware{
	
	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String orderdId; 
	private String delIds;// 批量删除数据的序列号
	// 查询条件的变量
	private Long o_sid = -1L;
	private int o_ispay = -1;
	
	@Resource(name="orderdService")
	private OrderdService orderdService;
	@Resource(name="banjiService")
	private BanjiService banjiService;
	
	public String allOrderds(){
		Orderd ord = new Orderd();
		ord.setIspay(o_ispay);
		if(o_sid==null){
			ord.setSid(-1L);
		}else{
			ord.setSid(o_sid);
		}
		
		JSONObject result = this.orderdService.getResult( rows,page,ord);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	private Long bid;
	public String add(){
		Orderd ord = new Orderd();
		BeanUtils.copyProperties(this.getModel(), ord);
		Banji ban = this.banjiService.getBanjiById(bid);
		ord.setBanji(ban);
		ord.setO_price(ban.getPrice());
		ord.setO_time(new Date());
		this.orderdService.saveOrderd(ord);
		return action2action;
	}
	public String update(){
		Orderd ord = new Orderd();
		BeanUtils.copyProperties(this.getModel(), ord);
		Banji ban = this.banjiService.getBanjiById(bid);
		ord.setBanji(ban);
		ord.setO_price(ban.getPrice());
		ord.setO_time(new Date());
		if(StringUtil.isNotEmpty(orderdId)){
			ord.setId(Long.parseLong(orderdId));
		}
		this.orderdService.updateOrderd(ord);
		return action2action;
	}
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.orderdService.deleteOrderd(Long.parseLong(ids[i]));
			}
			result.put("success", "true");
			result.put("delNums", ids.length);
		} catch (Exception e) {
			result.put("errorMsg", "删除失败");
			e.printStackTrace();
		}
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String listUI(){
		return "listUI";
	}
	
	HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getOrderdId() {
		return orderdId;
	}
	public void setOrderdId(String orderdId) {
		this.orderdId = orderdId;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public Long getO_sid() {
		return o_sid;
	}

	public void setO_sid(Long o_sid) {
		this.o_sid = o_sid;
	}

	public int getO_ispay() {
		return o_ispay;
	}

	public void setO_ispay(int o_ispay) {
		this.o_ispay = o_ispay;
	}

	public Long getBid() {
		return bid;
	}

	public void setBid(Long bid) {
		this.bid = bid;
	}
	

}
