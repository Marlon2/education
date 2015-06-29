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
import cn.edu.education.domain.User;
import cn.edu.education.service.UserService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction<User> implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String userId; 
	private String delIds;// 批量删除数据的序列号
	
	HttpServletRequest request;
	
	@Resource(name="userService")
	private UserService userService;
	
	public String allUsers(){
		JSONObject result = this.userService.getResult( rows,page);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String add(){
		User user = new User();
		BeanUtils.copyProperties(this.getModel(), user);		
		this.userService.saveUser(user);
		return action2action;
	}
	public String update(){
		User user = new User();
		BeanUtils.copyProperties(this.getModel(), user);
		//判断userId是否为空
		if(StringUtil.isNotEmpty(userId)){
			user.setUid(Long.parseLong(userId));
		}		
		this.userService.updateUser(user);
		return action2action;
	}
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.userService.deleteUser(Long.parseLong(ids[i]));
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
		return listAction;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
}
