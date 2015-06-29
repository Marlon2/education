package cn.edu.education.action.font;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Content;
import cn.edu.education.service.ContentService;

@Controller("contentAction")
@Scope("prototype")
public class ContentAction extends BaseAction<Content>{

	private Long cid;
	private Content content;
	@Resource(name="contentService")
	private ContentService contentService;
	
	public String init(){
		System.out.println(cid);
		content = contentService.getContentById(cid);
		//ActionContext.getContext().getValueStack().push(content);
		return SUCCESS;
	}



	public Long getCid() {
		return cid;
	}



	public void setCid(Long cid) {
		this.cid = cid;
	}



	public Content getContent() {
		return content;
	}
	public void setContent(Content content) {
		this.content = content;
	}
	
}
