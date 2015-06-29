package cn.edu.education.action.font;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.google.code.kaptcha.Constants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.edu.education.domain.Grade;
import cn.edu.education.domain.Student;
import cn.edu.education.domain.Teacher;
import cn.edu.education.service.GradeService;
import cn.edu.education.service.StudentService;
import cn.edu.education.service.TeacherService;

@Controller("registerAction")
@Scope("prototype")
public class RegisterAction extends ActionSupport{

	private String vcode;
	private String message="";
	private String succmessage="";
	
	private Student student;
	private Long grade_id;
	private String password2;
	
	private Teacher teacher;
	
	@Resource(name="studentService")
	private StudentService studentService;
	@Resource(name="teacherService")
	private TeacherService teacherService;
	@Resource(name="gradeService")
	private GradeService gradeService;
	public String saveStudent() throws Exception {
		if(checkCode()){
			return INPUT;
		}
		String grade_name = gradeService.getGradeById(grade_id).getName();
		Grade grade = new Grade();
		grade.setGid(grade_id);
		grade.setName(grade_name);
		Date registertime  = new Date();
		student.setGrade(grade);
		student.setRegistertime(registertime);
		
		studentService.saveStudent(student);
		succmessage= "注册成功，请登录。";
		return SUCCESS;
	}
	
	public String saveTeacher(){
		if(checkCode()){
			return "teacherinput";
		}
		this.teacherService.saveTeacher(teacher);
		return SUCCESS;
	}
	

	private boolean checkCode() {
		// 1,要进行验证码的判断
		String serverCode = (String) ActionContext.getContext().getSession()
				.get(Constants.KAPTCHA_SESSION_KEY);
		System.out.println("验证码" + serverCode);
		if (!serverCode.equalsIgnoreCase(vcode)) {
			message = "验证码不一致，请重新输入！";
			return true;
		}
		return false;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Long getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(Long grade_id) {
		this.grade_id = grade_id;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getSuccmessage() {
		return succmessage;
	}

	public void setSuccmessage(String succmessage) {
		this.succmessage = succmessage;
	}
}
