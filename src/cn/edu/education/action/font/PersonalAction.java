package cn.edu.education.action.font;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class PersonalAction extends ActionSupport {

	public String init() throws Exception{
		
		return "success";
	}
}
