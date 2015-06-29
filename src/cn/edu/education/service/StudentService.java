package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Cart;
import cn.edu.education.domain.Student;

public interface StudentService {

	public Student getStudentById(Serializable id);
	public Collection<Student> getAllStudent();
	public void saveStudent(Student student);
	public void updateStudent(Student student);
	public void deleteStudent(Serializable id);
	
	public Student getStudentByTel(String tel);
	public JSONObject getResult(int rows, int page, Student stu);
	
}
