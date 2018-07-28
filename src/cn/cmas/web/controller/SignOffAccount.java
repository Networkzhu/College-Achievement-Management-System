package cn.cmas.web.controller;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.formbean.User;
import cn.cmas.service.StudentService;

public class SignOffAccount extends ActionSupport {
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		StudentService ss = new StudentService();
		//获得当前session中的用户
		User currentUser = (User) session.get("user");
		if(currentUser == null || currentUser.getLevel()!=1)
			return "illegal";
		ss.signOffAccount(currentUser.getId());
		return "sucess";
	}
}