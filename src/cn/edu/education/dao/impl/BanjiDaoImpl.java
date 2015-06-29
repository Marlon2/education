package cn.edu.education.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.AdaptedImmutableType;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.BanjiDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Banji;
import cn.edu.education.util.StringUtil;

@Repository("banjiDao")
public class BanjiDaoImpl extends BaseDaoImpl<Banji> implements BanjiDao<Banji>{

	@Override
	public List<Banji> queryByPage(int offset, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Banji.class);
		return this.hibernateTemplate.findByCriteria(criteria, offset, pageSize);
	}

	@Override
	public List<Banji> queryByPage(int offset, int pageSize, List<Long> bidlist) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Banji.class);
		criteria.add(Restrictions.in("id", bidlist));
		return this.hibernateTemplate.findByCriteria(criteria, offset, pageSize);
	}
	
	@Override
	public List<Banji> bgQueryByPage(int offset, int rows, Banji banji) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Banji.class);
		criteria.add(Restrictions.like("number", banji.getNumber()+"%"))
		.add(Restrictions.like("classname", banji.getClassname()+"%"));
		if(banji.getGrade()!=null){
			criteria.add(Restrictions.eq("gid", banji.getGrade().getGid()+""));
		}
		
		return this.hibernateTemplate.findByCriteria(criteria,offset,rows);
	}


}
