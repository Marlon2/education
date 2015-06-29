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
import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Grade;
import cn.edu.education.service.BanjiService;
import cn.edu.education.util.ResponseUtil;
import cn.edu.education.util.StringUtil;

@Controller("bgBanjiAction")
@Scope("prototype")
public class BgBanjiAction extends BaseAction<Banji> implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String banjiId;
	private String gid;
	private String delIds;// 批量删除数据的序列号
	
	// 查询条件的变量
	private String s_number = "";
	private String s_name = "";
	private String s_gid;
	
	
	@Resource(name="banjiService")
	private BanjiService banjiService;
	public String allBanji(){
		Banji banji = new Banji();
		if(s_number!=null){
			banji.setNumber(s_number);
		}
		if(s_name!=null){
			banji.setClassname(s_name);;
		}
		if(s_gid!=null){
			Grade grade = new Grade();
			grade.setGid(Long.parseLong(s_gid));
			banji.setGrade(grade);
		}
		JSONObject result = this.banjiService.getResult( rows,page,banji);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String add(){
		System.out.println("banji_add");
		Banji banji = new Banji();
		BeanUtils.copyProperties(this.getModel(), banji);
		if(StringUtil.isNotEmpty(gid)){
			Grade grade = new Grade();
			grade.setGid(Long.parseLong(gid));
			banji.setGrade(grade);
		}
		this.banjiService.saveBanji(banji);
		return action2action;
	}
	
	public String update(){
		Banji banji = new Banji();
		BeanUtils.copyProperties(this.getModel(), banji);
		if(StringUtil.isNotEmpty(gid)){
			Grade grade = new Grade();
			grade.setGid(Long.parseLong(gid));
			banji.setGrade(grade);
		}
		banji.setBid(Long.parseLong(banjiId));
		this.banjiService.updateBanji(banji);
		return action2action;
	}
	public String delete(){
		JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.banjiService.deleteBanji(Long.parseLong(ids[i]));
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
	public String listUI(){
		return "listUI";
	}
	HttpServletRequest request;
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
	
	public String getBanjiId() {
		return banjiId;
	}

	public void setBanjiId(String banjiId) {
		this.banjiId = banjiId;
	}

	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}
	public String getS_gid() {
		return s_gid;
	}
	public void setS_gid(String s_gid) {
		this.s_gid = s_gid;
	}
	public String getS_number() {
		return s_number;
	}
	public void setS_number(String s_number) {
		this.s_number = s_number;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

}
