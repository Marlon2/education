package cn.edu.education.action.bg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.service.UserService;
import cn.edu.education.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.education.domain.User;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction  extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private User user;
	private String error;
	private String imageCode;
	HttpServletRequest request;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Override
	public String execute() throws Exception {
		System.out.println(user.getUsername()+"--"+user.getPassword()+"--"+imageCode);
		// 获取Session
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(user.getUsername())||StringUtil.isEmpty(user.getPassword())){
			error="用户名或密码为空！";
			return ERROR;
		}
		if(StringUtil.isEmpty(imageCode)){
			error="验证码为空！";
			return ERROR;
		}
		if(!imageCode.equals(session.getAttribute("sRand"))){
			error="验证码错误！";
			return ERROR;
		}
		
		User currentUser = this.userService.loginValidate(user);
		if (currentUser == null) {
			error = "用户名或密码错误！";
			return ERROR;
		} else {
			session.setAttribute("currentUser", currentUser);
			if (currentUser.getRole().equals("管理员") ) {
				return "admin";
			} else {
				return "user";
			}
		}
	}
	
	public String logout() throws Exception {
		//获取session
		HttpSession session=request.getSession();
		session.removeAttribute("currentUser");
		return "logout";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
}
