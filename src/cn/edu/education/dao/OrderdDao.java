package cn.edu.education.dao;

import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Orderd;

public interface OrderdDao<T> extends BaseDao<T>{

	public List<Orderd> getOrderBySid(Long sid);

	public Long getIdByOrderd(Orderd orderd1);

	public List<Orderd> queryByPage(int offset, int rows, Orderd ord);

}
