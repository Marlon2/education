package cn.edu.education.action.font;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.domain.Teacher;
import cn.edu.education.service.TeacherService;
import cn.edu.education.util.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("teacherAction")
@Scope("prototype")
public class TeacherAction extends ActionSupport{

	private Long id;
	private Teacher teacher,entity,sessions;
	@Resource(name="teacherService")
	private TeacherService teacherService;
	
	// 分页
	private int page;
	private PageBean<Teacher> pageBean;

	public String init() {
		teacher = teacherService.getTeacherById(id);
		return SUCCESS;
	}

	public String add() {
		return "add";
	}

	public String teacherList() {
		// 表示每页显示5条记录，page表示当前网页
		pageBean = teacherService.getPageBean(3, page);
		return "list";
	}
	
	
	//老师登陆
	
	private String username;
	private String password;
	private String login_msg;
	public String login(){
		Teacher teacher1 = this.teacherService.getTeacherByTel(username);
		if(teacher1==null){
			login_msg = "用户名不存在！";
		}else {
			if(!teacher1.getPassword().equals(password)){
				login_msg="密码错误！";
				return "login_out";
			}
			ActionContext.getContext().getSession().put("teacher_admin", teacher1);
			return "login";
		}
		return "login_out";
	}
	/**
	 * 查询教师的个人信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String detail() throws Exception {
		sessions = (Teacher) ActionContext.getContext().getSession()
				.get("teacher_admin");
		if (sessions == null) {
			return "login";
		}

		return "detail";
	}

	public String course() throws Exception {
		sessions = (Teacher) ActionContext.getContext().getSession()
				.get("teacher_admin");
		id =sessions.getTid(); 
		teacher = teacherService.getTeacherById(id);
		return "course";
	}

	/**
	 * 更新教师的个人信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		// System.out.println(entity.getTid());
		// System.out.println(entity.getName());
		Teacher teacher = teacherService.getTeacherById(entity.getTid());
		teacher.setName(entity.getName());
		teacher.setSex(entity.getSex());
		teacher.setBirthday(entity.getBirthday());
		teacher.setMobilenumber(entity.getMobilenumber());
		teacher.setEmail(entity.getEmail());
		// BeanUtils.copyProperties(entity, t1);
		teacherService.updateTeacher(teacher);
		ActionContext.getContext().getSession().put("teacher_admin", teacher);
		return "update";
	}

	/**
	 * 更改教师的密码
	 * @return
	 * @throws Exception
	 */
	public String saveUI() throws Exception {
		sessions = (Teacher) ActionContext.getContext().getSession()
				.get("teacher_admin");
		if (sessions == null) {
			return "login";
		}
		return "saveUI";
	}
	
	/**
	 * 更改教师的密码
	 * @return
	 * @throws Exception
	 */
	public String savePWD() throws Exception {
		Teacher teacher = teacherService.getTeacherById(entity.getTid());
		teacher.setPassword(entity.getPassword());
		teacherService.updateTeacher(teacher);
		ActionContext.getContext().getSession().put("teacher_admin", teacher);
		return "update";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean<Teacher> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Teacher> pageBean) {
		this.pageBean = pageBean;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLogin_msg() {
		return login_msg;
	}

	public void setLogin_msg(String login_msg) {
		this.login_msg = login_msg;
	}

	public Teacher getEntity() {
		return entity;
	}

	public void setEntity(Teacher entity) {
		this.entity = entity;
	}

	public Teacher getSessions() {
		return sessions;
	}

	public void setSessions(Teacher sessions) {
		this.sessions = sessions;
	}
}
