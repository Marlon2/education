package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.OrderdDao;
import cn.edu.education.domain.Orderd;
import cn.edu.education.service.OrderdService;
import cn.edu.education.util.PageBean;

@Service("orderdService")
public class OrderServiceImpl implements OrderdService{

	@Resource(name="orderdDao")
	private OrderdDao orderdDao;
	@Override
	public List<Orderd> getOrderBySid(Long sid) {
		return this.orderdDao.getOrderBySid(sid);
	}
	@Override
	public Orderd getOrderdById(Serializable id) {
		return (Orderd) this.orderdDao.getEntityById(id);
	}
	@Override
	public Collection<Orderd> getAllOrderd() {
		return this.orderdDao.getAllEntity();
	}
	@Override
	public void saveOrderd(Orderd orderd) {
		this.orderdDao.saveEntity(orderd);
	}
	@Override
	public void updateOrderd(Orderd orderd) {
		this.orderdDao.updateEntity(orderd);
	}
	@Override
	public void deleteOrderd(Serializable id) {
		this.orderdDao.deleteEntity(id);
	}
	@Override
	public Long getIdByOrderd(Orderd orderd1) {
		return this.orderdDao.getIdByOrderd(orderd1);
	}
	@Override
	public PageBean<Orderd> getPageBean(int pageSize, int page, Long sid) {
		PageBean<Orderd> pageBean = new PageBean<Orderd>();
		
		List<Orderd> orderds = this.orderdDao.getOrderBySid(sid);
		int allRows = orderds .size();
		System.out.println("总记录数:"+allRows);
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        System.out.println("总页数:"+totalPage);
        int currentPage = pageBean.getCurPage(page);
        System.out.println("当前页:"+currentPage);
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        System.out.println("offset:"+offset);
        List<Orderd> list = new ArrayList<Orderd>();
        if(allRows<(offset+pageSize)){
        	list = orderds.subList(offset, allRows);
        }else{
        	list = orderds.subList(offset, (offset+pageSize));
        }
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        
        return pageBean;
	}
	@Override
	public JSONObject getResult(int rows, int page, Orderd ord) {
		int offset = rows * (page -1);
		List<Orderd> list = this.orderdDao.queryByPage(offset, rows,ord);
		int total = list.size();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (Orderd orderd : list) {
			sb.append("{").append("id:"+orderd.getId()+",")
			.append("sid:"+orderd.getSid()+",")
			.append("bid:"+orderd.getBanji().getBid()+",")
			.append("name:'"+orderd.getBanji().getClassname()+"',")
			.append("price:"+orderd.getO_price()+",")
			.append("ispay:"+orderd.getIspay()+"},");
		}
		String str = sb.substring(0, sb.length()-1)+"]";
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(str);
		result.put("rows", jsonArray);
		result.put("total", total);
		//System.out.println("listsize"+list.size()+"-"+total);
		return result;
	}

}
