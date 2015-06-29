package cn.edu.education.action.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.ParameterizedType;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {

	private Class classt;
	private T t;

	public BaseAction() {
		try {

			ParameterizedType type = (ParameterizedType) this.getClass()
					.getGenericSuperclass();
			this.classt = (Class) type.getActualTypeArguments()[0];
			this.t = (T) this.classt.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static final String LISTACTION = "listAction";
	public static final String ADDUI = "addUI";
	public static final String UPDATEUI = "updateUI";
	public static final String ACTION2ACTION = "action2action";
	public String listAction = LISTACTION;
	public String updateUI = UPDATEUI;
	public String addUI = ADDUI;
	public String action2action = ACTION2ACTION;

	@Override
	public T getModel() {
		return this.t;
	}
	
	/*public Map<String, Object> getSession(){
		return ActionContext.getContext().getSession();
	}
	*//**
	 * get response by ServletActionContext
	 * @return response
	 *//*
	public HttpServletResponse getResponse(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		return response;
	}*/
	
	/**
	 * get request by ServletActionContext
	 * @return request
	 *//*
	public HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	
	*//**
	 * open PrintWrite
	 * @return pw
	 *//*
	public PrintWriter getWriter(){
		HttpServletResponse response = this.getResponse();
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pw;
	}
	
	*//**
	 * close PrintWrite
	 * @param pw
	 *//*
	public void close(PrintWriter pw){
		if (pw != null) {
			pw.close();
		}
	}
	
	*//**
	 * write json string
	 * @param json
	 *//*
	public void outJson(String json){
		PrintWriter pw = this.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}*/
}
