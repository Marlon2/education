package cn.edu.education.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.TeacherDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Teacher;
import cn.edu.education.util.StringUtil;

@Repository("teacherDao")
public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements TeacherDao<Teacher>{

	@Override
	public Collection<Teacher> getGirlTeachers() {
		return this.hibernateTemplate.find("from Teacher where sex='女'");
	}

	@Override
	public List<Teacher> queryByPage(int offset, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Teacher.class);
		return this.hibernateTemplate.findByCriteria(criteria, offset, pageSize);
	}

	@Override
	public List<Teacher> queryByPage(int offset, int rows, Teacher tea) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Teacher.class);
		criteria.add(Restrictions.like("name", "%"+tea.getName()+"%"))
		.add(Restrictions.like("sex", tea.getSex()+"%"))
		.add(Restrictions.like("mobilenumber", tea.getMobilenumber()+"%"));
		return this.hibernateTemplate.findByCriteria(criteria, offset, rows);
	}

	@Override
	public Teacher getTeacherByTel(String tel) {
		List<Teacher> lists =  this.hibernateTemplate.find("from Teacher t where t.mobilenumber=?", tel);
		if(lists.size()==0){
			return null;
		}
		return lists.get(0);
	}

}
