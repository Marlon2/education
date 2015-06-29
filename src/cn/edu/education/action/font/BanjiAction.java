package cn.edu.education.action.font;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.domain.Banji;
import cn.edu.education.service.BanjiService;
import cn.edu.education.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

@Controller("banjiAction")
@Scope("prototype")
public class BanjiAction extends ActionSupport{

	@Resource(name="banjiService")
	private BanjiService banjiService;
	//分页
	private int page;
	private PageBean<Banji> pageBean;
	
	private String searchWord;
	public String init(){
		//表示每页显示5条记录，page表示当前网页
        pageBean = this.banjiService.getPageBean(3, page);
		return SUCCESS;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public PageBean<Banji> getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean<Banji> pageBean) {
		this.pageBean = pageBean;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}
