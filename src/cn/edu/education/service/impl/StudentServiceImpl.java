package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.StudentDao;
import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Student;
import cn.edu.education.service.StudentService;
import cn.edu.education.util.StringUtil;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Resource(name="studentDao")
	private StudentDao studentDao;
	@Override
	public Student getStudentById(Serializable id) {
		return (Student) this.studentDao.getEntityById(id);
	}

	@Override
	public Collection<Student> getAllStudent() {
		return this.studentDao.getAllEntity();
	}

	@Override
	public void saveStudent(Student student) {
		this.studentDao.saveEntity(student);
	}

	@Override
	public void updateStudent(Student student) {
		this.studentDao.updateEntity(student);
	}

	@Override
	public void deleteStudent(Serializable id) {
		this.studentDao.deleteEntity(id);
	}

	@Override
	public Student getStudentByTel(String tel) {
		return this.studentDao.getStudentByTel(tel);
	}

	@Override
	public JSONObject getResult(int rows, int page, Student stu) {
		int offset = rows * (page -1);
		List<Student> list = this.studentDao.queryByPage(offset, rows,stu);
		int total = list.size();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (Student student : list) {
			sb.append("{").append("sid:"+student.getSid()+",")
			  .append("name:'"+student.getName()+"',")
			  .append("sex:'"+student.getSex()+"',")
			  .append("mobilenumber:'"+student.getMobilenumber()+"',")
			  .append("password:'"+student.getPassword()+"',")
			  .append("gname:'"+student.getGrade().getName()+"',")
			  .append("birthday:'"+student.getBirthday()+"',")
			  .append("email:'"+StringUtil.isNull(student.getEmail())+"',")
			  .append("address:'"+StringUtil.isNull(student.getAddress())+"'},");
		}
		String str = sb.substring(0, sb.length()-1)+"]";
		//System.out.println("jsonArray"+str);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(str);
		result.put("rows", jsonArray);
		result.put("total", total);
		//System.out.println("listsize"+list.size()+"-"+total);
		return result;
	}

}
