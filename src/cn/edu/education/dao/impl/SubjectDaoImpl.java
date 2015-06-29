package cn.edu.education.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.SubjectDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Subject;

@Repository("subjectDao")
public class SubjectDaoImpl extends BaseDaoImpl<Subject> implements SubjectDao<Subject>{

	@Override
	public List<Subject> queryByPage(int offset, int rows) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Subject.class);
		return this.hibernateTemplate.findByCriteria(criteria, offset, rows);
	}

}
