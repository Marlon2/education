package cn.edu.education.action.bg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Teacher;
import cn.edu.education.service.TeacherService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("bgTeacherAction")
@Scope("prototype")
public class BgTeacherAction extends BaseAction<Teacher> implements ServletRequestAware {

	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String teacherId; 
	private String delIds;// 批量删除数据的序列号
	HttpServletRequest request;
	
	// 查询条件的变量
	private String s_teacherName = "";
	private String s_sex = "";
	private String s_mobilenumber = "";
	@Resource(name="teacherService")
	private TeacherService teacherService;
	public String allTeacher(){
		Teacher teacher = new Teacher();
		if(s_teacherName!=null){
			teacher.setName(s_teacherName);
			teacher.setSex(s_sex);
			teacher.setMobilenumber(s_mobilenumber);
		}
		JSONObject result = this.teacherService.getResult( rows,page,teacher);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String add(){
		Teacher teacher = new Teacher();
		BeanUtils.copyProperties(this.getModel(), teacher);
		this.teacherService.saveTeacher(teacher);
		return action2action;
	}
	public String  update(){
		Teacher teacher = new Teacher();
		BeanUtils.copyProperties(this.getModel(), teacher);
		if(StringUtil.isNotEmpty(teacherId)){
			teacher.setTid(Long.parseLong(teacherId));
		}
		this.teacherService.updateTeacher(teacher);
		return action2action;
	}
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.teacherService.deleteTeacher(Long.parseLong(ids[i]));
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
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}
	public String getS_teacherName() {
		return s_teacherName;
	}
	public void setS_teacherName(String s_teacherName) {
		this.s_teacherName = s_teacherName;
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

}
