package cn.edu.education.action.bg;

import java.util.Collection;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Grade;
import cn.edu.education.service.GradeService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("gradeAction")
@Scope("prototype")
public class GradeAction extends BaseAction<Grade> implements ServletRequestAware{

	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String gradeId; 
	private String delIds;// 批量删除数据的序列号
	HttpServletRequest request;
	
	@Resource(name="gradeService")
	private GradeService gradeService;
	
	public String allGrades(){
		JSONObject result = this.gradeService.getResult( rows,page);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String add(){
		Grade grade = new Grade();
		BeanUtils.copyProperties(this.getModel(), grade);
		this.gradeService.saveGrade(grade);
		return action2action;
	}
	public String update(){
		Grade grade = new Grade();
		BeanUtils.copyProperties(this.getModel(), grade);
		if(StringUtil.isNotEmpty(gradeId)){
			grade.setGid(Long.parseLong(gradeId));
		}
		this.gradeService.updateGrade(grade);
		return action2action;
	}
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.gradeService.deleteGrade(Long.parseLong(ids[i]));
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
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("gid", "");
		jsonObject.put("name", "请选择...");
		jsonArray.add(jsonObject);
		Collection<Grade> list = this.gradeService.getAllGrade();
		
		for (Grade grade : list) {
			JSONObject mapOfColValues=new JSONObject();
			mapOfColValues.put("gid", grade.getGid().toString());
			mapOfColValues.put("name", grade.getName());
			jsonArray.add(mapOfColValues);
		}
		//System.out.println("array"+jsonArray.toString());
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String listUI(){
		return "listUI";
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

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

}
