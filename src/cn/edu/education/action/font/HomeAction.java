package cn.edu.education.action.font;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.domain.Content;
import cn.edu.education.domain.Teacher;
import cn.edu.education.service.ContentService;
import cn.edu.education.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;

@Controller("homeAction")
@Scope("prototype")
public class HomeAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	@Resource(name="contentService")
	private ContentService contentService;
	@Resource(name="teacherService")
	private TeacherService teacherService;
	
	private List<Content> today_topic;
	private List<Content> prizes;
	private List<Content> slides;
	private List<Teacher> teachers1;

	public String init(){
		today_topic = (List<Content>) contentService.getTopicContents();
		teachers1 = (List<Teacher>) teacherService.getGirlTeachers();
		prizes = (List<Content>) contentService.getPrizeContents();
		slides = (List<Content>) contentService.getSlidesContents();
		System.out.println("home_init");
		return SUCCESS;
	}

	public List<Content> getToday_topic() {
		return today_topic;
	}

	public void setToday_topic(List<Content> today_topic) {
		this.today_topic = today_topic;
	}

	public List<Content> getPrizes() {
		return prizes;
	}

	public void setPrizes(List<Content> prizes) {
		this.prizes = prizes;
	}

	public List<Content> getSlides() {
		return slides;
	}

	public void setSlides(List<Content> slides) {
		this.slides = slides;
	}

	public List<Teacher> getTeachers1() {
		return teachers1;
	}

	public void setTeachers1(List<Teacher> teachers1) {
		this.teachers1 = teachers1;
	}
	
}
