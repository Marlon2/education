package cn.edu.education.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Teacher;

public interface TeacherDao<T> extends BaseDao<T>{

	public Collection<Teacher> getGirlTeachers();

	public List<Teacher> queryByPage(int offset, int pageSize);

	public List<Teacher> queryByPage(int offset, int rows, Teacher teacher);

	public Teacher getTeacherByTel(String tel);
}
