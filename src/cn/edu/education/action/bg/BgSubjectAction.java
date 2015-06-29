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
import cn.edu.education.domain.Subject;
import cn.edu.education.service.SubjectService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("bgSubjectAction")
@Scope("prototype")
public class BgSubjectAction extends BaseAction<Subject> implements ServletRequestAware{

	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String subjectId; 
	private String delIds;// 批量删除数据的序列号
	@Resource(name="subjectService")
	private SubjectService subjectService;
	
	public String allSubjects(){
		JSONObject result = this.subjectService.getResult( rows,page);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String add(){
		Subject subject = new Subject();
		BeanUtils.copyProperties(this.getModel(), subject);
		this.subjectService.saveSubject(subject);
		return action2action;
	}
	public String update(){
		Subject subject = new Subject();
		BeanUtils.copyProperties(this.getModel(), subject);
		if(StringUtil.isNotEmpty(subjectId)){
			subject.setKid(Long.parseLong(subjectId));
		}
		this.subjectService.updateSubject(subject);
		return action2action;
	}
	
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.subjectService.deleteSubject(Long.parseLong(ids[i]));
			}
			result.put("success", "true");
			result.put("delNums", ids.length);
		} catch (NumberFormatException e) {
			result.put("errorMsg", "删除失败");
			e.printStackTrace();
		}
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public String listUI(){
		return "listUI";
	}
	
	HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
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
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

}
