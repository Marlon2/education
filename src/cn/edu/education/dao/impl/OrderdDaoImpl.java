package cn.edu.education.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.OrderdDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Orderd;

@Repository("orderdDao")
public class OrderdDaoImpl  extends BaseDaoImpl<Orderd> implements OrderdDao<Orderd>{

	@Override
	public List<Orderd> getOrderBySid(Long sid) {
		return this.hibernateTemplate.find("from Orderd where sid=?",sid);
	}

	@Override
	public Long getIdByOrderd(Orderd orderd1) {
		List<Orderd> lists = this.hibernateTemplate.find("from Orderd where sid=? and banji =? order by id desc",orderd1.getSid(),orderd1.getBanji());
		if(lists.size()>0){
			return lists.get(0).getId();
		}else{
			return -1L;
		}
	}

	@Override
	public List<Orderd> queryByPage(int offset, int rows, Orderd ord) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Orderd.class);
		if(ord.getSid()>=0){
			criteria.add(Restrictions.eq("sid", ord.getSid()));
		}
		if(ord.getIspay()>=0){
			criteria.add(Restrictions.eq("ispay", ord.getIspay()));
		}
		return this.hibernateTemplate.findByCriteria(criteria, offset, rows);
	}

}
