package cn.cmas.web.controller;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Quit extends ActionSupport {
	private static final long serialVersionUID = 1L;

	public String quit() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		session.clear();
		return "Quited";
	}
}