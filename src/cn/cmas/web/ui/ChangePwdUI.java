package cn.cmas.web.ui;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.formbean.User;

public class ChangePwdUI extends ActionSupport {
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		User user = (User) session.get("user");
		if(user == null)
			return "login";
		return "sucess";
	}
}