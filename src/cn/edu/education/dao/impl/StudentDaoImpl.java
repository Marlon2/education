package cn.edu.education.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.StudentDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Student;

@Repository("studentDao")
public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao<Student>{

	@Override
	public Student getStudentByTel(String tel) {
		
		List<Student> lists = this.hibernateTemplate.find("from Student s where s.mobilenumber=?", tel);
		if(lists.size()==0){
			return null;
		}
		return lists.get(0);
	}

	@Override
	public List<Student> queryByPage(int offset, int rows, Student stu) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Student.class);
		criteria.add(Restrictions.like("name", "%"+stu.getName()+"%"))
		.add(Restrictions.like("sex", stu.getSex()+"%"))
		.add(Restrictions.like("mobilenumber", stu.getMobilenumber()+"%"));
		return this.hibernateTemplate.findByCriteria(criteria, offset, rows);
	}

}
