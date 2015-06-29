package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Orderd;
import cn.edu.education.util.PageBean;

public interface OrderdService {
	
	public Orderd getOrderdById(Serializable id);
	public Collection<Orderd> getAllOrderd();
	public void saveOrderd(Orderd orderd);
	public void updateOrderd(Orderd orderd);
	public void deleteOrderd(Serializable id);
	
	public List<Orderd> getOrderBySid(Long sid);
	public Long getIdByOrderd(Orderd orderd1);
	public PageBean<Orderd> getPageBean(int i, int page, Long sid);
	public JSONObject getResult(int rows, int page, Orderd ord);
}
