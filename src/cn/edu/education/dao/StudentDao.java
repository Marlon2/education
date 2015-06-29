package cn.edu.education.dao;

import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Student;

public interface StudentDao<T> extends BaseDao<T>{

	public Student getStudentByTel(String tel);

	public List<Student> queryByPage(int offset, int rows, Student stu);

}
