package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Teacher;
import cn.edu.education.util.PageBean;

public interface TeacherService {

	public Teacher getTeacherById(Serializable id);
	public Collection<Teacher> getAllTeacher();
	public void saveTeacher(Teacher teacher);
	public void updateTeacher(Teacher teacher);
	public void deleteTeacher(Serializable id);
	
	public Collection<Teacher> getGirlTeachers();
	public PageBean<Teacher> getPageBean(int pageSize, int page);
	public JSONObject getResult(int rows, int page, Teacher teacher);
	public Teacher getTeacherByTel(String username);
}
