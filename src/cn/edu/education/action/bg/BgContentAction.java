package cn.edu.education.action.bg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Content;
import cn.edu.education.service.ContentService;
import cn.edu.education.util.ResponseUtil;

@Controller("bgContentAction")
@Scope("prototype")
public class BgContentAction  extends BaseAction<Content> implements ServletRequestAware{

	private int page;// 第几页
	private int rows;// 每页记录数
	
	private String contentId;
	private String cid;
	private String delIds;// 批量删除数据的序列号
	
	// 查询条件的变量
	private String s_title = "";
	private String s_author = "";
	HttpServletRequest request;
	
	@Resource(name="contentService")
	private ContentService contentService;
	public String allContent(){
		Content content = new Content();
		if(s_title!=null){
			content.setTitle(s_title);
		}
		if(s_author!=null){
			content.setAuthor(s_author);
		}
		JSONObject result = this.contentService.getResult( rows,page,content);
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
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
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_author() {
		return s_author;
	}
	public void setS_author(String s_author) {
		this.s_author = s_author;
	}

}
