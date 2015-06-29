package cn.edu.education.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.GradeDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Grade;

@Repository("gradeDao")
public class GradeDaoImpl extends BaseDaoImpl<Grade> implements GradeDao<Grade>{

	@Override
	public List<Grade> queryByPage(int offset, int rows) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Grade.class);
		return this.hibernateTemplate.findByCriteria(criteria, offset, rows);
	}

}
