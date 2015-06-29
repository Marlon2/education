package cn.edu.education.action.bg;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Grade;
import cn.edu.education.domain.Student;
import cn.edu.education.service.StudentService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("bgStudentAction")
@Scope("prototype")
public class BgStudentAction extends BaseAction<Student> implements ServletRequestAware{

	private static final long serialVersionUID = 1L;

	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String studentId; 
	private String delIds;// 批量删除数据的序列号
	HttpServletRequest request;
	
	// 查询条件的变量
	private String s_studentName = "";
	private String s_sex = "";
	private String s_mobilenumber = "";
	
	//添加学生变量
	private Long gid;
	
	@Resource(name="studentService")
	private StudentService studentService;
	public String allStudent(){
		Student stu = new Student();
		if(s_studentName!=null){
			stu.setName(s_studentName);
			stu.setSex(s_sex);
			stu.setMobilenumber(s_mobilenumber);
		}
		
		JSONObject result = this.studentService.getResult( rows,page,stu);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String add(){
		Student student = new Student();
		BeanUtils.copyProperties(this.getModel(), student);
		Grade grade = new Grade();
		grade.setGid(gid);
		student.setGrade(grade);
		//获取当前日期
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		try {
			student.setRegistertime(df.parse(df.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.studentService.saveStudent(student);
		return action2action;
	}
	
	public String update(){
		System.out.println("update"+studentId);
		Student student = new Student();
		BeanUtils.copyProperties(this.getModel(), student);
		if(StringUtil.isNotEmpty(studentId)){
			student.setSid(Long.parseLong(studentId));
		}
		Grade grade = new Grade();
		grade.setGid(gid);
		student.setGrade(grade);
		this.studentService.updateStudent(student);
		return action2action;
	}
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.studentService.deleteStudent(Long.parseLong(ids[i]));
			}
			result.put("success", "true");
			result.put("delNums", ids.length);
		} catch (Exception e) {
			result.put("errorMsg", "删除失败");
			e.printStackTrace();
		}
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String list(){
		return "list";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}
	public String getS_studentName() {
		return s_studentName;
	}
	public void setS_studentName(String s_studentName) {
		this.s_studentName = s_studentName;
	}
	public String getS_sex() {
		return s_sex;
	}
	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}
	public String getS_mobilenumber() {
		return s_mobilenumber;
	}
	public void setS_mobilenumber(String s_mobilenumber) {
		this.s_mobilenumber = s_mobilenumber;
	}
	public Long getGid() {
		return gid;
	}
	public void setGid(Long gid) {
		this.gid = gid;
	}

}
