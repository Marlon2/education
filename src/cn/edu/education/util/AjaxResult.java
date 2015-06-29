package cn.edu.education.util;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;

public class AjaxResult implements Result{

	@Override
	public void execute(ActionInvocation invocation) throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		String message = ActionContext.getContext().getValueStack().findString("result");
		System.out.println("message:"+message);
		response.getWriter().print(message);
		
	}

}
